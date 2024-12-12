decode(s) = replace(s, "μ" => "MU", "σ" => "SIGMA", "Δ" => "DELTA",
                       "η" => "ETA", "₀" => "_0")
function runai(i, config)
    ["runai", "submit",
     "--name", "fly-$i",
     "--image", "julia:1.11.2",
     "--pvc", "runai-lcn1-brea-scratch:/mnt/scratch",
     "--run-as-user",
     "--cpu", "30",
     "--cpu-limit", "30",
     "--memory", "150G",
     "--memory-limit", "150G",
     "-e", "JULIA_DEPOT_PATH=/mnt/scratch/brea/.julia",
     "-e", "JULIA_PROJECT=/mnt/scratch/brea/FlyRL/scripts",
     "--",
     "julia", "-p", "30",
     "/mnt/scratch/brea/FlyRL/scripts/fit.jl", "'$(decode(config))'"]
end
_merge(s1, s2) = s1[1:end-1] * ", " * s2[2:end]
function cv(config, dir, nfolds = 4)
    [_merge(config, """(dir = \"$dir-CV$i\", tracks = CVFold($nfolds, $i))""")
     for i in 1:nfolds]
end
function alltracks(config, dir)
    _merge(config, """(dir = \"$dir\", tracks = g -> (g.track, []))""")
end
function popfit(config; seed = 1, fixed = (; ημ_shock = 0.), shared = (), EM = true)
    maximize_options = EM ? """optimizer_options = (; iterations = 10, Estep_optimizer = LaplacianExpectationMaximization.OptimOptimizer(LaplacianExpectationMaximization.Optim.LBFGS(), f_calls_limit = 5*10^4))""" :
                            """lambda_l2 = 1e-9"""
    _merge(config, """(shared = $shared, options = (; fixed = $fixed, seed = $seed,  $maximize_options))""")
end

configs = Dict(
"turnescape" =>
"""(preprocessor = FlyRL.turn_escapetime_preprocessor, model = FlyRL.TurnEscapeModel)""",
)

confs = let confs = []
    _confs = configs["turnescape"]
    _confs = popfit(_confs,
                    shared = (),
                    fixed = (ηw = 0., ημ = 0., ημ_shock = 0., ηgreen = 0., ημ_time = 0.,  cw = 1., cμ = 1.))
    _confs_cv = cv(_confs, "no_learning")
    _confs_all = alltracks(_confs, "no_learning")
    confs = [confs; _confs_cv; _confs_all]
    for shared in (
                   (:w₀, :μ₀, :σ, :Δμ_shock, :Δμ_green, :ηw, :ημ, :ηgreen, :ημ_time, :cw, :cμ),
                   (:ηw, :ημ, :ηgreen, :cw, :cμ),
                  )
        _confs = configs["turnescape"]
        _confs = popfit(_confs; shared, EM = length(shared) < 11)
        _confs_cv = cv(_confs, "shared$(length(shared))")
        _confs_all = alltracks(_confs, "shared$(length(shared))")
        confs = [confs; _confs_cv; _confs_all]
    end
    confs
end

for (i, config) in pairs(confs)
    run(Cmd(runai(i, config)))
    sleep(3)
end
