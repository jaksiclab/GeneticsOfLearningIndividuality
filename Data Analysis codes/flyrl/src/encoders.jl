function distance2wall(
    x,
    y,
    ox,
    oy;
    stepsize = 0.5,
    max_distance = 30.0,
    scale = max_distance,
)
    for γ = 0:stepsize:max_distance
        in_maze(x + γ * ox, y + γ * oy) || return γ / scale
    end
    return max_distance / scale
end
function distance2wall(e::AbstractEncoder, x, y, ox, oy)
    distance2wall(
        x,
        y,
        ox,
        oy;
        stepsize = e.stepsize,
        max_distance = e.max_distance,
        scale = e.scale,
    )
end
struct Distance2WallsEncoder{E, P} <: AbstractEncoder
    pipe::P
    max_distance::Float64
    scale::Float64
    stepsize::Float64
end
function Distance2WallsEncoder{E}(; max_distance = 40, scale = max_distance, stepsize = 1.5) where E
    pipe = OrientationEncoder()
    Distance2WallsEncoder{E, typeof(pipe)}(pipe, max_distance, scale, stepsize)
end
Distance2WallsEncoder(; kwargs...) = EightWallsEncoder(; kwargs...)
"""
    FourWallsEncoder(; max_distance = 40, scale = max_distance, stepsize = 1.5)

Encodes (x, y, ox, oy)-position-orientation tuples to relative distances to the next wall
at 0, 90, 180 and 270 degrees relative to the orientation.

If the distance of the wall is `max_distance` and `scale == max_distance` the returned
value is 1. The stepsize (in pixels) controls the granularity at which the distance to the
wall is computed.
"""
FourWallsEncoder(; kwargs...) = Distance2WallsEncoder{4}(; kwargs...)
"""
    SixWallsEncoder(; max_distance = 40, scale = max_distance, stepsize = 1.5)

Encodes (x, y, ox, oy)-position-orientation tuples to relative distances to the next wall
at 0, 45, 135, 180, 25 and 315 degrees relative to the orientation.

If the distance of the wall is `max_distance` and `scale == max_distance` the returned
value is 1. The stepsize (in pixels) controls the granularity at which the distance to the
wall is computed.
"""
SixWallsEncoder(; kwargs...) = Distance2WallsEncoder{6}(; kwargs...)
"""
    EightWallsEncoder(; max_distance = 40, scale = max_distance, stepsize = 1.5)

Encodes (x, y, ox, oy)-position-orientation tuples to relative distances to the next wall
at 0, 45, 90, 135, 180, 25, 270 and 315 degrees relative to the orientation.

If the distance of the wall is `max_distance` and `scale == max_distance` the returned
value is 1. The stepsize (in pixels) controls the granularity at which the distance to the
wall is computed.
"""
EightWallsEncoder(; kwargs...) = Distance2WallsEncoder{8}(; kwargs...)
labels(::Distance2WallsEncoder{4}) = (:ahead, :right, :left, :behind)
labels(::Distance2WallsEncoder{6}) = (:ahead, :right_a, :right_b, :left_a, :left_b, :behind)
labels(::Distance2WallsEncoder{8}) = (:ahead, :right_a, :right, :right_b, :left_a, :left, :left_b, :behind)
function _vecnt2ntvec(data)
    NamedTuple{keys(data[1])}(tuple(([data[j][i] for j in eachindex(data)] for i in eachindex(data[1]))...))
end
_vecnt2ntvec(data::NamedTuple) = data
function _ntvec2vecnt(data)
    [NamedTuple{keys(data)}(map(x -> x[i], values(data)))
     for i in eachindex(first(data))]
end
function encode!(e::Distance2WallsEncoder{E}, track; range = 1:nrow(track), kw...) where E
    nocompute(e, track; kw...) && return track
    encode!(e.pipe, track; range, kw...)
    alloc_cols!(e, track, Union{Missing, Float64})
    distance2walls1!(e, track.ahead, track.behind,
                        track.x, track.y, track.ox, track.oy, range)
    if E == 8 || E == 4
        distance2walls2!(e, track.right, track.left,
                            track.x, track.y, track.ox, track.oy, range)
    end
    if E == 8 || E == 6
        distance2walls3!(e, track.right_a, track.right_b, track.left_a, track.left_b,
                            track.x, track.y, track.ox, track.oy, range)
    end
    track
end
function distance2walls1!(e, ahead, behind, x, y, ox, oy, range)
    for i in range
        ahead[i] = distance2wall(e, x[i], y[i], ox[i], oy[i])
        behind[i] = distance2wall(e, x[i], y[i], -ox[i], -oy[i])
    end
end
function distance2walls2!(e, right, left, x, y, ox, oy, range)
    for i in range
        right[i] = distance2wall(e, x[i], y[i], oy[i], -ox[i])
        left[i] = distance2wall(e, x[i], y[i], -oy[i], ox[i])
    end
