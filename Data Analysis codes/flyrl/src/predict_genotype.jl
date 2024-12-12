struct GenotypePredictor{E,R,D,L}
    encoder::E
    recurrent::R
    decoder::D
    latent::L
end
function GenotypePredictor(; T = Float64, Din = 5, Dlatent = 10, Dout = 90,
        hidden_activation = relu, encoder_layers = Int[], recurrent_layers = Int[], decoder_layers = [],
        batchsize = 1)
    elayers = Int[Din; encoder_layers; Dlatent]
    rlayers = Int[Dlatent; recurrent_layers; Dlatent]
    dlayers = Int[Dlatent; decoder_layers; Dout]
    GenotypePredictor(MLP(elayers; T, hidden_activation),
                      MLP(rlayers; T, hidden_activation),
                      MLP(dlayers; T, hidden_activation),
                      zeros(T, Dlatent))
end
function params(p::GenotypePredictor)
    ComponentArray(; encoder = params(p.encoder),
                     recurrent = params(p.recurrent),
                     decoder = params(p.decoder),
                     latent = zero(p.latent))
end
function Base.zero(p::GenotypePredictor)
    GenotypePredictor(zero(p.encoder), zero(p.recurrent), zero(p.decoder), zero(p.latent))
end
function zero!(p::GenotypePredictor)
    zero!(p.encoder)
    zero!(p.recurrent)
    zero!(p.decoder)
    zero!(p.latent)
    p
end
function initialize!(p::GenotypePredictor, params)
    initialize!(p.encoder, params.encoder)
    initialize!(p.recurrent, params.recurrent)
    initialize!(p.decoder, params.decoder)
    p.latent .= params.latent
end
function logsoftmax(logit, t)
    logit[t] - logsumexp(logit)
end
function _run!(p, input, params)
    initialize!(p, params)
    latent = p.latent
    for inp in input
        a1 = p.encoder(inp)
        a2 = p.recurrent(latent)
        @. latent = relu(a1 + a2)
    end
    out = p.decoder(latent)
end
function _predict(p, input, params)
    out = _run!(p, input, params)
    softmax(out)
end
function logprob!(res, p::GenotypePredictor, input, target, ::Any, params, id = nothing)
    out = _run!(p, input, params)
    res[] = logsoftmax(reshape(out, :), target)
    nothing
end
