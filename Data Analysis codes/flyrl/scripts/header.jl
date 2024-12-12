using Pkg
Pkg.activate(@__DIR__)
using FlyRL, LaplacianExpectationMaximization, DataFrames, Statistics, CSV, JLD2

const DATADIR = joinpath(@__DIR__, "..", "data")
const FIGURESDIR = joinpath(@__DIR__, "..", "figures")
mkpath(FIGURESDIR)

const DATA = FlyRL.load_populations();
