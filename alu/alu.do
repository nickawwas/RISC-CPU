# Add Waves to Modelsim
add wave x y add_sub add_sub_out func logic_func logic_out zero overflow output

# Test Add_Sub 0 - add_sub_out: 00001201 (x + y)
# Test Logic_Func 00 - logic_out: 00000100 (x and y)
# Test Func 00 - output: 00001101 (y)
force add_sub 0
force func 00
force logic_func 00
force x X"00000100"
force y X"00001101"
run 2

# Test Add_Sub 0 - add_sub_out: 80001001
# Test Logic_Func 01 - logic_out: 80001001 (x or y)
# Test Func 01 - output: 00000001 (MSB = 1)
force add_sub 0
force func 01
force logic_func 01
force x X"80001000"
force y X"00000001"
run 2

# Test Add_Sub 0 - add_sub_out: 1 00011001, overflow: 1 
# Test Logic_Func 10 - logic_out: 00011001 (x xor y)
# Test Func 10 - output: 00011001 (x + y) 
force add_sub 0
force func 10
force logic_func 10
force x X"80010000"
force y X"80001001"
run 2

# Test Add_Sub 1 - add_sub_out: 1 7FFFFFFF, overflow: 1
# Test Logic_Func 10 - logic_out: 80000001 (x xor y)
# Test Func 10 - output: 7FFFFFFF (x - y)
force add_sub 1
force func 10
force logic_func 10
force x X"80000000"
force y X"00000001"
run 2

# Test Add_Sub 1 - add_sub_out: 0003CFFF, overflow: 0
# Test Logic_Func 00 - logic_out: 0000 0000 (x and y)
# Test Func 11 - output: 0000 0000 (x and y)
force add_sub 1
force func 11
force logic_func 00
force x X"00040000"
force y X"00003001"
run 2

# Test Add_Sub 0: 079131F1
# Test Logic_Func 00: 0000 0000
# Test Func 10: 079131F1
force add_sub 0
force func 10
force logic_func 00
force x X"069030F0"
force y X"01010101"
run 2

# Test Add_Sub 1: FFBA B536 (-454ACA)
# Test Logic_Func 01: 1BBCFEA
# Test Func 10: FFBA B536 (-454ACA)
force add_sub 1
force func 10
force logic_func 01
force x X"00BBC520"
force y X"01010FEA"
run 2

# Test Add_Sub 0 - add_sub_out: 0102 0101, zero: 0 (Not Zero)
# Test Logic_Func 10 - logic_out: 0100 0101 (x xor y)
# Test Func 01 - output: 00000000 (MSB = 0)
force add_sub 0
force func 01
force logic_func 10
force x X"00010000"
force y X"01010101"
run 2

# Test Add_Sub 1 - add_sub_out: 00000000, zero: 1
# Test Logic_Func 11 - logic_out: FFFF FEFE (x nor y)
# Test Func 01 - output: 00000000 (MSB = 0)
force add_sub 1
force func 01
force logic_func 11
force x X"00000101"
force y X"00000101"
run 2