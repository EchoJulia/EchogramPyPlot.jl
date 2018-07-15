using EchogramPyPlot

@static if VERSION < v"0.7.0-DEV.2005"
    using Base.Test
else
    using Test
end

a = rand(100,100)
eg(a)
egshow(a)
eghist(a)

