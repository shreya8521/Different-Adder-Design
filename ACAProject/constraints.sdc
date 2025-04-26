# Clock constraints
create_clock -name clk -period 4.59 [get_ports clock]
set_clock_uncertainty -setup 0.5 [get_clocks clk]
set_clock_uncertainty -hold 0.1 [get_clocks clk]
set_clock_transition 0.1 [get_clocks clk]

# Input delays - simplified version without remove_from_collection
set_input_delay -clock clk -max 2 [get_ports {op1[*] op2[*]}]
set_input_delay -clock clk -min 1 [get_ports {op1[*] op2[*]}]

# Output delays
set_output_delay -clock clk -max 2 [get_ports {sum[*] crout}]
set_output_delay -clock clk -min 1 [get_ports {sum[*] crout}]

# Reset constraints
set_false_path -from [get_ports reset]

# Load and drive settings
set_load 0.05 [all_outputs]
set_drive 1 [all_inputs]

# Operating conditions
set_operating_conditions -library typical

# Simplified wire load settings (remove if still causing issues)
# set_wire_load_mode top
# set_wire_load_model -name "suggested_wire_load_model"