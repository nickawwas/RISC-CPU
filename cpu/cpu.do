# Add Waves to Modelsim
add wave clk reset rs_out rt_out pc_out overflow zero

# Add Signals
add wave reg_out_a reg_out_b pcm_out ic_out next_out sign_out d_in y_in alu_out dc_out add

# Add Control Bits
add wave reg_dst reg_in_src reg_write alu_src add_sub data_write branch_type pc_sel logic_func func 

# Forces Clk to 0 for 2ns then 1 for 2ns, Repeating every 4ns
force clk 0 2 -r 4
force clk 1 4 -r 4

# Test Reset
force reset 1
run 2

# Test Instruction Cache
force reset 0
run 2

run 2

run 2

run 2

run 2

run 2

run 2

run 2

run 2