end
function distance2walls3!(e, right_a, right_b, left_a, left_b, x, y, ox, oy, range)
    for i in range
        right_a[i] = distance2wall(e, x[i], y[i], (ox[i] + SQRT3*oy[i])/2, (-SQRT3*ox[i] + oy[i])/2)
        right_b[i] = distance2wall(e, x[i], y[i], (-ox[i] + SQRT3*oy[i])/2, (-SQRT3*ox[i] - oy[i])/2)
        left_a[i] = distance2wall(e, x[i], y[i], (ox[i] - SQRT3*oy[i])/2, (SQRT3*ox[i] + oy[i])/2)
        left_b[i] = distance2wall(e, x[i], y[i], (-ox[i] - SQRT3*oy[i])/2, (SQRT3*ox[i] - oy[i])/2)
    end
end
# Obsolete?
function distance2walls(e::Distance2WallsEncoder{E}, x, y, ox, oy) where E
    ahead = distance2wall(e, x, y, ox, oy)
    behind = distance2wall(e, x, y, -ox, -oy)
    if E == 8 || E == 4
        right = distance2wall(e, x, y, oy, -ox)
        left = distance2wall(e, x, y, -oy, ox)
    end
    if E == 8 || E == 6
        right_a = distance2wall(e, x, y, (ox + SQRT3*oy)/2, (-SQRT3*ox + oy)/2)
        right_b = distance2wall(e, x, y, (-ox + SQRT3*oy)/2, (-SQRT3*ox - oy)/2)
        left_a = distance2wall(e, x, y, (ox - SQRT3*oy)/2, (SQRT3*ox + oy)/2)
        left_b = distance2wall(e, x, y, (-ox - SQRT3*oy)/2, (SQRT3*ox - oy)/2)
    end
    if E == 4
        (; ahead, right, left, behind)
    elseif E == 6
        (; ahead, right_a, right_b, left_a, left_b, behind)
    elseif E == 8
        (; ahead, right_a, right, right_b, left_a, left, left_b, behind)
    end
end

"""
    OrientationEncoder()

Encodes orientations based on Δx and Δy.
"""
struct OrientationEncoder{P} <: AbstractEncoder
    pipe::P
end
OrientationEncoder() = OrientationEncoder(SpeedEncoder())
function first_orientation(Δx, Δy)
    for i in eachindex(Δx)
        if !ismissing(Δx[i]) && (Δx[i] != 0 || Δy[i] != 0)
            n = sqrt(Δx[i]^2 + Δy[i]^2)
            return Δx[i] / n, Δy[i] / n
        end
    end
    return 1.0, 0.0
end
function encode!(e::OrientationEncoder, track; range = 1:nrow(track), kw...)
    nocompute(e, track; kw...) && return track
    encode!(e.pipe, track; range, kw...)
    alloc_cols!(e, track, Float64)
    orientation!(track.ox, track.oy, track.Δx, track.Δy, track.speed, range)
    track
end
function orientation!(ox, oy, Δx, Δy, speed, range)
    for i in range
        if i == 1
            ox[1], oy[1] = first_orientation(Δx, Δy)
        elseif ismissing(speed[i]) || speed[i] == 0
            ox[i] = ox[i-1]
            oy[i] = oy[i-1]
        else
            n = sqrt(Δx[i]^2 + Δy[i]^2)
            ox[i] = Δx[i]/n
            oy[i] = Δy[i]/n
        end
    end
end
labels(::OrientationEncoder) = (:ox, :oy)

"""
    VelocityEncoder()

Encodes velocities based on Δx, Δy and Δt.
"""
struct VelocityEncoder{P} <: AbstractEncoder
    pipe::P
end
VelocityEncoder() = VelocityEncoder(DeltaTimeEncoder() |> DeltaPositionEncoder())
function encode!(e::VelocityEncoder, track; range = 1:nrow(track), kw...)
    nocompute(e, track; kw...) && return track
    encode!(e.pipe, track; range, kw...)
    alloc_cols!(e, track, Union{Missing, Float64})
    velocity!(track.vx, track.vy, track.Δx, track.Δy, track.Δt, range)
    track
end
function velocity!(vx, vy, Δx, Δy, Δt, range)
    for i in range
        vx[i] = Δx[i] / Δt[i]
        vy[i] = Δy[i] / Δt[i]
    end
end
labels(::VelocityEncoder) = (:vx, :vy)

struct SpeedEncoder{R,P} <: AbstractEncoder
    outlier_threshold::Float64
    pipe::P
end
"""
$SIGNATURES

Encode the speed based on `vx` and `vy` (see [`VelocityEncoder`](@ref)).
Speed values above `outlier_threshold` are returned as `missing`.
If `return_outliers = true`, return also a vector of outlier values.
"""
function SpeedEncoder(; outlier_threshold = 160, return_outliers = false)
    pipe = VelocityEncoder()
    SpeedEncoder{return_outliers, typeof(pipe)}(outlier_threshold, pipe)
