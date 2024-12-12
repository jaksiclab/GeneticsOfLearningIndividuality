function maximize_logp(tracks::AbstractVector, config;
        savedir = nothing, genotype = FileNames.genotype(_track_fn(tracks[1])),
        seed = Int(time_ns()),
        eval_n_samples = 10^4,
        test_tracks = [],
        kw...)
    Random.seed!(seed)
    model = Model(config)
    data = preprocess.(Ref(model.preprocessor), tracks)
    test_data = preprocess.(Ref(model.preprocessor), test_tracks)
    _res = F.maximize_logp(data, model.agent;
                           evaluate_test_data = isempty(test_data) ? nothing : test_data,
                           evaluation_options = (; n_samples = eval_n_samples),
                           kw...)
    res = results(_res.logp, _res.population_parameters, _res.parameters, config, tracks, F.drop(_res, (:logp, :population_parameters, :parameters)))
    if !isnothing(savedir)
        fn = save_result_filename(savedir, genotype; seed)
        save_result(fn, res)
    end
    res
end

_track_fn(track::DataFrame) = metadata(track)["filename"]
_track_fn(tracks::AbstractVector{<:DataFrame}) = _track_fn.(tracks)
function results(logp, population_parameters, parameters, config, tracks, extra = nothing)
    (; logp, population_parameters, parameters, config, tracks = _track_fn(tracks), extra, rev = __REV__[])
end

function save_result_filename(savedir, genotype; kw...)
    joinpath(savedir, genotype * (length(kw) > 0 ? "-" : "") *
                      join(["$key=$value" for (key, value) in kw], "-") *
                      ".jld2")
end
function save_result(fn, results)
    mkpath(joinpath(splitpath(fn)[1:end-1]...))
    try
        _tmpfn = tempname() * ".jld2"
        jldsave(_tmpfn; results...)
        mv(_tmpfn, fn)
    catch e
        @warn "Didn't save checkpoint $fn."
        @info e
    end
end

function stratified_cv_indices(df, fields, num_folds, fold_num; idxs = :both)
    if fold_num < 1 || fold_num > num_folds
        error("Fold number must be between 1 and the number of folds.")
    end
    gidxs = groupby(df, fields) |> groupindices
    idxs = [findall(==(i), gidxs) for i in union(gidxs)]
    fold_sizes = [length(idx) ÷ num_folds + 1 for idx in idxs]
    fold_indices = vcat([idx[(fold_num-1)*N+1:min(length(idx), fold_num*N)]
                         for (idx, N) in zip(idxs, fold_sizes)]...)
    rest = setdiff(1:nrow(df), fold_indices)
    if idxs === :train
        rest
    elseif idxs === :test
        fold_indices
    else
        rest, fold_indices
    end
end
struct CVFold
    num_folds::Int
    fold::Int
end
function (c::CVFold)(g)
    train_idxs, test_idxs = stratified_cv_indices(g, :shocked, c.num_folds, c.fold)
    g.track[train_idxs], g.track[test_idxs]
end
