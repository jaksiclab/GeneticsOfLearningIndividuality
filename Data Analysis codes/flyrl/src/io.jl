function load_tracks(; noShockShock = "shock", minnrow = 500, filter = true,
                       path = joinpath(@__DIR__, "..", "data", "tracks.jld2"))
    tracks = JLD2.load(path, "tracks")
    filter && filter!(x -> nrow(x) > minnrow && std(x.x) > 10 && length(union(x.state)) > 2, tracks)
    for track in tracks
        nrow(track) > 0 || continue
        if !(any(track.raw_shock)) && isa(noShockShock, String) # used to fake shock
            track.shock = track.state .== noShockShock
        else # default
            track.shock = track.raw_shock
        end
    end
    tracks
end
function load_populations()
    tracks = [filter!(x -> YMaze.shockcol(x.pattern[1]) == 'G' &&
                          FileNames.date(metadata(x)["filename"]) != "20221221",
                          load_tracks(noShockShock = nothing));
              load_tracks(path = joinpath(@__DIR__, "..", "data", "tracks_feb24.jld2"), noShockShock = nothing)]
    fns = getindex.(metadata.(tracks), "filename")
    df = DataFrame(track = tracks,
                   genotype = FileNames.genotype.(fns),
                   sex = FileNames.sex.(fns),
                   shocked = FileNames.shocked.(fns),
                   trackid = FileNames.trackid.(fns),
                   shockcolor = [YMaze.shockcol(t.pattern[1]) for t in tracks],
                   date = FileNames.date.(fns)
                  )
    gs = groupby(df[(df.shockcolor .== 'G') .&
                    (df.date .!= "20221221"),
                    :],
                 [:genotype])
end
module FileNames
import DataFrames: metadata, DataFrame

genotype(track::DataFrame) = genotype(metadata(track)["filename"])
genotype(filename) = match(r"csv.([^_]*)", filename).captures[1]
shocked(filename) = !isnothing(match(r"_shock", filename))
sex(filename) = !isnothing(match(r"female", filename)) ? "female" : "male"
trackid(filename) = Meta.parse(match(r"track_([0-9]*)", filename).captures[1])
date(filename) = match(r"([0-9]*).csv", filename).captures[1]
function _shortname(fn; joiner = "-", match = (date, genotype, shocked, sex, trackid))
    join(map(f -> f(fn), match), joiner)
end
const TRACKLOOKUP = IdDict()
function _index(tracks; kw...)
    if !haskey(TRACKLOOKUP, tracks)
        TRACKLOOKUP[tracks] = IdDict()
    else
        haskey(TRACKLOOKUP[tracks], kw) && return
    end
    if !haskey(TRACKLOOKUP[tracks], kw)
        TRACKLOOKUP[tracks][kw] = tmp = Dict{String, Vector{Int}}()
    end
    for (i, t) in pairs(tracks)
        k = _shortname(metadata(t)["filename"], kw...)
        if haskey(tmp, k)
            push!(tmp[k], i)
        else
            tmp[k] = [i]
        end
    end
end
function find_tracks(tracks, fn; kw...)
    key = _shortname(fn; kw...)
    _index(tracks; kw...)
    tracks[TRACKLOOKUP[tracks][kw][key]]
end

end
