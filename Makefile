# Makefile



default:
	@echo "Do nothing"

chk_verilog:
	cd verilog
	vcs -full64 test_verilog.v
