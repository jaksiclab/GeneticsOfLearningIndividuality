"""
FlyRL is a software package to fit, simulate and analyze reinforcement learning methods to
the navigation behaviour of fruit flies in a Y-Maze with location-dependent shocks.
The data is recorded by Riddha Manna and Ana Marija Jaksic https://www.epfl.ch/labs/jaksic-lab.
"""
module FlyRL

using StatsBase, CategoricalArrays, DataFrames, Printf, LinearAlgebra
using CSV, RollingFunctions, JLD2, LibGit2
using ComponentArrays, Distributions
using ConcreteStructs
import LogExpFunctions: log1pexp
using Random
using DocStringExtensions
using Makie
import LaplacianExpectationMaximization: parameters, logp, logp_tracked, initialize!, simulate, sample, drop, PopulationModel, DiagonalNormalPrior
import Distributions: Categorical
import LaplacianExpectationMaximization as F
using YMaze
import YMaze: encode, encode!, AbstractEncoder, labels, nocompute,
              ArmEncoder, ShockArmEncoder, ColorEncoder, plot_track,
              plot_maze, read, read_directory, DEFAULT_Δt, with_outliers,
              in_maze, in_left, in_right, in_middle, in_turn, in_center,
              in_left_arm, in_left_turn, in_right_arm, in_right_turn,
              in_middle_arm, in_middle_turn,
              random_maze_position, hascols, SQRT3, alloc_cols!

include("io.jl")
include("encoders.jl")
include("preprocessor.jl")

include("models.jl")

include("predict_genotype.jl")

include("fitting.jl")

include("analyze_durations.jl")
include("lateralization.jl")
include("policy_distances.jl")
include("probshock.jl")

const __REV__ = Ref("")
function __init__()
    dir = joinpath(@__DIR__, "..")
    global __REV__[] = LibGit2.head(dir)[1:7]
end
end # module
