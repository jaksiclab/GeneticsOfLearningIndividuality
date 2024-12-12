# API
"""
$SIGNATURES

Encode `track` with `encoder`.
"""
encode(encoder, track; kw...) = encode!(encoder, copy(track); kw...)
"""
$SIGNATURES

Encode `track` with `encoder` and store result in data frame `track`.
"""
encode!(encoder, track; kw...)
encode!(f::Function, track; kw...) = f(track)

_coltype(T, ::Any) = T
_coltype(cols::Tuple, i) = Union{Missing, eltype(cols[i])}
function alloc_col(df, lb, T, i, n, missings)
    if missings
        setproperty!(df, lb, Vector{Union{Missing,_coltype(T, i)}}(fill(missing, n)))
    else
        setproperty!(df, lb, Vector{_coltype(T, i)}(undef, n))
    end
end
function alloc_col(df, lb, T::Vector{K}, i, n, missings) where K
    if missings
        T = convert(Vector{Union{Missing, K}}, T)
    end
    setproperty!(df, lb, [similar(T) for _ in 1:n])
end
struct Levels
    l::Vector{String}
end
function alloc_col(df, lb, l::Levels, i, n, missings)
    if missings
        setproperty!(df, lb, CategoricalVector{Union{Missing, String}}(fill(missing, n), levels = l.l))
    else
        setproperty!(df, lb, CategoricalVector{String}(undef, n, levels = l.l))
    end
end
function alloc_cols!(e, df, T = Float64, lbs = labels(e); missings = false)
    n = nrow(df)
    for (i, lb) in pairs(lbs)
        if !hasproperty(df, lb)
            alloc_col(df, lb, T, i, n, missings)
        end
    end
    df
end

abstract type AbstractEncoder end
(e::AbstractEncoder)(track; kw...) = encode(e, track; kw...)
struct Pipeline{E1,E2}
    e1::E1
    e2::E2
end
(p::Pipeline)(track; kw...) = encode(p, track; kw...)
function encode!(p::Pipeline, track; kw...)
    track = encode!(p.e1, track; kw...)
    track = encode!(p.e2, track; kw...)
end
list_encoders(p::Pipeline) = vcat(list_encoders(p.e1), list_encoders(p.e2))
list_encoders(e) = e
Base.:(|>)(e1::AbstractEncoder, e2::AbstractEncoder) = Pipeline(e1, e2)
Base.:(|>)(e1::Pipeline, e2::AbstractEncoder) = Pipeline(e1, e2)
Base.:(|>)(e1::Union{AbstractEncoder,Pipeline}, e2::Function) = Pipeline(e1, e2)
Base.:(|>)(e1::Function, e2::Union{AbstractEncoder,Pipeline}) = Pipeline(e1, e2)
function Base.show(io::IO, m::MIME"text/plain", p::Pipeline)
    show(io, m, p.e1)
    println(io, " |>")
    show(io, m, p.e2)
end

hascols(e::AbstractEncoder, track) = all(hasproperty.(Ref(track), labels(e)))

function nocompute(e::AbstractEncoder, track; recompute = false, keep = tuple())
    if recompute
        if all(labels(e) .∈ Ref(keep))
            return true
        else
            return false
        end
    else
        return hascols(e, track)
    end
end

struct ArmEncoder <: AbstractEncoder
    levels::Vector{String}
end
"""
$SIGNATURES

Encodes arms of the maze as `"left"`, `"middle"`, `"right"`, `"center"`.
Points outside the maze are marked as `"outlier"` if `with_outliers = true`.
"""
function ArmEncoder(; with_outliers = false)
    levels = YMaze.with_outliers(["L", "M", "R", "X"], with_outliers)
    ArmEncoder(levels)
