###
### Helper
###

function _ret(res, col, state)
    sort!(res, :state)
    state === :all && return res
    state ∈ res.state && return getproperty(res, col)[res.state .== state][]
#     @warn("$state not in $(res.state)")
    0.
end
function _group(track, maxT)
    s = s_prev = 0.
    for (i, r) in pairs(eachrow(track))
        s += getΔt(r)
        if s ≥ maxT
            if s ≈ maxT
                return track[1:i, :], i, 0.
            else
                tr = track[1:i-1, :]
                push!(tr, [r[1:end-1]..., maxT - s_prev])
                return tr, i, maxT - s_prev
            end
        end
        s_prev = s
    end
    return track, nrow(track), 0.
end
getΔt(df) = hasproperty(df, :state_Δt) ? df.state_Δt : hasproperty(df, :arm_Δt) ? df.arm_Δt : df.Δt
function split_track_equal_durations(track, n)
    t = sum(getΔt(track))
    Δ = t/n
    tracks = typeof(track)[]
    remaining_track = track
    for _ in 1:n
        tr, i, cut = _group(remaining_track, Δ)
        push!(tracks, tr)
        remaining_track = remaining_track[i:end, :]
        if cut == 0
            popfirst!(remaining_track)
        else
            getΔt(remaining_track)[1] -= cut
        end
    end
    tracks
end
function per_interval(func, n, track; encoder = identity, state = "shock")
    tracks = split_track_equal_durations(track, n)
    func.(tracks; encoder, state)
end

function turn_repetition(track; encoder = identity, state = :mean)
    tmp = combine(groupby(encoder(track), :state),
            :turn_escapetime => (x -> begin
                turns = first.(x)
                if sum((!).(ismissing.(turns))) > 1
                    mean(skipmissing(turns[1:end-1] .== turns[2:end]))
                else
                    missing
                end
            end) => :turn_repetitions)
    if state === :mean
        if sum((!).(ismissing.(tmp.turn_repetitions))) > 1
            mean(skipmissing(tmp.turn_repetitions))
        else
            missing
        end
    end
end
"""
$SIGNATURES

Compute relative duration per arm. Return result for `state`.
"""
function rel_duration(track; encoder = _duration_encoder(), state = :all)
    _track = encoder(track)
    res = combine(groupby(_track, :state), :state_Δt => sum => :rel_duration)
    res.rel_duration ./= sum(res.rel_duration)
    _ret(res, :rel_duration, state)
end
"""
$SIGNATURES

Compute relative speed per arm. Return result for `state`.
"""
function rel_speed(track; encoder = _speed_encoder(), state = :all, op = mean)
    _track = encoder(track)
    res = combine(groupby(_track, :state), :speed => op => :rel_speed)
    res.rel_speed ./= op(_track.speed) + eps() # to avoid NaN
    _ret(res, :rel_speed, state)
end
"""
$SIGNATURES

Compute relative idleness per arm. Return result for `state`.
"""
function rel_idleness(track; encoder = _speed_encoder(), state = :all, op = mean)
    _track = encoder(track)
    res = combine(groupby(_track, :state), [:speed, :Δt] => ((s, t) -> sum(t[s .== 0])) => :rel_idleness)
    res.rel_idleness ./= sum(res.rel_idleness) + eps() # to avoid NaN
    _ret(res, :rel_idleness, state)
end
"""
$SIGNATURES

Compute relative number of visits. Return result for `state`.
"""
function rel_visits(track; encoder = _duration_encoder(), state = :all)
    _track = encoder(track)
    res = combine(groupby(_track, :state), :state => length => :rel_visits)
    res.rel_visits ./= sum(res.rel_visits)
    _ret(res, :rel_visits, state)
end
"""
    spearman(func, track; n = 10, state = "shock")

Compute Spearman correlation for `track` of quantity extracted with `func`
(e.g. [`rel_duration`](@ref), [`rel_speed`](@ref), [`rel_idleness`](@ref),
 [`rel_visits`](@ref)) with the interval id (1 to `n`) on which the function is evaluated.
Return the result for `state` (="shock" by default, could be `:all`).
Note that the track should contain a `Δt` or `state_Δt` column; see e.g.
[`spearmanrelduration`](@ref).
"""
function spearman(func, track; n = 10, kw...)
    d = per_interval(func, n, track; kw...)
    std(d) == 0 ? 0. : corspearman(d, 1:n)
end
"""
    spearmanrelduration(track, durations([track])[]) = spearman(rel_duration, durations)

See [`spearman`](@ref).
"""
function spearmanrelduration(track, durations = durations(track); kw...)
    spearman(rel_duration, durations; kw...)
end
"""
    spearmanrelvisits(track, durations([track])[]) = spearman(rel_visits, durations)

See [`spearman`](@ref).
"""
function spearmanrelvisits(track, durations = durations(track); kw...)
    spearman(rel_visits, durations; kw...)
end

function _duration_encoder(; filter_center = true)
    ShockArmEncoder() |>
    (filter_center ? filter_center! : identity) |>
    DurationPerStateEncoder(:state) |>
    df -> begin df.state_logΔt = log.(df.state_Δt); df end |>
    t -> select(t, [:state, :arm, :t, :state_logΔt, :state_Δt])
end
function _duration7_encoder(; filter_center = true)
    SemanticEncoder7() |>
    DurationPerStateEncoder(:se7) |>
    t -> select(t, [:se7, :se7_Δt])
end
function _speed_encoder(; filter_center = true)
    SpeedEncoder() |>
    ShockArmEncoder() |>
    (filter_center ? filter_center! : identity) |>
    df -> select(df, [:state, :speed, :Δt]) |>
    dropmissing!
