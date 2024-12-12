###
### Preprocessor
###

struct StaticTargetPreprocessor{P,T}
    pipe::P
    input_colname::Symbol
    target::T
end
function preprocess(s::StaticTargetPreprocessor, track)
    (input = Vector.(getproperty(s.pipe(track), s.input_colname)),
     target = s.target(track),
     shock = Bool[])
end
(p::StaticTargetPreprocessor)(track) = preprocess(p, track)

struct Preprocessor{P, S, N}
    pipeline::P
    selector::S
    names::N
end
function preprocess(p::Preprocessor, data)
    tmp = dropmissing!(p.pipeline(data)[:, p.selector])
    push!(tmp, last(eachrow(tmp)))
    tmp.tˈ1[end] = 1200
    tmp.state_Δt[end] = tmp.tˈ1[end] - tmp.tˈ1[end-1]
    data = [NamedTuple{p.names}(tuple(r...)) for r in eachrow(tmp)]
end
(p::Preprocessor)(track) = preprocess(p, track)

###
### Helpers
###

function filter_center!(track)
    filter!(d -> d.state != "center", track)
    levels!(track.state, levels(track.state)[1:3])
    if hasproperty(track, :arm)
        levels!(track.arm, levels(track.arm)[1:3])
    end
    if hasproperty(track, :color)
        levels!(track.color, ["green", "blue"])
    end
    track
end
function is_green(df)
    df.green = df.color .== "green"
    df
end
function real_shock(df)
    df.real_shock = df.shock
    df
end

###
### Specific Preprocessors
###

function turn_escapetime_preprocessor()
    pipe = ShockArmEncoder() |>
           ColorEncoder() |>
           is_green |>
           filter_center! |>
           DurationPerStateEncoder(:state) |>
           LevelEncoder(:state) |>
           TurnEncoder() |>
           ColumnShifter(-1, :shock, :turn, :state_level, :green, :t)
    Preprocessor(pipe,
                    [:state_level, :shock, :green, :state_levelˈ1, :shockˈ1, :greenˈ1, :turnˈ1, :state_Δt, :tˈ1],
                    (:s, :shock, :green, :s′, :shock′, :green′, :turn, :Δt, :t))
end

function rnn_preprocessor()
    pipe = ArmEncoder() |>
           ShockArmEncoder() |>
           ColorEncoder() |>
           filter_center! |>
           DurationPerStateEncoder(:arm) |>
           TurnEncoder() |>
           ColumnShifter(-1, :turn, :shock) |>
           turn_escapetime |>
           is_green |>
           real_shock |>
           VectorEncoder(:state, :is_green, :real_shock)
    Preprocessor(pipe,
                 input = :vectors,
                 target = :turn_escapetime,
                 shock = :shock)
end

const GENOTYPEDICT = Dict{SubString{String}, Int64}("dgrp584" => 27, "dgrp721" => 42, "dgrp227" => 52, "dgrp627" => 48, "dgrp391" => 61, "dgrp380" => 75, "dgrp861" => 84, "dgrp897" => 63, "dgrp189" => 55, "dgrp879" => 12, "dgrp738" => 62, "dgrp303" => 15, "dgrp93" => 59, "dgrp804" => 88, "dgrp386" => 20, "dgrp32" => 86, "dgrp737" => 35, "dgrp392" => 76, "dgrp395" => 30, "dgrp801" => 56, "dgrp705" => 9, "dgrp338" => 87, "dgrp129" => 82, "dgrp31" => 64, "dgrp91" => 4, "dgrp765" => 44, "dgrp109" => 72, "dgrp385" => 29, "dgrp21" => 73, "dgrp362" => 19, "dgrp911" => 51, "dgrp321" => 16, "dnc1" => 5, "dgrp26" => 28, "dgrp802" => 39, "dgrp818" => 68, "ee5" => 22, "dgrp776" => 45, "dgrp859" => 14, "dgrp820" => 11, "dgrp304" => 17, "dgrp437" => 25, "dgrp563" => 50, "dgrp101" => 71, "dgrp373" => 3, "dgrp712" => 80, "dgrp595" => 8, "dgrp732" => 34, "dgrp208" => 2, "dgrp505" => 79, "dgrp317" => 85, "dgrp502" => 78, "dgrp105" => 13, "dgrp517" => 31, "dgrp850" => 67, "dgrp790" => 38, "dgrp535" => 89, "dgrp309" => 18, "dgrp486" => 26, "dgrp313" => 41, "dgrp217" => 60, "dgrp491" => 77, "dgrp100" => 1, "dgrp808" => 43, "dgrp821" => 83, "dgrp884" => 90, "dgrp786" => 36, "dgrp318" => 66, "dgrp787" => 37, "dgrp559" => 33, "dgrp805" => 57, "dgrp354" => 65, "dgrp310" => 74, "dgrp551" => 32, "dgrp319" => 53, "dgrp153" => 40, "dgrp59" => 21, "dgrp855" => 46, "dgrp390" => 23, "dgrp716" => 81, "dgrp228" => 7, "dgrp892" => 58, "dgrp822" => 54, "dgrp405" => 24, "dgrp382" => 47, "dgrp853" => 69, "dgrp195" => 6, "dgrp913" => 70, "dgrp75" => 10, "dgrp440" => 49)
function genotype_index(track)
    GENOTYPEDICT[FileNames.genotype(metadata(track)["filename"])]
end
function genotype_predictor_preprocessor()
    pipe = ArmEncoder() |>
           ShockArmEncoder() |>
           filter_center! |>
           DurationPerStateEncoder(:state) |>
           real_shock |>
           VectorEncoder(:state, :real_shock, :state_Δt)
    StaticTargetPreprocessor(pipe, :vectors, genotype_index)
end
