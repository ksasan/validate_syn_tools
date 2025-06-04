# Makefile

all: chk_verilog

default:
	@echo "Do nothing"

chk_verilog:
	cd verilog && vcs -full64 test_verilog.v  && ./simv
	@echo "VERILOG validated: VCS basic file run completed successfully!"