end
function encode!(e::SpeedEncoder, track; range = 1:nrow(track), kw...)
    nocompute(e, track; kw...) && return track
    encode!(e.pipe, track; range, kw...)
    alloc_cols!(e, track, Union{Missing, Float64})
    speed!(e, track, range)
    track
end
labels(::SpeedEncoder{true}) = (:speed, :speed_outlier)
labels(::SpeedEncoder{false}) = (:speed,)
function speed!(e::SpeedEncoder{true}, track, range)
    speed!(track.speed, track.speed_outlier, track.vx, track.vy, range,
           e.outlier_threshold)
end
function speed!(e::SpeedEncoder{false}, track, range)
    speed!(track.speed, nothing, track.vx, track.vy, range, e.outlier_threshold)
end
function speed!(speed, outlier, vx, vy, range, θ)
    for i in range
        n = FlyRL.speed(vx[i], vy[i])
        if ismissing(n)
            speed[i] = missing
        else
            if n ≤ θ
                speed[i] = n
            else
                speed[i] = missing
            end
            if !isnothing(outlier) && n > θ
                outlier[i] = n
            end
        end
    end
end
function speed(vx, vy)
    (ismissing(vx) || ismissing(vy)) && return missing
    vx == vy == zero(vx) && return zero(vx)
    sqrt(vx^2 + vy^2)
end


const DELTA_CONVENTION_DOCSTRING = """
Convention: the same row should contain the delta values that
lead to the current value, i.e. delta values should start with `missing`.
"""
"""
    DeltaPositionEncoder()

Encodes `Δx` and `Δy` from `x` and `y`.

$DELTA_CONVENTION_DOCSTRING
"""
struct DeltaPositionEncoder{P} <: AbstractEncoder
    pipe::P
end
DeltaPositionEncoder() = DeltaPositionEncoder(MarkovKEncoder(1, :x, :y))
function encode!(e::DeltaPositionEncoder, track; range = 1:nrow(track), kw...)
    nocompute(e, track; kw...) && return track
    encode!(e.pipe, track; range, kw...)
    alloc_cols!(e, track, Union{Missing, Int})
    delta_position!(track.Δx, track.x, track.xˌ1, track.Δy, track.y, track.yˌ1, range)
    track
end
function delta_position!(Δx, x, xˌ1, Δy, y, yˌ1, range)
    for i in range
        Δx[i] = x[i] - xˌ1[i]
        Δy[i] = y[i] - yˌ1[i]
    end
end
labels(::DeltaPositionEncoder) = (:Δx, :Δy)

"""
"""
struct DeltaPositionInputEncoder{P} <: AbstractEncoder
    pipe::P
    dx::Vector{Int}
    dy::Vector{Int}
end
labels(::DeltaPositionInputEncoder) = (:delta_position_input,)
function DeltaPositionInputEncoder(;
        encoder = EightWallsEncoder() |>
                  SinCosAngleEncoder() |>
                  SpeedEncoder() |>
                  MarkovKEncoder(1, :sin_angle, :cos_angle, :speed) |>
                  (t -> begin
                       t.inmaze = FlyRL.in_maze.(t.x, t.y)
                       t
                   end) |>
                  VectorEncoder(labels(EightWallsEncoder())...,
                                :sin_angle, :sin_angleˌ1,
                                :cos_angle, :cos_angleˌ1,
                                :speed, :speedˌ1),
        kwargs...)
    dx, dy = delta_position_grid(; kwargs...)
    DeltaPositionInputEncoder(encoder, dx, dy)
end
function encode!(e::DeltaPositionInputEncoder, track; range = 1:nrow(track), kw...)
    nocompute(e, track; kw...) && return track
    x = copy(track.x); y = copy(track.y)
    encode!(e.pipe, track; range, kw...)
    if !hasproperty(track, :delta_position_input)
        inp = (input = hcat(fill(first(skipmissing(track.vectors)), length(e.dx))...),
               mask = falses(length(e.dx)))
        track.delta_position_input = Union{Missing, typeof(inp)}[(input = zero(inp.input), mask = falses(length(e.dx))) for _ in 1:nrow(track)]
    end
    keep = tuple(Symbol.(names(track, r"ˌ"))...)
    track.xˌ1[1] = track.xˌ1[2] # this is a hack to avoid first missing
    track.yˌ1[1] = track.yˌ1[2] # this is a hack to avoid first missing
    for i in eachindex(e.dx)
        @views @. track.x[range] = track.xˌ1[range] + e.dx[i]
        @views @. track.y[range] = track.yˌ1[range] + e.dy[i]
        encode!(e.pipe, track; range, recompute = true, keep)
        for k in range
            if ismissing(track.vectors[k])
                track.delta_position_input[k] = missing
            else
                track.delta_position_input[k].input[:, i] .= track.vectors[k]
                track.delta_position_input[k].mask[i] = track.inmaze[k]
            end
        end
    end
    # restore
    track.x .= x
    track.y .= y
    track.xˌ1[1] = track.yˌ1[1] = missing
    encode!(e.pipe, track; range, recompute = true, keep)
    track
