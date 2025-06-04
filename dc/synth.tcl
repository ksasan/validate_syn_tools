# Read RTL
read_verilog simple.v

# Set the top module
current_design top

# Check for design issues
check_design

# Set constraints (very basic)
create_clock -name clk -period 10
set_input_delay 1 -clock clk [all_inputs]
set_output_delay 1 -clock clk [all_outputs]

# Compile design
compile

# Report some useful info
report_area
report_timing
report_resources

# Save synthesized netlist
write -format verilog -hierarchy -output synthesized.v

# Exit DC
exit

