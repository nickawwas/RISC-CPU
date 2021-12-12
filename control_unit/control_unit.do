# Add Control Bits
add wave op_code func_field reg_dst reg_in_src reg_write alu_src add_sub data_write branch_type pc_sel logic_func func 

# Func Field Set to Don't Care
force func_field 000000

# Test Lui
force op_code 001111
run 2

# Test Addi - Arithmetic Immediate
force op_code 001000
run 2 

# Test Slti
force op_code 001010
run 2 

# Test Andi - Logical Immediate
force op_code 001110
run 2

# Test Lw - Memory Access
force op_code 100011
run 2

# Test Sw 
force op_code 101011
run 2

# Test J - Unconditional Branch 
force op_code 000010
run 2

# Test Beq - Conditional Branch
force op_code 000100
run 2 

# Test Jr 
force func_field 001000
force op_code 000000
run 2 

# Test Or - Logical
force func_field 100110
force op_code 000000
run 2 

# Test Add - Arithmetic 
force func_field 100000
force op_code 000000
run 2 

