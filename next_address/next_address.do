# Add Waves to Modelsim
add wave rt rs pc target_address branch_type pc_sel next_pc

# Initialize Values 
force rt X"10000000"
force rs X"10000001"
force pc X"10000010"
force branch_type 11

# Test - Force pc_sel 01
# Jump to Extended Target Address (Sign Extended 32 Bits)
force pc_sel 01
force target_address "00000000000000000000000000" 
run 2

# Testing W/ 0 and 1 Sign Extend
force pc_sel 01
force target_address "11111111111111111111111111"
run 2

# Test - Force pc_sel 10 
# Jump Register Rs
force pc_sel 10
force rs X"0ABCDEF0"
run 2

# Test - Force pc_sel 11 with branch_type 00
# Unused - Copies Behavior of pc_sel 00
# No Branch
force pc_sel 11
force branch_type 00
run 2 

# Test - Force pc_sel 11 with branch_type 01
# Unused - Simply Increments Pc by 1
# Branch Equal (beq) 
force pc_sel 11
force branch_type 01
run 2

# Testing for True and False
force rt X"0ABCDEF0"
run 2

# Test - Force pc_sel 11 with branch_type 10
# Unused - Simply Increments Pc by 1
# Branch Not Equal (bne) 
force pc_sel 11
force branch_type 10
run 2 

# Testing for True and False
force rt X"1ABCDEF1"
run 2

# Test - Force pc_sel 11 with branch_type 11
# Unused - Simply Increments Pc by 1
# Branch Less than Zero (Bltz)
force pc_sel 11
force branch_type 11
run 2 

# Testing for True and False
force rs X"11111111"
run 2

# Test - Force pc_sel 00  with branch_type 00
# No Unconditional Jump 
# No Branch
force pc_sel 00
force branch_type 00
run 2 

# Test - Force pc_sel 00 with branch_type 01
# No Unconditional Jump 
# Branch Equal (beq) 
force pc_sel 00
force branch_type 01
run 2 

# Test - Force pc_sel 00 with branch_type 10
# No Unconditional Jump 
# Branch Not Equal (bne) 
force pc_sel 00
force branch_type 10
run 2 

# Test - Force pc_sel 00 with branch_type 11
# No Unconditional Jump 
# Branch Less than Zero (Bltz)
force pc_sel 00
force branch_type 11
run 2 
