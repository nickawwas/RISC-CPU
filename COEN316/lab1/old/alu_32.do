# Add Waves to Modelsim
add wave x y add_sub add_sub_out func logic_func logic_out zero overflow output

# Addition Test: 00001201
force add_sub 0
force func 01
force x X"00000100"
force y X"00001101"
run 2
examine add_sub_out overflow

# Addition Test: 80000001
force x X"80000000"
force y X"00000001"
run 2
examine add_sub_out overflow

# Addition Test: 1 00000001
force x X"80000000"
force y X"80000001"
run 2
examine add_sub_out overflow

# Subtraction Test: 7FFFFFFF 
force add_sub 1
force x X"80000000"
force y X"00000001"
run 2
examine add_sub_out overflow

# Subtraction Test: -1
force add_sub 1
force x X"00000001"
force y X"00000002"
run 2
examine add_sub_out overflow

# Subtraction Test: 0003CFFF
force add_sub 1
force x X"00040000"
force y X"00003001"
run 2
examine add_sub_out overflow

# Logic Unit 00 Test: 0101 0101 
force logic_func 00
force x X"00000000"
force y X"01010101"
run 2 
examine logic_out

# MUX 01 Test (+): MSB 1  
force func 01
force x X"0F900000"
force y X"01010001"
force add_sub 1
run 2
examine logic_out output

# MUX 01 Test (+): MSB 0
force func 01
force x X"05402100"
force y X"01010101"
force add_sub 1
run 2
examine logic_out output

# MUX 10 Test (+): 079131F1
force func 10
force x X"069030F0"
force y X"01010101"
force add_sub 1
run 2
examine logic_out output

# MUX 10 Test (-): -454ACA
force func 10
force x X"00BBC520"
force y X"01010FEA"
force add_sub 0
run 2
examine logic_out output

# MUX 11 & Logic Unit 00 Test (AND): 00010100
force func 11
force logic_func 00
force x X"00010110"
force y X"01010101"
run 2
examine logic_out output

# MUX 11 & Logic Unit 01 Test (OR): 00010100
force func 11
force logic_func 01
force x X"00101100"
force y X"01010101"
run 2
examine logic_out output

# MUX 11 & Logic Unit 10 Test (XOR): 1011 1100
force func 11
force logic_func 10
force x X"00010110"
force y X"01010101"
run 2
examine logic_out output

# MUX 11 & Logic Unit 11 Test (NOR): 1000 0010
force func 11
force logic_func 11
force x X"00111000"
force y X"01010101"
run 2
examine logic_out output

# Zero Test: 0 (Not Zero)
force add_sub 0
force func 01
force x X"00000000"
force y X"01010101"
run 2
examine zero

# Zero Test: 1 (Zero)
force add_sub 1
force func 01
force x X"00000101"
force y X"00000101"
run 2
examine logic_out

