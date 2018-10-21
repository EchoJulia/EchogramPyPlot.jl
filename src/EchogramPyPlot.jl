module EchogramPyPlot

using PyPlot
using ColorTypes

export echogram, eghist, egshow, eg, EK500, BW

const EK500 = [RGB(1, 1, 1),
                        RGB(159/255, 159/255, 159/255),
                        RGB(095/255, 095/255, 095/255),
                        RGB(000, 000, 1),
                        RGB(000, 000, 127/255),
                        RGB(000, 191/255, 000),
                        RGB(000, 127/255, 000),
                        RGB(1, 1, 000),
                        RGB(1, 127/255, 000),
                        RGB(1, 000, 191/255),
                        RGB(1, 000, 000),
                        RGB(166/255, 083/255, 060/255),
                        RGB(120/255, 060/255, 040/255)]

const BW = [RGB(0,0,0),
                     RGB(1.0,1.0,1.0)]

# echogram is for publication plots and composability, eg, egshow and
# eghist are for interactive use.

function echogram(m; vmin = nothing, vmax = nothing, cmap=nothing, range=nothing)

    y, x =size(m)
    
    if range==nothing
        top = 0.0
        bottom = y
    elseif isa(range, Number)
        top = 0.0
        bottom = range
    elseif isa(range, Tuple)
        top, bottom = range
    end
    
    stepr = 10^floor(log10(bottom-top))
    stepy = y * stepr / (bottom-top)
    yticks = 0:stepy:y
    yticklabels = top:stepr:bottom
    
    if length(yticks) < 3
        yticks = 0:stepy/5:y
        yticklabels = top:stepr/5:bottom
    end
    
    yticks = floor.(Int, yticks)
    yticklabels = floor.(Int, yticklabels)
    ax = gca()
    ax[:invert_yaxis]()
    ax[:set_yticks](yticks)
    ax[:set_yticklabels](yticklabels)
    
    pcolormesh(m, vmin = vmin, vmax = vmax, cmap=ColorMap(cmap))
end

function eg(A; vmin = nothing, vmax = nothing, cmap=nothing, range=nothing)
    figure()
    echogram(A; vmin = vmin, vmax = vmax, cmap=cmap, range=range)
    PyPlot.colorbar()
end


function egshow(A)
    figure()
    PyPlot.imshow(A)
    PyPlot.colorbar()
end

function eghist(A; nbins=256)
    figure()
    PyPlot.plt[:hist](A[:], nbins)
end


end # module
