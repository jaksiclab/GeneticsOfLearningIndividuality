include("header.jl")
using Random, RCall, CairoMakie, ComponentArrays, CategoricalArrays
import LaplacianExpectationMaximization as LEM

# Simulation
function _simulate(res_row, gs; seed = 1, rng = Xoshiro(seed))
    g = gs[(genotype = res_row.genotype,)]
    result = DataFrame(genotype = String[],
                       trackid = Int[],
                       shocked = Bool[],
                       track = DataFrame[])
    levels = FlyRL.YMaze.ShockArmEncoder().levels[1:3]
    arms = ["L", "R", "M"]
    p = copy(res_row.result["population_parameters"])
    if !haskey(p, :ημ_shock)
        p = ComponentArray(p, ημ_shock = 0.)
    end
    for (i, row) in pairs(eachrow(g))
        init = FlyRL.turn_escapetime_preprocessor()(row.track)[1:1]
        simtrack, = LEM.simulate(FlyRL.TurnEscapeModel(),
                               LEM.resample!(rng, LEM.DiagonalNormalPrior(), p);
                               stop = (data, i) -> data[end].t ≥ 1200 || i > 400,
                               init, rng,
                               shocked = row.shocked)
        states = getproperty.(simtrack, :s)
        push!(result, (res_row.genotype,
                       i,
                       row.shocked,
                       DataFrame(t = getproperty.(simtrack, :t) -
                                     getproperty.(simtrack, :Δt),
                                state = categorical(levels[states];
                                                    levels),
                                arm = categorical(arms[states]; levels = arms),
                                shock = getproperty.(simtrack, :shock))))
    end
    result
end

# Summary stats
function summary_stats(g)
    vcat((x -> DataFrame(; genotype = x.genotype, shocked = x.shocked, trackid = x.trackid, FlyRL.summary_stats(x.track)...)).(eachrow(g))...)
end
function get_sim_sumstats(res, gs, dir; seed = 11)
    rows = (res.dir .== dir) .& (ismissing.(res.cv))
    best_model = res[rows, :]
    simtracks = _simulate.(eachrow(best_model), Ref(gs); seed);
    summary_stats(vcat(simtracks...))
end

# Plotting
const CSHOCK = parse(Makie.Colorant, "#FFD700")
const CNOSHOCK = parse(Makie.Colorant, "#808080")
interleave(x, y) = collect(Iterators.flatten(zip(x, y)))
function shocknoshock_plot(df::AbstractDataFrame, col; op1 = median, op2 = std, f = Figure(), kw...)
    shocknoshock_plot((df, op1), (df, op2), col; f, kw...)
end
_inv(::typeof(identity)) = identity
_inv(::typeof(exp)) = log
_inv(::typeof(log)) = exp
linreg(x, y; xmode, ymode) = [ones(length(x)) xmode.(x)]\ymode.(y)
default(::typeof(linreg)) = linregpred
linregpred(x, coefs; xmode, ymode) = _inv(ymode).(coefs[1] .+ coefs[2] * xmode.(x))
expregpred(x, coefs; xmode, ymode) = _inv(ymode).(exp.(coefs[1] .+ coefs[2] * xmode.(x)))
r2(y, ypred) = 1 - sum(abs2, y - ypred)/sum(abs2, y .- mean(y))
function trendline!(ax, x, y; fit = linreg, pred = default(fit),
        xmode = identity, ymode = identity, samples = 100, kw...)
    coefs = fit(x, y; xmode, ymode)
    xrange = range(minimum(x), maximum(x), length = samples)
    yfit = pred(xrange, coefs; xmode, ymode)
    _r2 = r2(y, pred(x, coefs; xmode, ymode))
    lines!(ax, xrange, yfit; label = "R² = $(round(1e3*_r2)/1e3)", kw...)