end

struct SemanticEncoder3 <: AbstractEncoder
    levels::Vector{String}
end
"""
$SIGNATURES

Encodes positions of the maze as `"center"`, `"arm"` or `"turn"`.
Points outside the maze are marked as `"outlier"` if `with_outliers = true`.
"""
function SemanticEncoder3(; with_outliers = false)
    levels = FlyRL.with_outliers(["center", "arm", "turn"], with_outliers)
    SemanticEncoder3(levels)
end
labels(::SemanticEncoder3) = (:se3,)
function encode!(e::SemanticEncoder3, track; kw...)
    nocompute(e, track; kw...) && return track
    track.se3 = categorical(encode.(Ref(e), track.x, track.y),
                            levels = e.levels)
    track
end
function encode(::SemanticEncoder3, x::Number, y::Number)
    in_center(x, y) && return "center"
    in_arm(x, y) && return "arm"
    in_turn(x, y) && return "turn"
    return "outlier"
end

struct SemanticEncoder7 <: AbstractEncoder
    levels::Vector{String}
end
"""
$SIGNATURES

Encodes positions of the maze as `"center"`, `"left arm"`, `"left turn"`, `"middle arm"`, `"middle turn"`, `"right arm"`, `"right turn"`.
Points outside the maze are marked as `"outlier"` if `with_outliers = true`.
"""
function SemanticEncoder7(; with_outliers = false)
    levels = FlyRL.with_outliers(["center", "left arm", "left turn", "middle arm", "middle turn", "right arm", "right turn"], with_outliers)
    SemanticEncoder7(levels)
end
labels(::SemanticEncoder7) = (:se7,)
function encode!(e::SemanticEncoder7, track; kw...)
    nocompute(e, track; kw...) && return track
    track.se7 = categorical(encode.(Ref(e), track.x, track.y),
                            levels = e.levels)
    track
end
function encode(::SemanticEncoder7, x::Number, y::Number)
    in_center(x, y) && return "center"
    in_left_arm(x, y) && return "left arm"
    in_left_turn(x, y) && return "left turn"
    in_middle_arm(x, y) && return "middle arm"
    in_middle_turn(x, y) && return "middle turn"
    in_right_arm(x, y) && return "right arm"
    in_right_turn(x, y) && return "right turn"
    return "outlier"
end


"""
    DeltaTimeEncoder()

Encodes `Δt` from `t`; uses default $DEFAULT_Δt, if `t` is missing.

$DELTA_CONVENTION_DOCSTRING
"""
Base.@kwdef struct DeltaTimeEncoder <: AbstractEncoder
    default_Δt::Float64 = DEFAULT_Δt
end
labels(::DeltaTimeEncoder) = (:Δt,)
function encode!(e::DeltaTimeEncoder, track; range = 1:nrow(track), kw...)
    nocompute(e, track; kw...) && return track
    alloc_cols!(e, track, Union{Missing, Float64})
    if hasproperty(track, :t)
        encode!(MarkovKEncoder(1, :t), track; range, kw...)
        deltatime!(track.Δt, track.t, track.tˌ1, range)
    else
        track.Δt = fill(e.default_Δt, nrow(track))
    end
    track
end
function deltatime!(Δt, t, tˌ1, range)
    for i in range
        Δt[i] = t[i] - tˌ1[i]
    end
end

"""
    AngleEncoder()

Encodes angles between subsequent orientations.

$DELTA_CONVENTION_DOCSTRING
"""
struct AngleEncoder{P} <: AbstractEncoder
    pipe::P
end
function AngleEncoder()
    AngleEncoder(OrientationEncoder() |>
                  MarkovKEncoder(1, :ox, :oy))
end
angle(x, y) = angle(x[1], x[2], y[1], y[2])
angle(ox, oy, old_ox, old_oy) = atan(ox * old_oy - oy * old_ox, ox * old_ox + oy * old_oy)
function encode!(e::AngleEncoder, track; range = 1:nrow(track), kw...)
    nocompute(e, track; kw...) && return track
    encode!(e.pipe, track; range, kw...)
    alloc_cols!(e, track, Union{Missing, Float64})
    angle!(track.angle, track.speed, track.ox, track.oxˌ1, track.oy, track.oyˌ1, range)
    track
end
function angle!(angle, speed, ox, oxˌ1, oy, oyˌ1, range)
    for i in range
        if ismissing(speed[i]) || speed[i] == 0
            angle[i] = 0.
        else
            angle[i] = FlyRL.angle(ox[i], oy[i], oxˌ1[i], oyˌ1[i])
        end
    end
end
labels(::AngleEncoder) = (:angle,)
"""
    SinCosAngleEncoder()

Encodes angles as `(sin(angle), cos(angle))` (see also [`AngleEncoder`](@ref)).
"""
struct SinCosAngleEncoder{P} <: AbstractEncoder
    pipe::P
