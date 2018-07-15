# EchogramPyPlot

[![Build Status](https://travis-ci.org/EchoJulia/EchogramPyPlot.jl.svg?branch=master)](https://travis-ci.org/EchoJulia/EchogramPyPlot.jl)

[![Coverage Status](https://coveralls.io/repos/EchoJulia/EchogramPyPlot.jl/badge.svg?branch=master&service=github)](https://coveralls.io/github/EchoJulia/EchogramPyPlot.jl?branch=master)

[![codecov.io](http://codecov.io/github/EchoJulia/EchogramPyPlot.jl/coverage.svg?branch=master)](http://codecov.io/github/EchoJulia/EchogramPyPlot.jl?branch=master)

Echograms and other hydroacoustic visualisations using PyPlot.


	using SimradEK60
	using SimradEK60TestData
	using EchogramPyPlot

	filename = EK60_SAMPLE
	ps = pings(filename)
	ps38 = [p for p in ps if p.frequency == 38000]
	Sv38 = Sv(ps38)

	eg(Sv38) # quick echogram

	egshow(Sv38) # full echogram, preserving resolution

	eghist(Sv38) # histogram

	eg(Sv38,cmap=EK500, vmin=-95,vmax=-50) # More like Echoview?
