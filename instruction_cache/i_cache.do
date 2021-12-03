# Add Waves to Modelsim
add wave addr instr

# Test Instruction Cache
force addr "00000"
run 2

force addr "00001"
run 2

force addr "00010"
run 2

force addr "00011"
run 2

force addr "00100"
run 2