end
SinCosAngleEncoder() = SinCosAngleEncoder(AngleEncoder())
labels(::SinCosAngleEncoder) = (:sin_angle, :cos_angle)
function sin_cos_angles!(sin_angle, cos_angle, angle, range)
    for i in range
        sin_angle[i] = sin(angle[i])
        cos_angle[i] = cos(angle[i])
    end
end
function encode!(e::SinCosAngleEncoder, track;
                 range = 1:nrow(track), kw...)
    nocompute(e, track; kw...) && return track
    encode!(e.pipe, track; range, kw...)
    alloc_cols!(e, track, Union{Missing, Float64})
    sin_cos_angles!(track.sin_angle, track.cos_angle, track.angle, range)
    track
end

"""
    InShockArmEncoder()

Encodes if the position is in the shock arm.
"""
struct InShockArmEncoder <: AbstractEncoder end
function encode!(e::InShockArmEncoder, track; kw...)
    nocompute(e, track; kw...) && return track
    track.inshockarm = [shock_function(pat)(x, y)
                        for (pat, x, y) in zip(track.pattern, track.x, track.y)]
    track
end
labels(::InShockArmEncoder) = (:inshockarm,)

"""
    LevelEncoder(encoder)

Encode level as an integer for a categorical encoder (like [`ShockArmEncoder`](@ref)).
"""
struct LevelEncoder2{C} <: AbstractEncoder
#     colname::Symbol
end
LevelEncoder(colname) = LevelEncoder2{colname}()
labels(e::LevelEncoder2{C}) where C = (Symbol("$(C)_level"),)
function encode!(e::LevelEncoder2{C}, track; range = 1:nrow(track), kw...) where C
    nocompute(e, track; kw...) && return track
    alloc_cols!(e, track, Int)
    l = getproperty(track, labels(e)[1])
    s = getproperty(track, C)
    encodelevels!(l, s, range)
    track
end
function encodelevels!(l, s, range)
    for t in range
        l[t] = levelcode(s[t])
    end
end

function _keys(lb, cols, ::Val{with_intercept}) where with_intercept
    le = CategoricalArrays.levels.(cols)
    ks = vcat([isa(coli, CategoricalArray) ? add_suffix.(Symbol.(lei), Ref(suffix(lbi))) : lbi for (coli, lbi, lei) in zip(cols, lb, le)]...)
    if with_intercept
        push!(ks, :intercept)
    end
    tuple(ks...)
end
_keys(lb, ::NTuple{N, Vector}, ::Val{false}) where N  = lb
_keys(lb, ::NTuple{N, Vector}, ::Val{true}) where N = tuple(lb..., :intercept)

struct VectorEncoder{T, E} <: AbstractEncoder
    colnames::E
    with_intercept::Bool
end
labels(::VectorEncoder) = (:vectors,)
"""
$SIGNATURES

Encode multiple encodings in a single vector.
Categorical encoders are one-hot encoded.

## Example
```
pipe = ShockArmEncoder() |>
       SpeedEncoder() |>
       dropmissing! |>
       VectorEncoder(:state, :speed)
t = random_track(N = 10)
newt = pipe(t)
newt.vectors
```
"""
function VectorEncoder(colnames...; T = Float64, intercept = false)
    VectorEncoder{T, typeof(colnames)}(colnames, intercept)
end
function mysetindex!(x, v::Number, o)
    o[] += 1
    setindex!(x, v, o[])
    x
end
function mysetindex!(x, v::Union{Tuple,AbstractVector{<:Any}}, o)
    for i in eachindex(v)
        o[] += 1
        setindex!(x, v[i], o[])
    end
    x
end
function mysetindex!(x, v::CategoricalVector, o)
    for vi in v
        mysetindex!(x, vi, o)
    end
    x
end
function mysetindex!(x, v::CategoricalValue, o)
    for level in CategoricalArrays.levels(v)
        o[] += 1
        if v == level
            setindex!(x, 1.0, o[])
        else
            setindex!(x, 0.0, o[])
        end
    end
    x
end
drop(nt::NamedTuple, k...) = Base.structdiff(nt, NamedTuple{k})
drop(t::Tuple, k...) = filter(∉(k), t)

function zero_componentvector(ax::ComponentArrays.Axis{K}, T) where K
    ComponentVector(zeros(T, length(K)), ax)
end
function _inner!(range, o, cols, vectors, ax, T)
    for i in range
        o[] = 0
        for v in cols
            if ismissing(v[i])
                vectors[i] = missing
                break
            end
            if ismissing(vectors[i])
                vectors[i] = zero_componentvector(ax, T)
            end
            mysetindex!(vectors[i], v[i], o)
        end
    end
