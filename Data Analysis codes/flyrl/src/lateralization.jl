function lateralizations(track; kw...)
    nrow(track) == 1 && return [missing]
    pipe = ShockArmEncoder() |> filter_center! |> DynamicCompressEncoder(:state) |> TurnEncoder()
    _track = encode(pipe, track)
    2*_track.turn .- 1
end
function lateralization(track; kw...)
    l = lateralizations(track)
    sum((!).(ismissing.(l))) == 0 && return missing
    mean(skipmissing(l))
end