end
function shocknoshock_plot((df1, op1), (df2, op2), col; f = Figure(), showgenotypes = [], trendlines = [], kw...)
	ax = Makie.Axis(f[1, 1]; xlabel = "$col $op1", ylabel = "$col $op2", kw...)
    s1 = Symbol(col, "_", op1)
    s2 = Symbol(col, "_", op2)
    _df1 = combine(groupby(sort(df1, [:genotype, :shocked]), [:genotype, :shocked]), col => op1 ∘ skipmissing => s1)
    _df2 = combine(groupby(sort(df2, [:genotype, :shocked]), [:genotype, :shocked]), col => op2 ∘ skipmissing => s2)
    linesegments!(ax, interleave(getproperty(_df1, s1)[_df1.shocked .== true],
                                 getproperty(_df1, s1)[_df1.shocked .== false]),
                      interleave(getproperty(_df2, s2)[_df2.shocked .== true],
                                 getproperty(_df2, s2)[_df2.shocked .== false]),
                      color = :lightblue)
    if :shock ∈ trendlines
       trendline!(ax, getproperty(_df1, s1)[_df1.shocked .== true],
                   getproperty(_df2, s2)[_df2.shocked .== true], color = CSHOCK)
    end
    if :noshock ∈ trendlines
        trendline!(ax, getproperty(_df1, s1)[_df1.shocked .== false],
                   getproperty(_df2, s2)[_df2.shocked .== false], color = CNOSHOCK)
    end
    if :combined ∈ trendlines
        trendline!(ax, getproperty(_df1, s1),
                   getproperty(_df2, s2), color = :black)
    end
    if :identity ∈ trendlines
        _coords = map(op -> op([getproperty(_df1, s1); getproperty(_df2, s2)]),
                      [minimum, maximum])
        lines!(ax, _coords, _coords, color = :gray, linestyle = :dash)
    end
    scatter!(ax, getproperty(_df1, s1), getproperty(_df2, s2),
             color = ifelse.(_df1.shocked, CSHOCK, CNOSHOCK))
    genotypes = _df1.genotype[_df1.shocked .== true]
    idxs = findall(∈(showgenotypes), genotypes)
    text!(ax, getproperty(_df1, s1)[_df1.shocked .== true][idxs],
          getproperty(_df2, s2)[_df2.shocked .== true][idxs],
          text = genotypes[idxs])
    ax
end
function compare(x, s...;
        titles = fill("", length(s)),
        f = Figure(size = (400, 250)), kw...)
    axs = []
    for i in eachindex(s)
        push!(axs, shocknoshock_plot(s[i], x; f = f[1, i], title = titles[i], kw...))
    end
    linkyaxes!(axs...)
    linkxaxes!(axs...)
    f
end

# Simulating Data

res = load(joinpath(DATADIR, "fit_results.jld2"))["results"]

sim_sum_stats = []
for seed in 0:6:144
    sim_sum_stats_best = get_sim_sumstats(res, DATA, "shared5"; seed)
    sim_sum_stats_nolearn = get_sim_sumstats(res, DATA, "no_learning"; seed)
    sim_sum_stats_shared = get_sim_sumstats(res, DATA, "shared11"; seed)
    push!(sim_sum_stats, (sim_sum_stats_best, sim_sum_stats_nolearn, sim_sum_stats_shared))
end

JLD2.jldsave(joinpath(DATADIR, "sim_sum_stats_0:6:144.jld2"); sim_sum_stats)

sum_stats = summary_stats(vcat(DATA...));
sum_stats.learningscore = .5 * sum_stats.spearman_relvisits + .5 * sum_stats.spearman_relduration

JLD2.jldsave(joinpath(DATADIR, "sum_stats.jld2"); sum_stats)
CSV.write(joinpath(DATADIR, "sum_stats.csv"), sum_stats)

all_sum_stats = vcat(sum_stats, vcat([vcat(s...) for s in sim_sum_stats]...));

f = let sim_sum_stats = sim_sum_stats[2]
    with_theme(fontsize = 8) do
        f = Figure(size = (800, 1600));
        titles = ["data", "individual flies", "no learning", "identical flies"]
        compare(:T_shock, sum_stats, sim_sum_stats...; f = f[1, 1], titles, showgenotypes = [])
        compare(:T_shock_change, sum_stats, sim_sum_stats...; f = f[2, 1], titles)
        compare(:logescape_duration_mean, sum_stats, sim_sum_stats...; f = f[3, 1], titles)
        compare(:logescape_duration_change, sum_stats, sim_sum_stats...; f = f[4, 1], titles)
        compare(:logescape_shock_duration_mean, sum_stats, sim_sum_stats...; f = f[5, 1], titles)
        compare(:logescape_shock_duration_mean_change, sum_stats, sim_sum_stats...; f = f[6, 1], titles)
        compare(:spearman_relvisits, sum_stats, sim_sum_stats...; f = f[7, 1], titles)
        compare(:spearman_relduration, sum_stats, sim_sum_stats...; f = f[8, 1], titles)
        compare(:n_decisions, sum_stats, sim_sum_stats...; f = f[9, 1], titles)
        compare(:relvisits, sum_stats, sim_sum_stats...; f = f[10, 1], titles)
        compare(:relvisits_change, sum_stats, sim_sum_stats...; f = f[11, 1], titles)
        f
    end
end

save(joinpath(FIGURESDIR, "summary_stats_comparison.png"), f)


# Quantification

