include(joinpath(@__DIR__, "header.jl"))

config = (preprocessor = FlyRL.turn_escapetime_preprocessor,
          model = FlyRL.TurnEscapeModel,
          shared = (:ηw, :ημ, :ηgreen, :cw, :cμ))

Estep_optimizer = LaplacianExpectationMaximization.OptimOptimizer(LaplacianExpectationMaximization.Optim.LBFGS(), f_calls_limit = 5*10^4)

FlyRL.maximize_logp(vcat(DATA...).track, config;
                    return_g! = true, verbosity = 2,
                    savedir = joinpath(@__DIR__, "..", "data"),
                    genotype = "no_genetics",
                    fixed = (; ημ_shock = 0.),
                    seed = 1,
                    eval_n_samples = 10^3,
                    optimizer_options = (; Estep_optimizer,
                                           derivative_threshold = 1e-1,
                                           iterations = 10));

FlyRL.maximize_logp(vcat(DATA...).track, config;
                    return_g! = true, verbosity = 2,
                    savedir = joinpath(@__DIR__, "..", "data"),
                    genotype = "no_genetics_no_learning",
                    fixed = (; ημ_shock = 0., ηw = 0., ημ = 0., ηgreen = 0.,
                               cw = 1., cμ = 1.),
                    seed = 1,
                    eval_n_samples = 10^3,
                    optimizer_options = (; Estep_optimizer,
                                           derivative_threshold = 1e-1,
                                           iterations = 10));