end
function encode!(e::VectorEncoder{T}, track; range = 1:nrow(track), kw...) where T
    nocompute(e, track; kw...) && return track
    cols = getproperty.(Ref(track), e.colnames)
    N = length(first(cols))
    if hasproperty(track, :vectors)
        vectors = track.vectors
        TT = first(skipmissing(track.vectors))
        ax = ComponentArrays.getaxes(TT)[1]
    else
        ks = _keys(e.colnames, cols, Val(e.with_intercept))
        TT = ComponentVector(NamedTuple{ks}(zeros(T, length(ks))))
        ax = ComponentArrays.getaxes(TT)[1]
        vectors = Union{Missing,typeof(TT)}[zero_componentvector(ax, T) for _ in 1:N]
        if e.with_intercept
            for i in 1:N
                vectors[i].intercept = 1
            end
        end
    end
    o = Base.RefValue{Int}(0)
    _inner!(range, o, cols, vectors, ax, T)
    track.vectors = vectors
    track
end
# TODO: Fix! This is broken: e.encoders does not exist anymore.
"""
$SIGNATURES

Inverse of `encode(VectorEncoder(), track)`.
"""
function decode(e::VectorEncoder, vectors)
    lb = tuple(Iterators.flatten(labels.(e.encoders))...)
    le = tuple(Iterators.flatten(levels.(e.encoders))...)
    data = []
    o = 1
    for lei in le
        if lei == Number
            push!(data, [v[o] for v in vectors])
            o += 1
        else
            push!(data, categorical([lei[Bool.(v[o:o+length(lei)-1])][] for v in vectors], levels = lei))
            o += length(lei)
        end
    end
    NamedTuple{lb}(tuple(data...))
end

struct MarkovKEncoder{K,E} <: AbstractEncoder
    shifters::E
end
"""
$SIGNATURES

Create copies of the original encoders with offsets up to `K`.
Appends `ˌk` to copy with offset `k`.
## Example
```
encode(ArmEncoder() |> MarkovKEncoder(3, :arm), random_track())
```
"""
function MarkovKEncoder(K, colnames...)
    cs = ntuple(i -> ColumnShifter(i, colnames...), K)
    MarkovKEncoder{K, typeof(cs)}(cs)
end
add_suffix(s, i) = Symbol("$s" * (i == 0 ? "" : i > 0 ? "ˌ$i" : "ˈ$(-i)")) # \verti \verts
function suffix(s)
    str = string(s)
    for (i, c) in pairs(str)
        c == 'ˌ' && return Meta.parse(str[i+2:end])
        c == 'ˈ' && return -Meta.parse(str[i+2:end])
    end
    0
end
labels(e::MarkovKEncoder) = tuple(Iterators.flatten(labels.(e.shifters))...)
function encode!(e::MarkovKEncoder, track; range = 1:nrow(track), kw...)
    nocompute(e, track; kw...) && return track
    for e in e.shifters
        encode!(e, track; range, kw...)
    end
    track
end
struct ColumnShifter{C,C2} <: AbstractEncoder
    colnames::C
    labels::C2
    shift::Int
end
function ColumnShifter(shift, c...)
    labels = add_suffix.(c, shift)
    ColumnShifter{typeof(c), typeof(labels)}(c, labels, shift)
end
labels(e::ColumnShifter) = e.labels
function _shiftcopy!(newcol, col, shift, range)
    n = length(newcol)
    for i in range
        if i - shift ≥ 1 && i - shift ≤ n
            newcol[i] = col[i-shift]
        end
    end
end
function encode!(e::ColumnShifter, track;
                 recompute = false, keep = tuple(),
                 range = 1:nrow(track))
    nocompute(e, track; recompute, keep) && return track
    lbs = labels(e)
    cols = getproperty.(Ref(track), e.colnames)
    alloc_cols!(e, track, cols, lbs; missings = true)
    shift = e.shift
    for (i, lb) in pairs(lbs)
        lb ∈ keep && continue
        col = cols[i]
        newcol = getproperty(track, lb)
        _shiftcopy!(newcol, col, shift, range)
    end
    track
end


"""
    DurationPerStateEncoder(encoder)

Encode the duration that is spent in a given state.
## Example
```
encode(ShockArmEncoder() |> DurationPerStateEncoder(:state), random_track())
```
"""
struct DurationPerStateEncoder <: AbstractEncoder
    colname::Symbol
end
function labels(e::DurationPerStateEncoder)
    (Symbol(e.colname, "_Δt"),)
end
encode!(e::DurationPerStateEncoder, track; kw...) = encode(e, track)
function encode(e::DurationPerStateEncoder, track; recompute = false, keep = tuple())
    nocompute(e, track; recompute, keep) && return track
    dt_name = Symbol(e.colname, "_Δt")
    dce = DynamicCompressEncoder(e.colname,
                                 dt_name => (df, i1, i2) -> df.t[i2] - df.t[i1],
                                 (Symbol(n) => (df, i1, i2) -> median(getproperty(df, n)[i1:i2-1]) ≥ .5
                                  for n in names(track, r"shock"))...
                                )
    newtrack = encode(dce, track)
    newtrack
end

struct DynamicCompressEncoder{F,E,K} <: AbstractEncoder
    breaker::F
    special_transform::E
    compress_on::K
