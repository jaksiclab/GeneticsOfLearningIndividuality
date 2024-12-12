include(joinpath(@__DIR__, "header.jl"))

using MultivariateStats, ColorSchemes, ComponentArrays, CairoMakie
import LaplacianExpectationMaximization as LEM

function compare_agents(policies)
    [FlyRL.average_hellinger(pi, pj) for pi in policies, pj in policies]
end
function compare_start_end_agents(policies)
    FlyRL.average_hellinger.(first.(policies), last.(policies))
end
function compare_genotypes(res)
    policies = []
    model = res.result[1]["config"].model()
    for r in eachrow(res)
        p = ComponentArray(LEM._set_params_to_population_mean!(r.result["population_parameters"]), ημ_shock = 0.)
        push!(policies, _policies(model, p))
    end
    compare_agents(policies)
end
function _policies(model, p)
    test_data = [(s = 1, shock = false, green = false),
                 (s = 2, shock = false, green = false),
                 (s = 3, shock = false, green = true),
                 (s = 3, shock = true, green = true)]
    FlyRL.policy.(test_data, Ref(model), Ref(p))
end
function policies(row, gs)
    g = gs[(genotype = row.genotype,)]
    ps = [ComponentArray(p, ημ_shock = 0.) for p in row.result["parameters"]]
    model = row.result["config"].model()
    data = row.result["config"].preprocessor().(g.track)
    models = [FlyRL.logp_tracked(d, model, p).history for (d, p) in zip(data, ps)]
    DataFrame(genotype = g.genotype, shocked = g.shocked,
              policies = [_policies.(m, Ref(p)) for (m, p) in zip(models, ps)])
end

res = load(joinpath(DATADIR, "fit_results.jld2"))["results"]

tmp = res[(res.dir .== "shared5") .& ismissing.(res.cv), :]
sort!(tmp, :genotype)
d_g = compare_genotypes(tmp)
_pols = vcat(policies.(eachrow(tmp), Ref(DATA))...);
sort!(_pols, :genotype)
d_start = compare_agents(first.(_pols.policies))
d_end = compare_agents(last.(_pols.policies))
start_end_policies = DataFrame(genotype = _pols.genotype, shocked = _pols.shocked, delta_policy = compare_start_end_agents(_pols.policies))

CSV.write(joinpath(DATADIR, "delta_policy.csv"), start_end_policies)

α = 3
rot = [cos(α) sin(α)
       -sin(α) cos(α)]
mds_g = rot * 2 * predict(fit(MDS, d_g, distances = true, maxoutdim = 2))
mds_start = predict(fit(MDS, d_start, distances = true, maxoutdim = 2))
mds_end = predict(fit(MDS, d_end, distances = true, maxoutdim = 2))

specialg = ["dgrp362", "dgrp563", "dgrp879", "dnc1"]
specialcolors = [:cyan, :red, :darkred, :pink]
COLORDICT = Dict(g => c for (g, c) in zip(specialg, specialcolors))
IDXS = (x -> [[i for i in 1:length(tmp.genotype) if i ∉ x]; x])(findall(∈(specialg), tmp.genotype))
IDXS2 = (x -> [[i for i in 1:length(_pols.genotype) if i ∉ x]; x])(findall(∈(specialg), _pols.genotype))
function _color(genotype, shocked)
    haskey(COLORDICT, genotype) && return COLORDICT[genotype]
    return (:gray70, .3)
end
function segments(p1, p2, g1, g2, g, onlysame = false)
    [vcat([[p1[dim, i], p2[dim, j]] for i in findall(==(g), g1), j in findall(==(g), g2) if (onlysame && (i == j)) || !onlysame]...) for dim in 1:2]
end
function _condcolor(df, g)
    c = ifelse.(df[df.genotype .== g, :shocked], :gold, :gray)
    [(ci, .3) for ci in c]
end

f = Figure();
ax = Makie.Axis(f[1, 1], xticks = ([0, 2, 4], ["genotype", "before experiment", "after experiment"]), yticks = [-100])
for i in eachindex(specialg)
    linesegments!(ax, segments(mds_g, mds_start .+ [2, 0], tmp.genotype, _pols.genotype, specialg[i])..., color = _condcolor(_pols, specialg[i]), linewidth = 1)
    linesegments!(ax, segments(mds_start .+ [2, 0], mds_end .+ [4, 0], _pols.genotype, _pols.genotype, specialg[i], true)..., color = _condcolor(_pols, specialg[i]), linewidth = 1)
end
scatter!(ax, mds_g[:, IDXS], markersize = 5, color = _color.(tmp.genotype[IDXS], false))
scatter!(ax, mds_start[:, IDXS2] .+ [2, 0], markersize = 3, color = _color.(_pols.genotype[IDXS2], _pols.shocked))
scatter!(ax, mds_end[:, IDXS2] .+ [4, 0], markersize = 3, color = _color.(_pols.genotype[IDXS2], _pols.shocked))
xlims!(ax, -.5, 5)
axislegend(ax, [PolyElement(polycolor = COLORDICT[g]) for g in specialg],
               specialg, position = :lb)
f

save(joinpath(FIGURESDIR, "policy_comparison.png"), f)



function change_plot(ss; f = Figure(size = (600, 350)), color = [:gray, :gold])
    dodge = ss.shocked .+ 1
    shocked = ss.dodge
    xticklabelrotation = .8
    xticks = (1:3, ["data", "learning", "no learning"])
    ax1 = Makie.Axis(f[1:4, 2]; xticks, xticklabelrotation, ylabel = "change in log(escape duration)")
    boxplot!(ax1, shocked, ss.logescape_duration_change; color = color[dodge], dodge = dodge)
    # boxplot(ss[ss.genotype .== "dgrp362", :].shocked, ss[ss.genotype .== "dgrp362", :].T_shock_change)
    ax2 = Makie.Axis(f[1:4, 3]; xticks, xticklabelrotation, ylabel = "change in T_shocked")
    boxplot!(ax2, shocked, ss.T_shock_change; color = color[dodge], dodge = dodge)
    ax3 = Makie.Axis(f[1:4, 1]; xticks, xticklabelrotation, ylabel = "change in handedness")
    ssd = dropmissing(ss[:, [:shocked, :handedness_change, :dodge]])
    dodge = ssd.shocked .+ 1
    shocked = ssd.dodge
    boxplot!(ax3, shocked, ssd.handedness_change; color = color[dodge], dodge = dodge)
    Legend(f[5, 1:3], [PolyElement(polycolor = c) for c in color],
                    ["control", "conditioned"], nbanks = 3)
    f
end

sum_stats = load(joinpath(DATADIR, "sum_stats.jld2"))["sum_stats"]

sim_sum_stats = load(joinpath(DATADIR, "sim_sum_stats_0:6:144.jld2"))["sim_sum_stats"]
sim_sum_stats_best = sim_sum_stats[1][1] # could do it also with other seeds.
sim_sum_stats_no_learning = sim_sum_stats[1][2]

allsumstats = vcat(sum_stats, sim_sum_stats_best, sim_sum_stats_no_learning);
allsumstats.dodge = repeat(1:3, inner = nrow(sum_stats))
allsumstats.label = ["data", "learning", "no learning"][allsumstats.dodge]
f = change_plot(allsumstats)
save(joinpath(DATADIR, "change_figures.png"), f)

