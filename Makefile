# Makefile

all: chk_verilog chk_hspice

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

