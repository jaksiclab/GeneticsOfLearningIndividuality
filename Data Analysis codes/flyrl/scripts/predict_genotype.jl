include(joinpath(@__DIR__, "header.jl"))

using Lux, MLUtils, Random, Printf, Statistics, Optimisers, Zygote, OneHotArrays

function prepad(seq, L; pad = zero(first(seq)))
    [fill(pad, L-length(seq)); seq]
end
function postpad(seq, L; pad = zero(first(seq)))
    [seq; fill(pad, L-length(seq))]
end
function length_embedding(lengths)
    [exp(-(l - c)^2/(2*10^2)) for c in range(2, 382, length = 20), l in lengths]
end
function data_loader(data;
        batchsize = 128, pad = prepad, shuffle = true, idxs_train, idxs_test,
        only_length = false,
        target_transform = x -> onehotbatch(x, 1:90))
    input = first.(data)
    L = maximum(length.(input))
    if only_length
        input = f32(length_embedding(length.(input)))
    else
        input = f32(cat([hcat(pad(i, L)...) for i in input]..., dims = 3))
    end
    target = target_transform(last.(data))
    DataLoader(collect.((getobs(input, idxs_train), getobs(target, idxs_train))); batchsize = min(batchsize, length(idxs_train)), shuffle),
    DataLoader(collect.((getobs(input, idxs_test), getobs(target, idxs_test))); batchsize = min(batchsize, length(idxs_test)), shuffle = false)
end

function GenotypeClassifierCompact(in_dims, hidden_dims, out_dims; cell = LSTMCell)
    Chain(Recurrence(cell(in_dims => hidden_dims)),
          Chain(Dense(hidden_dims => hidden_dims, relu), Dense(hidden_dims, out_dims)))
end

logitcrossentropy(y_pred, y) = mean(-sum(y .* logsoftmax(y_pred); dims=1))

function loss(model, ps, st, (x, y))
    y_pred, st = model(x, ps, st)
    return logitcrossentropy(y_pred, y), st, (; y_pred)
end
accuracy(y_pred, y) = sum(onecold(y_pred, 1:90) .== onecold(y, 1:90))/sum(y)
function evaluate(model, ps, st, data)
    totalloss = 0.
    totalacc = 0.
    for (x, y) in data
        _loss, st, ret = loss(model, ps, st, (x, y))
        totalacc += accuracy(ret.y_pred, y)
        totalloss += _loss
    end
    totalloss/length(data), totalacc/length(data)
end

function train(model, data_train, data_test;
               epochs = 20, opt = Adam(), rng = Xoshiro(12),
               loss = loss, evaluate = evaluate, progress_interval = 10)
    ps, st = Lux.setup(rng, model)
    train_state = Training.TrainState(model, ps, st, opt)
    lc = []
    t0 = time()
    for epoch in 1:epochs
        for (x, y) in data_train
            gs, _loss, _, train_state = Training.compute_gradients(AutoZygote(), loss, (x, y), train_state)
            train_state = Training.apply_gradients(train_state, gs)
        end
        st_ = Lux.testmode(train_state.states)
        t1 = time()
        if t1 - t0 > progress_interval
            t0 = t1
            trainloss, trainacc = evaluate(model, train_state.parameters, st_, data_train)
            testloss, testacc = evaluate(model, train_state.parameters, st_, data_test)
            @printf "Epoch [%3d]: Train Loss %4.5g Test Loss %4.5g Train Accuracy %4.5g Test Accuracy %4.5g\n" epoch trainloss testloss trainacc testacc
            push!(lc, (trainloss, testloss, trainacc, testacc))
        end
    end
    return (; ps = train_state.parameters, st = train_state.states, lc, train_state, opt)
end
function get_loaders(data; only_length = false, nfolds = 4)
    tracks = vcat(data...).track
    prep = FlyRL.genotype_predictor_preprocessor()
    _data = [getproperty.(Ref(d), (:input, :target)) for d in prep.(tracks)];
    [begin
        idxs_train, idxs_test = FlyRL.stratified_cv_indices(vcat(data...), [:genotype, :shocked],
                                                            nfolds, i, idxs = :both)
        data_loader(_data; only_length, idxs_train, idxs_test)
     end for i in 1:nfolds]
end

# Recurrent
loaders = get_loaders(DATA)
m = GenotypeClassifierCompact(5, 32, 90)
res = [train(m, loaders[i][1], loaders[i][2], epochs = 50) for i in 1:4]

test_accuracy = mean(evaluate(m, res[i].ps, res[i].st, loaders[i][2])[2] for i in 1:4)
@info "LSTM test accuracy = $test_accuracy"

# FeedForward
loadersff = get_loaders(DATA, only_length = true)
mff = Lux.Chain(layer1 = Dense(20 => 32, relu),
                layer2 = Dense(32 => 32, relu),
                layer3 = Dense(32 => 90))
resff = [train(mff, loadersff[i][1], loadersff[i][2], epochs = 100) for i in 1:4]

test_accuracyff = mean(evaluate(mff, resff[i].ps, resff[i].st, loadersff[i][2])[2] for i in 1:4)
@info "Feed-forward test accuracy = $test_accuracyff"

JLD2.jldsave(joinpath(DATADIR, "predict_genotype.jld2"); res, resff)
