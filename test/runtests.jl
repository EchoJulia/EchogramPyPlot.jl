using EchogramPyPlot

using Test


a = rand(100,100)
eg(a)
egshow(a)
eghist(a)

using SimradEK60
using SimradEK60TestData

filename = EK60_SAMPLE
ps = pings(filename)
ps38 = [p for p in ps if p.frequency == 38000]
Sv38 = Sv(ps38)

x = eg(Sv38) # quick echogram

x = egshow(Sv38) # full echogram, preserving resolution

x = eghist(Sv38) # histogram

x = eg(Sv38,cmap=EK500, vmin=-95,vmax=-50) # More like Echoview?