end
with_outliers(x, with_outliers; outlier = "outlier") = ifelse(with_outliers, [x; outlier], x)
labels(::ArmEncoder) = (:arm,)
function encode!(e::ArmEncoder, track; range = 1:nrow(track), kw...)
    nocompute(e, track; kw...) && return track
    alloc_cols!(e, track, Levels(e.levels))
    encode_arm!(track.arm, track.x, track.y, range)
    track
end
function encode_arm!(arm, x, y, range)
    for t in range
        arm[t] = encode_arm(x[t], y[t])
    end
end
function encode_arm(x, y)
    (in_left_arm(x, y) || in_left_turn(x, y)) && return "L"
    (in_middle_arm(x, y) || in_middle_turn(x, y)) && return "M"
    (in_right_arm(x, y) || in_right_turn(x, y)) && return "R"
    in_center(x, y) && return "X"
    return "outlier"
end

struct ShockArmEncoder{P} <: AbstractEncoder
    pipe::P
    levels::Vector{String}
end
"""
$SIGNATURES

Encodes arms of the maze as `"neutral right"`, `"neutral left"`, `"shock"` and `"center"`.
Points outside the maze are marked as `"outlier"` if `with_outliers = true`.
"""
function ShockArmEncoder(; with_outliers = false)
    levels = YMaze.with_outliers(["neutral right", "neutral left", "shock", "center"],
                                 with_outliers)
    ShockArmEncoder(ArmEncoder(; with_outliers), levels)
end
labels(::ShockArmEncoder) = (:state,)
function encode!(e::ShockArmEncoder, track; range = 1:nrow(track), kw...)
    nocompute(e, track; kw...) && return track
    encode!(e.pipe, track; range, kw...)
    alloc_cols!(e, track, Levels(e.levels))
    encode_shockarm!(track.state, track.arm, track.pattern, range)
    track
end
function shockcol(pattern)
    if pattern == "GBB" || pattern == "BGB" || pattern == "BBG"
        'G'
    else#if pattern == "GGB" || pattern == "GBG" || pattern == "BGG"
        'B'
#     else
#         error("Unknown pattern $pattern")
    end
end
function encode_shockarm!(state, arm, pattern, range)
    for t in range
        shockcol = YMaze.shockcol(pattern[t])
        p1, p2, p3 = pattern[t]
        state[t] =
        arm[t] == "L" ? (p1 == shockcol ? "shock" :
                               p2 == shockcol ? "neutral right" : "neutral left") :
        arm[t] == "M" ? (p2 == shockcol ? "shock" :
                                 p1 == shockcol ? "neutral left" : "neutral right") :
        arm[t] == "R" ? (p3 == shockcol ? "shock" :
                                p1 == shockcol ? "neutral right" : "neutral left") :
        arm[t] == "X" ? "center" : "outlier"
    end
end

struct ColorEncoder <: AbstractEncoder
    colordict::Dict{Char,String}
    levels::Vector{String}
end
"""
$SIGNATURES

Encode color based on `track.pattern`.
"""
function ColorEncoder(; colordict = Dict('B' => "blue", 'G' => "green", 'R' => "red"),
                        with_outliers = false)
    l = YMaze.with_outliers(["gray"; values(colordict)...], with_outliers;
                            outlier = "black")
    ColorEncoder(colordict, l)
end
labels(::ColorEncoder) = (:color,)
function color(pattern, arm; colordict = Dict('B' => "blue",
                                              'G' => "green",
                                              'R' => "red"))
    arm == "X" && return "gray"
    arm == "L" && return colordict[pattern[1]]
    arm == "M" && return colordict[pattern[2]]
    arm == "R" && return colordict[pattern[3]]
    return "black"
end
function color!(color, pat, arm, range)
    for t in range
        color[t] = YMaze.color(pat[t], arm[t])
    end
end
function encode!(e::ColorEncoder, track; range = 1:nrow(track), kw...)
    nocompute(e, track; kw...) && return track
    alloc_cols!(e, track, Levels(e.levels))
    color!(track.color, track.pattern, track.arm, range)
    track
end

