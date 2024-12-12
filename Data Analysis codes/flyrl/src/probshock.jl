probshock(agent) = probarm(agent, 3)
probneutralright(agent) = probarm(agent, 1)
probneutralleft(agent) = probarm(agent, 2)
proball(agent) = probarm(agent, eachindex(agent.π))
function probarm(agent, i)
    Din = size(agent.model.w, 2)
    agent = deepcopy(agent)
    if Din ≥ 3
        s = [[0., 0, 1]; fill(0., Din-3)]
        nl = [[0., 1, 0]; fill(0., Din-3)]
        nr = [[1., 0, 0]; fill(0., Din-3)]
        mean([FlyRL.softmax!(agent.π, agent.model, x)[i]
              for x in [s, nl, nr]])
    elseif Din == 1
        softmax!(agent.π, agent.model, [1.])[i]
    end
end
deltaprobshock(model, track, θ) = last(delta(proball, model, track, θ).deltaprobarm)
deltaproball(model, track, θ) = delta(proball, model, track, θ)
function delta(probarm, model, track, θ)
    initialize!(model.agent.model, θ)
    s1 = probarm(model.agent)
    logprob(model, track, θ)
    s2 = probarm(model.agent)
    (deltaprobarm = s2 - s1, initprobarm = s1, finalprobarm = s2)
end

