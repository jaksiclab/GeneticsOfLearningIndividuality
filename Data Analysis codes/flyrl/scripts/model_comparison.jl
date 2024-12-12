include(joinpath(@__DIR__, "header.jl"))
using ComponentArrays, CategoricalArrays, Random
import LaplacianExpectationMaximization as LEM

###
### Helper
###

_genotype(x) = split(x, ('.', '-'))[1]
number_of_decisions(track) = length(FlyRL.turn_escapetime_preprocessor()(track))
function loadfiles(dir, gs, ndecfn)
    l_path = joinpath(DATADIR, dir)
    isdir(l_path) || return DataFrame(genotype = [], dir = [], cv = [], result = [],
                                      ndec_train = [], ndec_test = [], k = [])
    files = readdir(l_path)
    result = load.(joinpath.(l_path, files))
    genotype = _genotype.(files)
    ndec_train = [sum(getindex.(Ref(ndecfn), r["tracks"])) for r in result]
    ndec_test = [sum(getindex.(Ref(ndecfn), setdiff(getindex.(metadata.(gs[(genotype[i],)].track), "filename"), result[i]["tracks"]))) for i in eachindex(result)]
    k = [length(r["population_parameters"].population_parameters) + length(r["config"].shared)
         for r in result]
    split_dir_names = split(dir, '-')
    DataFrame(; genotype, dir = first(split_dir_names), cv = length(split_dir_names) > 1 ? last(split_dir_names) : missing,
              result, ndec_train, ndec_test, k)
end
function model_comparison(res)
    _res = combine(groupby(res, [:genotype, :dir]),
                   [:result, :cv] => ((x, cv) -> any(ismissing, cv) ? Ref(x[findfirst(ismissing, cv)]["extra"].training_logp[end]) : missing) => :logp,
                   [:result, :cv] => ((x, cv) -> all(ismissing.(cv)) ? missing : Ref(sum([r["extra"].test_logp[end] for r in x[(!).(ismissing.(cv))]]))) => :logp_cv,
                   :k => first => :k,
                   [:ndec_train, :ndec_test, :cv] => ((nt, n, cv) -> all(ismissing.(cv)) ? nt[1] : sum(n[(!).(ismissing.(cv))])) => :n)
    _res.mean_logp = (lp -> ismissing(lp) ? missing : mean(lp)).(_res.logp)
    _res.mean_logp_cv = (lp -> ismissing(lp) ? missing : mean(lp)).(_res.logp_cv)
    _res.mean_logp_cv_a = _res.mean_logp_cv ./ _res.n
    _res.mean_BIC = ((lp, k, n) -> ismissing(lp) ? missing : LEM.BIC(lp, k, n)).(_res.mean_logp, _res.k, _res.n)
    _res
end
function mpost(bic, β = 1)
    p = exp.(-β * (bic .- minimum(bic))/2)
    Ref(p ./ sum(p))
end

modelnames = Dict(
                  "shared11" => "identical flies (k = 11)",
                  "shared5" => "individual flies (k = 17)",
                  "no_learning" => "no learning (k = 10)",
                 )

###
### Load Data
###

NDECFN = Dict(metadata(t)["filename"] => number_of_decisions(t)
              for t in vcat(DATA...).track)
dirs = vcat([["$i$k" for k in ("", "-CV1", "-CV2", "-CV3", "-CV4")]
             for i in ["shared11", "no_learning", "shared5"]]...)

resfile = joinpath(DATADIR, "fit_results.jld2")
res = if isfile(resfile)
    load(resfile)["results"]
else
    vcat(loadfiles.(dirs, Ref(DATA), Ref(NDECFN))...)
    JLD2.jldsave(joinpath(DATADIR, "fit_results.jld2"); results = res)
end

###
### Model Comparison
###

_mres = model_comparison(res)
sort!(_mres, [:genotype, :dir])
mres = combine(groupby(_mres, :genotype),
               :mean_logp_cv_a => (x -> Ref(-x .+ maximum(x))) => :logp_cv_rel,
               :mean_BIC => (x -> mpost(x, 1)) => :posterior,
               :mean_BIC => (x -> Ref(log.(mpost(x, 1)[]))) => :logposterior,
               :mean_BIC => (x -> Ref(x .- minimum(x))) => :mean_BIC_rel,
               :dir => (x -> Ref(x)) => :dir)


model_comparison_df = vcat([DataFrame(genotype = r.genotype,
                                      model = getindex.(Ref(modelnames), r.dir),
                                      delta_logp = r.logp_cv_rel,
                                      delta_BIC = r.mean_BIC_rel,
                                      posterior = r.posterior)
                            for r in eachrow(mres)]...)

CSV.write(joinpath(DATADIR, "model_comparison.csv"), model_comparison_df)

no_genetics = load(joinpath(DATADIR, "no_genetics-seed=1.jld2"))
no_genetics_n_params = (x -> length(x) - length(x.population_parameters.μ) - 1)(no_genetics["population_parameters"]) # -1 because ημ_shock = 0. in fit_no_genetics.jl

no_genetics_logp = let model = FlyRL.Model(no_genetics["config"])
    data = FlyRL.preprocess.(Ref(model.preprocessor), vcat(DATA...).track)
    LEM.mc_marginal_logp(data, model.agent, no_genetics["population_parameters"], repetitions = 1)[]
end

function bic_all(res, dirs)
    other = [begin
                 tmp = res[(res.dir .== dir) .& ismissing.(res.cv), :]
                 LEM.BIC(sum(getindex.(tmp.result, "logp")),
                       sum(tmp.k), sum(tmp.ndec_train))
             end
             for dir in dirs]
    [LEM.BIC(no_genetics_logp, no_genetics_n_params, sum(values(NDECFN)));
     other]
end

_dirs = ["no_learning", "shared11", "shared5"]
BIC_df = DataFrame(names = ["no genetics"; getindex.(Ref(modelnames), _dirs)],
                   BIC = bic_all(res, _dirs))

CSV.write(joinpath(DATADIR, "BIC.csv"), BIC_df)
