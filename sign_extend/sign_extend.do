# Add Waves to Modelsim
add wave func immediate_in full_out 

# Test Load Upper Immediate (00)
force immediate_in X"FED1"
force func "00"
run 2

# Test Set Less immediate (01)
# Extend using MSB (1)
force immediate_in X"F911"
force func "01"
run 2

# Test Arithmetic Instructions (11)
force immediate_in X"ABC2"
force func "11"
run 2

# Test Logical Instructions (10)
# Extend using MSB (0)
force immediate_in X"1001"
force func "10"
run 2