R"""
densityfun <- function(x, mi = 0, ma = 1) {
    d <- splinefun(density(x, from = mi, to = ma, n = 10000L))
    dnz <- function(z) ifelse(z < mi | z > ma, 0, pmax(d(z), 0))
    norm <- integrate(dnz, mi, ma, abs.tol = 1e-12)$value
    function(z) dnz(z)/norm
}
hellinger <- function(x, y, mi = 0, ma = 1) {
    q <- densityfun(x, mi, ma)
    p <- densityfun(y, mi, ma)
    1 - integrate(function(z) sqrt(q(z)*p(z)), mi, ma, abs.tol = 1e-12)$value
}
"""
density_hellinger(x, y) = R"hellinger($x, $y)"[1]

sum_stats_keys = (
     :T_shock,
     :T_shock_change,
     :logescape_duration_mean,
     :logescape_duration_change,
     :spearman_relvisits,
     :spearman_relduration,
     :n_decisions,
     :relvisits,
     :relvisits_change
    )
function _transform(x)
    mi = minimum(x)
    ma = maximum(x)
    x -> (x .- mi) ./ (ma - mi)
end
_getgrouped = let transform = Dict(k => _transform(getproperty(all_sum_stats, k)) for k in sum_stats_keys)
    (k, s) -> [transform[k](getproperty(g, k))
               for g in groupby(sort(s, [:genotype, :shocked]), [:genotype, :shocked])]
end
_shocked(s) = combine(groupby(sort(s, [:genotype, :shocked]), [:genotype, :shocked]),
                      :shocked => first).shocked_first
function compare_sumstats(k, s1, s2)
    x1 = _getgrouped(k, s1)
    x2 = _getgrouped(k, s2)
    density_hellinger.(x1, x2)
end
function compare_sumstats_perrep(k, s1, s2)
    sort!(s1, [:genotype, :shocked])
    sort!(s2, [:genotype, :shocked])
    vcat(compare_sumstats(k, s1[s1.trackid .< 33, :], s2[s1.trackid .< 33, :]),
         compare_sumstats(k, s1[s1.trackid .> 32, :], s2[s1.trackid .> 32, :]))
end

hellinger_distances = Dict()
for k in sum_stats_keys
    haskey(hellinger_distances, k) && continue
    hellinger_distances[k] = [compare_sumstats_perrep(k, sum_stats, sim_sum_stats[j][i])
             for i in eachindex(sim_sum_stats[1]), j in eachindex(sim_sum_stats)]
end

JLD2.jldsave(joinpath(DATADIR, "sum_stat_hellinger_distances.jld2"); hellinger_distances)

reference = Dict()
for k in sum_stats_keys
    reference[k] = compare_sumstats(k,
                                    sum_stats[sum_stats.trackid .< 33, :],
                                    sum_stats[sum_stats.trackid .> 32, :])
end

function plot_densities(sum_stats, key; f = Figure())
    grouped = _getgrouped(key, sum_stats)
    ax = Makie.Axis(f[1, 1])
    xs = 0:.001:1
    all_ys = [[], []]
    for (shocked, g) in zip(_shocked(sum_stats), grouped)
        _f = R"densityfun($g)"
        ys = collect(_f(xs))
        push!(all_ys[shocked+1], ys)
        lines!(ax, xs, ys, color = [(:gray, .4), (:gold, .4)][shocked+1], linewidth = 1)
    end
    lines!(ax, xs, mean(all_ys[1]), color = :gray, linewidth = 4)
    lines!(ax, xs, mean(all_ys[2]), color = :gold, linewidth = 4)
    f
end

# plot_densities(sim_sum_stats[1][1], :relvisits)
# plot_densities(sum_stats, :relvisits)
# plot_densities(sim_sum_stats[1][1], :T_shock)
# plot_densities(sum_stats, :T_shock)

f = with_theme(fontsize = 8) do
    f = Figure(size = (750, 750));
    for (i, k) in pairs(sum_stats_keys)
        v = hellinger_distances[k]
        tmp = [vcat(v[i, :]...) for i in 1:3];
        ax = Makie.Axis(f[(i-1)÷3+1, rem(i-1, 3) + 1], title = string(k), ylabel = "hellinger distance",
                        xticks = (0:3, ["replicates", "individuality", "no learning", "no individuality"]))
        boxplot!(ax, [fill(0, length(reference[k])); fill(1, length(tmp[1])); fill(2, length(tmp[2])); fill(3, length(tmp[3]))], vcat(reference[k], tmp...))
    end
    f
end

save(joinpath(FIGURESDIR, "posterior_predictive_checks_quantification.png"), f)

