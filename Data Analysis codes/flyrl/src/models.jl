"""
    Model(agent, preprocessor)

Makes a model.
"""
struct Model{A, P}
    agent::A
    preprocessor::P
end
parameters(model::Model) = parameters(model.agent)
function Model(config)
    preprocessor = config.preprocessor()
    Model(F.PopulationModel(config.model(),
                            haskey(config, :prior) ? config.prior : F.DiagonalNormalPrior(),
                           config.shared),
          preprocessor)
end

sigmoid(w) = 1/(1 + exp(-w))
logsigmoid(x) = -log1pexp(-x)

@concrete struct TurnEscapeModel
    μs # escape duration mean; can change with learning
    ws # controls probability to turn right; can change with learning
    n_shock # number of times the fly has been shocked
end
function TurnEscapeModel()
    TurnEscapeModel(zeros(3), zeros(3), Ref(0))
end
parameters(::TurnEscapeModel) = (; w₀ = 0., μ₀ = 0., Δμ_shock = 0., Δμ_green = 0., σ = 0., ηw = 0., ημ = 0., ημ_shock = 0., ηgreen = 0., ημ_time = 0., cw = 0., cμ = 0.)
function initialize!(model::TurnEscapeModel, parameters)
    model.μs .= parameters.μ₀
    model.ws .= parameters.w₀
    model.n_shock[] = 0
end
 # the effective learning rate decreases with every shock
effective_lr(η, n_shock, c) = η/(n_shock[]*c + 1)
function _μ_ρ_w(Δμ_shock, shock, Δμ_green, green, μs, ws, s)
    # the effective escape duration depends on the current average escape duration for the given arm, and whether the fly experiences shock and/or green color.
    μ = μs[s] + shock * Δμ_shock + green * Δμ_green
    μ, sigmoid(ws[s]), ws[s]
end
function unpack(model, parameters)
    # parameters are transformed to stay in reasonable bounds
    (; Δμ_shock, Δμ_green, ηw, ημ, ημ_shock, ηgreen, ημ_time) = parameters
    cμ = 1e3*sigmoid(parameters.cμ) + 1e-3
    cw = 1e3*sigmoid(parameters.cw) + 1e-3
    σ = log1pexp(parameters.σ) + eps()
    (; μs, ws, n_shock) = model
    (; Δμ_shock, Δμ_green, ηw, ημ, ημ_shock, ηgreen, ημ_time, cμ, cw, σ, μs, ws, n_shock)
end
function logp(data, model::TurnEscapeModel, parameters)
    initialize!(model, parameters)
    (; Δμ_shock, Δμ_green, ηw, ημ, ημ_shock, ηgreen,
       ημ_time, cμ, cw, σ, μs, ws, n_shock) = unpack(model, parameters)
    logp = 0.
    for (s, shock, green, s′, shock′, green′, turn, Δt, t) in data
        # get parameters for current policy
        μ, ρ, w = _μ_ρ_w(Δμ_shock, shock, Δμ_green, green, μs, ws, s)
        # evaluate the log probability of the current escape duration
        logp += logpdf(LogNormal(μ, σ), Δt)
        # stop when 20 minutes are reached (t is measured in seconds)
        t ≥ 1200. && break
        # evalute the log probability of turning right (turn = 1) or left.
        logp += logsigmoid((2*turn-1) * w)
        # learning
        if shock
            n_shock[] += 1 # increase the shock counter
            μs .+= effective_lr(ημ, n_shock, cμ) # change mean escape duration
            μs[3] += effective_lr(ημ_shock, n_shock, cμ) # change mean escape duration
        end
        # change probability to turn right because of shock
        ws[s] += effective_lr(ηw, n_shock, cw) * shock′ * (turn - ρ)
        # change probability to turn right because of green color
        ws[s] += ηgreen * green′ * (turn - ρ)
        # change escape duration (flies tend to speed up over time).
        μs .+= ημ_time * Δt/60
    end
    logp
end
# turn = 1: right
# s = 1: neutral right, s = 2: neutral left, s = 3: shock
function next_state(s, turn, shocked)
    s == 1 && turn == 1 && return (2, false)
    s == 1 && turn == 0 && return (3, shocked)
    s == 2 && turn == 1 && return (3, shocked)
    s == 2 && turn == 0 && return (1, false)
    s == 3 && turn == 1 && return (1, false)
    (2, false)
end
function sample(rng, data, model::TurnEscapeModel, parameters;
        shocked = true, green_arm = 3, max_t = 1200.)
    (; Δμ_shock, Δμ_green, σ, μs, ws, n_shock) = unpack(model, parameters)
    (; s′, shock′, green′, t) = last(data)
    μ, ρ, = _μ_ρ_w(Δμ_shock, shock′, Δμ_green, green′, μs, ws, s′)
    Δt = rand(rng, LogNormal(μ, σ))
    turn = ρ ≥ rand(rng)
    s′′, shock′′ = next_state(s′, turn, shocked)
    t = t + Δt
    if t > max_t
        Δt -= t - max_t
        t = max_t
    end
    (; s = s′, shock = shock′, green = green′, s′ = s′′, shock′ = shock′′, green′ = s′′ == green_arm, turn, Δt, t)
end
function policy(data, model::TurnEscapeModel, parameters)
    (; Δμ_shock, Δμ_green, σ, μs, ws, n_shock) = unpack(model, parameters)
    (; s, shock, green) = data
    μ, ρ, = _μ_ρ_w(Δμ_shock, shock, Δμ_green, green, μs, ws, s)
    (Categorical([ρ, 1-ρ]), LogNormal(μ, σ))
end
