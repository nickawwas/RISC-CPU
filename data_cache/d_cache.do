# Add Waves to Modelsim
add wave din addr data_write reset clk dout 

# Forces Clk to 0 for 2ns then 1 for 2ns, Repeating every 4ns
force clk 0 2 -r 4
force clk 1 4 -r 4

# Test - Reset All Data Cache Blocks
# Read Data Cache Block 0
force reset 1
force data_write 0
force addr 00000
force din X"10101010"
run 2

# Test - Write to Data Cache Block 0 1000 0000
# Read Data Cache Blocks 0
force reset 0
force data_write 1
force addr 00000
force din X"10000000"
run 4

# Test - Write to Data Cache Block 1 1000 0001
# Read Data Cache Blocks 1 
force reset 0
force data_write 1
force addr 00001
force din X"10000001"
run 4

# Test - Write to Data Cache Block 2 1000 0010
# Read Data Cache Blocks 2
force addr 00010
force din X"10000010"
run 4

# Test - Write to Data Cache Block 3 1000 0011
# Read Data Cache Blocks 3
force addr 00011
force din X"10000011"
run 4

# Test - Read Data Cache Block 4
# Write to Data Cache Block 4 1000 0100
force addr 00100
force din X"10000100"
run 4

# Test - Read Data Cache Block 5
# Write to Data Cache Block 5 1000 0101
force addr 00101
force din X"10000101"
run 4

# Test - Read Data Cache Block 6
# Write to Data Cache Block 6 1000 0110
force addr 00110
force din X"10000110"
run 4

# Test - Read Data Cache Block 7
# Write to Data Cache Block 7 1000 0111
force addr 00111
force din X"10000111"
run 4

# Test - Read Data Cache Block 8
# Write to Data Cache Block 8 1000 1000 
force addr 01000
force din X"10001000"
run 4

# Test - Read Data Cache Block 9
# Write to Data Cache Block 9 1000 1001
force addr 01001
force din X"10001001"
run 4

# Test - Read Data Cache Block 10
# Write to Data Cache Block 10 1000 1010
force addr 01010
force din X"10001010"
run 4

# Test - Read Data Cache Block 11
# Write to Data Cache Block 11 1000 1011
force addr 01011
force din X"10001011"
run 4

# Test - Read Data Cache Block 12
# Write to Data Cache Block 12 1000 1100
force addr 01100
force din X"10001100"
run 4

# Test - Read Data Cache Block 13
# Write to Data Cache Block 13 1000 1101
force addr 01101
force din X"10001101"
run 4

# Test - Read Data Cache Block 14
# Write to Data Cache Block 14 1000 1110
force addr 01110
force din X"10001110"
run 4

# Test - Read Data Cache Block 15
# Write to Data Cache Block 15 1000 1111
force addr 01111
force din X"10001111"
run 4

# Test - Read Data Cache Block 16
# Write to Data Cache Block 16 1001 0000
force addr 10000
force din X"10010000"
run 4

# Test - Read Data Cache Block 17
# Write to Data Cache Block 17 1001 0001
force addr 10001
force din X"10010001"
run 4

# Test - Read Data Cache Block 18
# Write to Data Cache Block 18 1001 0010
force addr 10010
force din X"10010010"
run 4

# Test - Read Data Cache Block 19
# Write to Data Cache Block 19 1001 0011
force addr 10011
force din X"10010011"
run 4

# Test - Read Data Cache Block 20
# Write to Data Cache Block 20 1001 0100
force addr 10100
force din X"10010100"
run 4

# Test - Read Data Cache Block 21
# Write to Data Cache Block 21 1001 0101
force addr 10101
force din X"10010101"
run 4

# Test - Read Data Cache Block 22
# Write to Data Cache Block 22 1001 0110
force addr 10110
force din X"10010110"
run 4

# Test - Read Data Cache Block 23
# Write to Data Cache Block 23 1001 0111
force addr 10111
force din X"10010111"
run 4

# Test - Read Data Cache Block 24
# Write to Data Cache Block 24 1001 1000
force addr 11000
force din X"10011000"
run 4

# Test - Read Data Cache Block 25
# Write to Data Cache Block 25 1001 1001
force addr 11001
force din X"10011001"
run 4

# Test - Read Data Cache Block 26
# Write to Data Cache Block 26 1001 1010
force addr 11010
force din X"10011010"
run 4

# Test - Read Data Cache Block 27
# Write to Data Cache Block 27 1001 1011
force addr 11011
force din X"10011011"
run 4

# Test - Read Data Cache Block 28
# Write to Data Cache Block 28 1001 1011
force addr 11100
force din X"10011100"
run 4

# Test - Read Data Cache Block 29 
# Write to Data Cache Block 29 1001 1101
force addr 11101
force din X"10011101"
run 4

# Test - Read Data Cache Block 30 
# Write to Data Cache Block 30 1001 1110
force addr 11110
force din X"10011110"
run 4

# Test - Read Data Cache Block 31
# Write to Data Cache Block 31 1001 1111
force addr 11111
force din X"10011111"
run 4

# Test - Random Data Cache Block 5
force data_write 0
force addr 00101
run 4

# Test - Reset All Data Cache Blocks
# Read from Random, Cleared Data Cache Block 4
force reset 1
force addr 00100
run 4
