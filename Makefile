# Makefile
# Assumptions
# 1. License path variable has been set
# 2. All relevant tools binaries are available in PATH variable

all: chk_verilog chk_hspice chk_dc

default:
	@echo "Do nothing"

chk_verilog:
	cd verilog && vcs -full64 test_verilog.v  && ./simv
	@echo "VERILOG validated: VCS basic file run completed successfully!"

chk_hspice:
	cd hspice && \
		hspice inverter.sp > inverter.lis &&	\
		grep -i "total elapsed time" inverter.lis
	@echo "HSPICE validated: HSPICE basic CMOS inverter simulation run completed successfully!"


# Design Compiler
chk_dc
	cd dc && \
	    dc_shell -f synth.tcl | tee dc_run.log && \
	    grep -i "compiled successfully" dc_run.log
	@echo "DESIGN COMPILER validated: Design compiler basic run for a simple and gate validated successfully!"


