# Makefile
# Assumptions
# 1. License path variable has been set
# 2. All relevant tools binaries are available in PATH variable

all: chk_verilog chk_hspice chk_dc

default:
	@echo "Do nothing"

chk_verilog:
	@echo "Validating vcs..."
	cd verilog && vcs -full64 test_verilog.v  && ./simv
	@echo "✅ VERILOG validated: VCS basic file run completed successfully!"

chk_hspice:
	@echo "Validating Hspice..."
	cd hspice && \
		hspice inverter.sp > inverter.lis &&	\
		grep -i "total elapsed time" inverter.lis
	@echo "✅ HSPICE validated: HSPICE basic CMOS inverter simulation run completed successfully!"


# Design Compiler
chk_dc:
	@echo "Validating Design Compiler..."
	@cd dc && \
	    dc_shell -f synth.tcl | tee dc_run.log && \
	    grep -i "Number of combinational cells.*1" dc_run.log && \
	    grep -i "Elapsed time for this session" dc_run.log
	@echo "✅ DESIGN COMPILER validated: Design compiler basic run for a simple AND gate validated successfully!"
	@cd dc && test -f synthesized.v && echo "✅ Synthesized netlist generated." || echo "❌ Netlist missing."


clean:
	@echo "🧹 Cleaning up..."
	@cd dc && rm -f dc_run.log synthesized.v command.log *.mr *.ddc *.syn *.rep
	@cd hspice && rm -f inverter.*0 inverter.lis
	@cd verilog && rm -rf csrc simv simv.daidir ucli.key


