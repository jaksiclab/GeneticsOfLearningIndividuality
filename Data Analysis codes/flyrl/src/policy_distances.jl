function hellinger(p1::Union{Normal,LogNormal}, p2::Union{Normal,LogNormal})
    sqrt(1 - sqrt(2*p1.σ*p2.σ/(p1.σ^2 + p2.σ^2))*exp(-(p1.μ - p2.μ)^2/(4*(p1.σ^2 + p2.σ^2))))
end
function hellinger(p1::Categorical, p2::Categorical)
    1/sqrt(2) * sqrt(sum(abs2, sqrt.(p1.p) - sqrt.(p2.p)))
end
function hellinger(p1::Tuple, p2::Tuple; idxs = 1:length(p1))
    1 - prod((1 - hellinger(p1[i], p2[i])^2) for i in idxs)
end
function average_hellinger(p1::AbstractVector{<:Tuple}, p2::AbstractVector{<:Tuple}; kw...)
    mean(hellinger.(p1, p2; kw...))
end
function average_hellinger_path(p1, p2; kw...)
    [average_hellinger(p1[i], p2[i]; kw...) for i in 1:min(length(p1), length(p2))]
end
function policies_at_times(track, policies, times)
    pipe = ShockArmEncoder() |> filter_center! |> DynamicCompressEncoder(:state)
    _track = pipe(track)
    idxs = Int[]
    i = 1
    for t in times
        while i < length(_track.t) && _track.t[i] < t
            i += 1
        end
        push!(idxs, i)
    end
    policies[idxs]
end
function population_average_hellinger_path(tracks, policies; nbins = 20, kw...)
    _policies = policies_at_times.(tracks, policies, Ref(0:(1200÷nbins):1200))
    [average_hellinger_path(_policies[i], _policies[j]; kw...)
     for j in eachindex(policies), i in eachindex(policies) if j > i]
end
function population_average_hellinger_path(tracks, config, θ; nbins = 20, kw...)
    tmp = [track_policy(t, config, θ).policies for t in tracks]
    population_average_hellinger_path(tracks, tmp; nbins, kw...)
end