end

_skipmissing_median(x) = sum(x .!== missing) > 0 ? median(skipmissing(x)) : missing
function escape_duration_analyzer(track; filter_center = true)
    pipe = ShockArmEncoder() |>
           SemanticEncoder7() |>
           (filter_center ? filter_center! : identity) |>
           SpeedEncoder() |>
           DynamicCompressEncoder(:se7,
                                  :se7_Δt => (df, i1, i2) -> df.t[i2] - df.t[i1],
                                  :speed => (df, i1, i2) -> df.speed[i1:i2-1],
                                  (Symbol(n) => (df, i1, i2) -> median(getproperty(df, n)[i1:i2-1]) ≥ .5
                                  for n in names(track, r"shock"))...) |>
           DynamicCompressEncoder(:state,
                                  :state_Δt => (df, i1, i2) -> df.t[i2] - df.t[i1],
                                  :turn_Δt => (df, i1, i2) -> sum(df.se7_Δt[i1:i2-1][(!).(isnothing.(match.(r"turn", string.(df.se7[i1:i2-1]))))]),
                                  :median_speed => (df, i1, i2) -> _skipmissing_median(vcat(df.speed[i1:i2-1]...)),
#                                   :se7_Δt => (df, i1, i2) -> df.se7_Δt[i1:i2-1],
#                                   :se7 => (df, i1, i2) -> df.se7[i1:i2-1],
                                  ) |>
    df -> begin
        df.logstate_Δt = log.(df.state_Δt)
        df.logturn_Δt = log.(df.turn_Δt)
        df
    end |>
    df -> select(df, [:state, :state_Δt, :logstate_Δt, :median_speed, :turn_Δt, :logturn_Δt, :shock])
    pipe(track)
end

"""
    durations(tracks)

Compute the durations in each state for every track in `tracks`.
Run `durations([track])` for a single `track`.
"""
function durations(tracks::AbstractVector;
        encoder = _duration_encoder())
    durations.(tracks; encoder)
end
function durations(track; encoder = _duration_encoder())
    encode(encoder, track) |> DataFrame
end

"""
    speeds(tracks)

Compute the speeds in each state for every track in `tracks`.
Run `speeds([track])` for a single `track`.
"""
function speeds(tracks::AbstractVector; encoder = _speed_encoder())
    speeds.(tracks; encoder)
end
function speeds(track; encoder = _speed_encoder())
    encode(encoder, track) |> DataFrame
end

function escape_shock_duration(durations; kw...)
    idxs = durations.state .== "shock"
    x = durations.state_logΔt[idxs]
    length(x) > 0 ? mean(x) : missing
end
handedness(track; kw...) = abs(lateralization(track))

function _change(x)
    length(x) < 2 && return missing
    x[end] - x[1]
end
function _changes(x)
    length(x) < 2 && return missing
    Ref(x[2:end] .- x[1])
end
_relvisits(x; kw...) = sum(x.state .== "shock")/length(x.state)
function _meanlogΔtnoshock(x; kw...)
    y = x.state_logΔt[x.state .!= "shock"]
    length(y) == 0 && return missing
    mean(y)
end
function _meanlogΔtshock(x; kw...)
    y = x.state_logΔt[x.state .== "shock"]
    length(y) == 0 && return missing
    mean(y)
end
_meanlogΔt(x; kw...) = mean(x.state_logΔt)
function _meanlogΔts(df, f = _meanlogΔtnoshock, n = 8)
    nrow(df) ≤ 2 && return missing
    x = per_interval(f, n, df)
    any(ismissing, x) ? missing : Ref(x)
end
# this can be made faster by splitting tracks only once
function summary_stats(track)
    durations = FlyRL.durations(track)
    idx = findfirst(==("shock"), durations.state)
    durations_before = durations[1:(isnothing(idx) ? nrow(durations) : min(1, idx-1)), :]
    durations_after = durations[(isnothing(idx) ? nrow(durations) : idx):end, :]
    (; T_shock = rel_duration(durations, encoder = identity, state = "shock"),
       T_shock_change = _change(per_interval(rel_duration, 4, durations)),
       T_shock_traj = Ref(per_interval(rel_duration, 8, durations)),
       logescape_duration_mean = mean(durations.state_logΔt),
       logescape_shock_duration_mean = escape_shock_duration(durations),
       logescape_shock_duration_mean_change = _change(per_interval(escape_shock_duration, 4, durations)),
       logescape_duration_std = std(durations.state_logΔt),
       logescape_duration_change = _change(per_interval(_meanlogΔt, 4, durations)),
       logescape_durations = _meanlogΔts(durations, _meanlogΔt, 8),
       logescape_durations_before = _meanlogΔts(durations_before),
       logescape_durations_after = _meanlogΔts(durations_after),
       logescape_durationsS_before = _meanlogΔts(durations_before, _meanlogΔtshock),
       logescape_durationsS_after = _meanlogΔts(durations_after, _meanlogΔtshock),
       spearman_relduration = spearmanrelduration(track, durations),
       spearman_relvisits = spearmanrelvisits(track, durations),
       lateralization = lateralization(track),
       handedness = handedness(track),
       relvisits = _relvisits(durations),
       relvisits_traj = Ref(per_interval(_relvisits, 8, durations)),
       relvisits_change = _change(per_interval(_relvisits, 4, durations)),
       handedness_change = _change(per_interval(handedness, 4, durations)),
       lateralization_change = _change(per_interval(lateralization, 4, durations)),
       n_decisions = nrow(durations)-1)
end