end
struct MaxTimeBreaker
    Δt::Float64
end
(b::MaxTimeBreaker)(track, i, lasti) = track.t[i] - track.t[lasti] > b.Δt
function modify!(track, b::MaxTimeBreaker, i, lasti)
    Δ = track.t[i] - track.t[lasti]
    if Δ > b.Δt
        insert!(track, i, track[i-1, :])
        track.t[i] = track.t[lasti] + b.Δt
        true
    else
        false
    end
end
struct MaxStepsBreaker
    Δi::Float64
end
(b::MaxStepsBreaker)(_, i, lasti) = i - lasti ≥ b.Δi
modify!(::Any, ::Any, ::Any, ::Any) = false
"""
    DynamicCompressEncoder(compress_on, special_transform...;
                           breaker = (track, i, last_break_i) -> false)

Merge subsequent states of `compress_on` into one state.
`special_transform` are pairs of the form `:colname => function`,
where `function` receives as input `track.colname[i1:i2]`, where
`i1` and `i2` are subsequent row indices at which the compressor
creates a new output row. When `breaker(track, i, last_break_i) == true`,
a new row is created, even if the state in the `compress_on` column remained the same.
## Example
Compress on arm `:state`, but create a new row whenever a fly stays more than 20 seconds in the same state.
Compute the duration of staying, by applying a special transformation.
```
pipe = ShockArmEncoder() |>
       DynamicCompressEncoder(:state, :state_Δt => (df, i1, i2) -> df.t[i2]-df.t[i1],
                              breaker = MaxTimeBreaker(20))
# `MaxTimeBreaker(20)` is a shortcut for
# `breaker = (track, i, last_i) -> track.t[i] - track.t[last_i] ≥ 20`
encode(pipe, random_track())
```
"""
function DynamicCompressEncoder(compress_on::Union{Symbol,NTuple{N,Symbol}}, e...;
                                breaker = nothing) where N
    if breaker === nothing
        breaker = (_, _, _) -> false
    end
    if isa(compress_on, Symbol)
        compress_on = tuple(compress_on)
    end
    specialtransform = Dict(e)
    DynamicCompressEncoder{typeof(breaker), typeof(specialtransform), typeof(compress_on)}(breaker, specialtransform, compress_on)
end
labels(e::DynamicCompressEncoder) = tuple(e.compress_on...)
(e::DynamicCompressEncoder)(track; kw...) = encode(e, track)
encode!(e::DynamicCompressEncoder, track; kw...) = encode(e, track)
function encode(e::DynamicCompressEncoder, track)
    _track = deepcopy(track)
    idxs = [1]
    colstocheck = getproperty.(Ref(_track), e.compress_on)
    state = first.(colstocheck)
    i = 2
    while true
        newstate = getindex.(colstocheck, i)
        if e.breaker(_track, i, idxs[end]) || newstate != state
            if !modify!(_track, e.breaker, i, idxs[end])
                state = newstate
            end
            push!(idxs, i)
        end
        i += 1
        i > nrow(_track) && break
    end
    push!(_track, _track[end, :])
    # the following two lines extend the boundaries, e.g. if after filter_center!
    # the start of the first state is after time 0 (because the track starts
    # in the center)
    _track.t[1] = 0
    _track.t[end] = 1200
    push!(idxs, length(_track[:, 1]))
    ks = tuple(keys(e.special_transform)...)
    special = NamedTuple{ks}(tuple(
        [begin
         [t(_track, i1, i2) for (i1, i2) in zip(idxs[1:end-1], idxs[2:end])]
         end
         for (k, t) in e.special_transform]...))
    ns = tuple(Symbol.(setdiff(names(_track), ks))...)
    normal = NamedTuple{ns}(tuple([getproperty(_track, k)[idxs[1:end-1]] for k in ns]...))
    merge(normal, special) |> DataFrame
end

struct EgoCentric
    pipe::YMaze.Pipeline{OrientationEncoder{SpeedEncoder{false, VelocityEncoder{YMaze.Pipeline{DeltaTimeEncoder, DeltaPositionEncoder{MarkovKEncoder{1, Tuple{ColumnShifter{Tuple{Symbol, Symbol}, Tuple{Symbol, Symbol}}}}}}}}}, ColumnShifter{Tuple{Symbol, Symbol}, Tuple{Symbol, Symbol}}}
end
EgoCentric() = EgoCentric(OrientationEncoder() |> FlyRL.ColumnShifter(1, :ox, :oy))
struct AlloCentric end

struct MaskEncoder{K} <: AbstractEncoder
    kind::K
    dx::Vector{Int}
    dy::Vector{Int}
end
function MaskEncoder(; kind = AlloCentric, kwargs...)
    MaskEncoder(kind(), delta_position_grid(; kwargs...)...)
