using Distributed
@everywhere begin
    using FlyRL, LaplacianExpectationMaximization
    import FlyRL: load_populations, drop, maximize_logp, CVFold
end
@info "Loaded."

encode(s) = replace(s, "MU" => "μ", "SIGMA" => "σ", "DELTA" => "Δ",
                       "ETA" => "η", "_0" => "₀")
config = eval(Meta.parse(encode(ARGS[1])));
DATA = FlyRL.load_populations();
if hasproperty(config, :genotypes)
    DATA = DATA[config.genotypes]
end
@show config
list = collect(Iterators.product(DATA, (config,)))

@sync @distributed for (g, config) in list
    savedir = joinpath(@__DIR__, "..", "data", config.dir)
    fn = FlyRL.save_result_filename(savedir, g.genotype[1], seed = config.options.seed)
    if !isfile(fn)
        train_tracks, test_tracks = config.tracks(g)
        maximize_logp(train_tracks,
                      drop(config, :options, :tracks, :dir, :genotypes);
                      savedir = savedir,
                      test_tracks,
                      evaluate_training = true,
                      config.options...)
    end
end
