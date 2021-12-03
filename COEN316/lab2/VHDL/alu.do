# Add Waves to Modelsim
add wave x_in y_in add_sub func logic_func zero overflow output_out

# Addition Test: 0011

force x_in 0001
force y_in 0010
run 2
examine output*

# Addition Test: 1001
force x_in 1000
force y_in 0001
run 2
examine output*

# Addition Test: 1 0001
force x_in 1001
force y_in 1000
run 2
examine output*

# Subtraction Test: 0111 
force add_sub 1
force x_in 1000
force y_in 0001
run 2
examine output*

# Subtraction Test: -1
force add_sub 1
force x_in 0001
force y_in 0010
run 2
examine output

# Logic Unit 00 Test: 0101
force logic_func 00
force x_in 1001
force y_in 0101
run 2 
examine output

# MUX 01 Test (+): MSB 1 
force func 01
force x_in 1001
force y_in 0101
force add_sub 1
run 2
examine output

# MUX 01 Test (+): MSB 0
force func 01
force x_in 0101
force y_in 0010
force add_sub 1
run 2
examine output

# MUX 10 Test (+): 0111
force func 10
force x_in 0101
force y_in 0010
force add_sub 1
run 2
examine output

# MUX 10 Test (-): 0001
force func 10
force x_in 0101
force y_in 0100
force add_sub 0
run 2
examine output

# MUX 11 & Logic Unit 00 Test (AND): 0001
force func 11
force logic_func 00
force x_in 1001
force y_in 0101
run 2
examine output

# MUX 11 & Logic Unit 01 Test (OR): 1101
force func 11
force logic_func 01
force x_in 1100
force y_in 0101
run 2
examine output

# MUX 11 & Logic Unit 10 Test (XOR): 0100
force func 11
force logic_func 10
force x_in 0001
force y_in 0101
run 2
examine output

# MUX 11 & Logic Unit 11 Test (NOR): 0010
force func 11
force logic_func 11
force x_in 1000
force y_in 0101
run 2
examine output

# Zero Test: 0 (Not Zero)
force add_sub 0
force func 01
force x_in 0000
force y_in 0101
run 2
examine output

# Zero Test: 1 (Zero)
force add_sub 1
force func 01
force x_in 0101
force y_in 0101
run 2
examine output 