end
labels(::MaskEncoder) = (:mask,)
function encode!(e::MaskEncoder{K}, track; range = 1:nrow(track), kw...) where K
    nocompute(e, track; kw...) && return track
    if !hasproperty(track, :mask)
        alloc_cols!(e, track, Vector{Bool}(undef, length(e.dx)))
    end
    if K === EgoCentric
        encode!(e.kind.pipe, track; range, kw...)
    end
    FlyRL.mask(e, track, range)
    track
end
mask(::MaskEncoder, ::Missing, ::Missing) = missing
in_maze(::MaskEncoder{AlloCentric}, x, dx, ox, y, dy, oy) = in_maze(x + dx, y + dy)
function in_maze(::MaskEncoder{EgoCentric}, x, dx, ox, y, dy, oy)
    dxr, dyr = YMaze.rotate([dx, dy], [0, 0], -atan(ox, oy))
    in_maze(x + dxr, y + dyr)
end
function mask(e::MaskEncoder{K}, track, range) where K
    for i in range
        mi = track.mask[i]
        xi = track.x[i]; yi = track.y[i]
        if K === EgoCentric
            oxi = track.ox[i]; oyi = track.oy[i]
        else
            oxi = oyi = nothing
        end
        for j in eachindex(e.dx)
            mi[j] = in_maze(e, xi, e.dx[j], oxi, yi, e.dy[j], oyi)
        end
    end
end

"""
    DeltaPositionIndexEncoder(; maxradius = 20, stepsize = 1)

Encodes relative positions (Δx, Δy) with an integer, based on a 2D grid with `stepsize`
and largest relative position `Δx^2 + Δy^2 = maxradius^2`.
"""
struct DeltaPositionIndexEncoder{K} <: AbstractEncoder
    kind::K
    pipe::DeltaPositionEncoder{MarkovKEncoder{1, Tuple{ColumnShifter{Tuple{Symbol, Symbol}, Tuple{Symbol, Symbol}}}}}
    lookup::Dict{Tuple{Int,Int}, Int}
    dx::Vector{Int}
    dy::Vector{Int}
end
function DeltaPositionIndexEncoder(; kind = AlloCentric, kwargs...)
    dx, dy = delta_position_grid(; kwargs...)
    DeltaPositionIndexEncoder(kind(), DeltaPositionEncoder(),
                               Dict((dxi, dyi) => i for (i, (dxi, dyi)) in enumerate(zip(dx, dy))), dx, dy)
end
labels(::DeltaPositionIndexEncoder) = (:delta_position_index,)
function encode!(e::DeltaPositionIndexEncoder{K}, track; range = 1:nrow(track), kw...) where K
    nocompute(e, track; kw...) && return track
    encode!(e.pipe, track; range, kw...)
    if K === EgoCentric
        encode!(e.kind.pipe, track; range, kw...)
    end
    alloc_cols!(e, track, Union{Missing, Int})
    delta_position_index!(e, track, range)
    track
end
function delta_pos(::DeltaPositionIndexEncoder{AlloCentric}, Δx, Δy, ::Any, ::Any)
    (Δx, Δy)
end
function delta_pos(::DeltaPositionIndexEncoder{EgoCentric}, Δx, Δy, ox, oy)
    Δ = YMaze.rotate([Δx, Δy], [0, 0], atan(ox, oy))
    any(ismissing.(Δ)) && return missing
    tuple(round.(Int, Δ)...)
end
function delta_position_index!(e::DeltaPositionIndexEncoder{K}, track, range) where K
    dpi = track.delta_position_index
    Δx = track.Δx; Δy = track.Δy
    if K === EgoCentric
        ox = track.oxˌ1; oy = track.oyˌ1
    else
        ox = track.x; oy = track.y # this is a hack; values are ignored
    end
    for i in range
        dpi[i] = get(e.lookup, delta_pos(e, Δx[i], Δy[i], ox[i], oy[i]), missing)
    end
end
struct TurnEncoder{P} <: AbstractEncoder
    pipe::P
end
TurnEncoder() = TurnEncoder(ArmEncoder() |> MarkovKEncoder(1, :arm))
labels(::TurnEncoder) = (:turn,)
function turn(s, sˌ1) # 0 := left, 1 := right
    ismissing(sˌ1) && return missing
    s == "M" && sˌ1 == "L" && return 0
    s == "M" && sˌ1 == "R" && return 1
    s == "L" && sˌ1 == "M" && return 1
    s == "L" && sˌ1 == "R" && return 0
    s == "R" && sˌ1 == "M" && return 0
    s == "R" && sˌ1 == "L" && return 1
end
function turn!(turn, arm, armˌ1, range)
    for t in range
        turn[t] = FlyRL.turn(arm[t], armˌ1[t])
    end
end
function encode!(e::TurnEncoder, track; range = 1:nrow(track), kw...)
    nocompute(e, track; kw...) && return track
    encode!(e.pipe, track; range, kw...)
    alloc_cols!(e, track, Union{Missing,Int})
    turn!(track.turn, track.arm, track.armˌ1, range)
    track
end
