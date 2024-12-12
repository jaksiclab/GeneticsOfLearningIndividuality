module PlottingExt

using Makie, DocStringExtensions
import YMaze: color, in_maze, BOX_WIDTH, BOX_HEIGHT, plot_maze, plot_track, plot_track_3D

function _color(track)
    if hasproperty(track, :pattern)
        color.(track.pattern, track.arm)
    else
        "blue"
    end
end
function _colors(track)
    c = _color(track)
    s = shock(track)
    ifelse.(s, "yellow", c), c
end
function shock(track)
    hasproperty(track, :shock) && return track.shock
    hasproperty(track, :raw_shock) && return track.raw_shock
    false
end
"""
$SIGNATURES

Plot the outline of a maze and the positions of a fly (`track.x` and `track.y`).
See also [`plot_track`](@ref). `f = Makie.Figure()`.
"""
function plot_maze(x, y, shock, color; markersize = 6, f = Figure())
#     @show shock
    ax = Makie.Axis(f[1, 1], aspect = BOX_WIDTH / BOX_HEIGHT, yreversed = true)
    grid = vec([(x, y) for x ∈ 0:.2:BOX_WIDTH, y ∈ 0:.2:BOX_HEIGHT])
    heatmap!(ax,
        first.(grid),
        last.(grid),
        in_maze.(first.(grid), last.(grid)),
        colormap = :grays,
        colorrange = (-1, 1),
    )
    scatter!(
        x,
        y,
#         strokecolor = shock,
        markersize = markersize,
        strokewidth = 1,
#         strokewidth = ifelse.(shock, 1., 0.),
        color = shock,
    )
    hidedecorations!(ax)
    f
end
function plot_maze(track; kw...)
    plot_maze(track.x, track.y, _colors(track)...; kw...)
end

_colsize!(f::Figure, i, a) = colsize!(f.layout, i, a)
_colsize!(f, i, a) = colsize!(f, i, a)
"""
$SIGNATURES

Plots a track as a function of time (see [`plot_track_3D`](@ref)) and on the maze outline (see [`plot_maze`](@ref)).
"""
function plot_track(x, y, time, shock, color; f = Figure(size = (940, 320)), title = "", track3D_kwargs = NamedTuple(), kwargs...)
#     Box(f[1, 1], color = (:red, 0.2), strokewidth = 0)
#     Box(f[1, 2], color = (:green, 0.2), strokewidth = 0)
    plot_track_3D(x, y, time, shock, color; f = f[1, 1], track3D_kwargs..., kwargs...)
    plot_maze(x, y, shock, color; f = f[1, 2], kwargs...)
#     _colsize!(f, 1, Auto(1))
#     _colsize!(f, 2, Auto(.6))
    f
end
function plot_track(track; kw...)
    time = hasproperty(track, :t) ? track.t : (1:length(track.x)) * DEFAULT_Δt
    plot_track(track.x, track.y, time, _colors(track)...; kw...)
end
"""
$SIGNATURES

Plots `track.x` and `track.y` as a function of `track.t`.
"""
function plot_track_3D(x, y, time, shock, color;
        f = Figure(), cm_per_pixel = 2.5/200,
        ylabel = "x [cm]",
        xlabel = "time [s]",
        zlabel = "y [cm]",
        perspectiveness = 0.3,
        markersize = 6,
        elevation = 0.15,
        azimuth = -π/2,
        maxtime = 20*60,
        viewmode = :stretch,
        alignmode = Outside(50),
        protrusions = (-30, 0, 0, -80),
    )
    ax = Axis3(f[1, 1]; ylabel, xlabel, zlabel, perspectiveness, elevation,
                        azimuth, viewmode, alignmode, protrusions,
                        yticks = ([0, 80, 160], string.([0, 1, 2])),
                        zticks = ([20, 100, 180], string.([2, 1, 0])),
                        zreversed = true)
    if shock != false
        scatter!(
            ax,
            time,
            x,
            y,
            color = shock,
            markersize = markersize,
        )
    end
    lines!(
        ax,
        time,
        x,
        y,
        color = color,
    )
    xlims!(ax, (0, maxtime))
    ylims!(ax, (0, 180))
    zlims!(ax, (170, 0))
    f
end
function plot_track_3D(track; kw...)
    time = hasproperty(track, :t) ? track.t : (1:length(track.x)) * DEFAULT_Δt
    plot_track_3D(track.x, track.y, time, _colors(track)...; kw...)
end
end
