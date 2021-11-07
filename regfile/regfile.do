# Add Waves to Modelsim
add wave read_a read_b din write_address write reset clk out_a out_b 

# Forces Clk to 0 for 2ns then 1 for 2ns, Repeating every 4ns
force clk 0 2 -r 4
force clk 1 4 -r 4

# Test - Reset All Registers
# Read Registers 0 and 1
force reset 1
force write 0
force read_a 00000
force read_b 00001
force write_address 00000
force din X"10101010"
run 2


# Test - Write to Register 0 1000 0000
# Read Registers 0 and 1
force reset 0
force write 1
force read_a 00000
force read_b 00001
force write_address 00000
force din X"10000000"
run 4

# Test - Write to Register 1 1000 0001
# Read Registers 0 and 1
force reset 0
force write 1
force read_a 00000
force read_b 00001
force write_address 00001
force din X"10000001"
run 4

# Test - Write to Register 2 1000 0010
# Read Registers 1 and 2
force read_a 00001
force read_b 00010
force write_address 00010
force din X"10000010"
run 4

# Test - Write to Register 3 1000 0011
# Read Registers 2 and 3
force read_a 00010
force read_b 00011
force write_address 00011
force din X"10000011"
run 4

# Test - Read Register 3 and 4
# Write to Register 4 1000 0100
force read_a 00011
force read_b 00100
force write_address 00100
force din X"10000100"
run 4

# Test - Read Register 4 and 5
# Write to Register 5 1000 0101
force read_a 00100
force read_b 00101
force write_address 00101
force din X"10000101"
run 4

# Test - Read Register 5 and 6
# Write to Register 6 1000 0110
force read_a 00101
force read_b 00110
force write_address 00110
force din X"10000110"
run 4

# Test - Read Register 6 and 7
# Write to Register 7 1000 0111
force read_a 00110
force read_b 00111
force write_address 00111
force din X"10000111"
run 4

# Test - Read Register 7 and 8
# Write to Register 8 1000 1000 
force read_a 00111
force read_b 01000
force write_address 01000
force din X"10001000"
run 4

# Test - Read Register 8 and 9
# Write to Register 9 1000 1001
force read_a 01000
force read_b 01001
force write_address 01001
force din X"10001001"
run 4

# Test - Read Register 9 and 10
# Write to Register 10 1000 1010
force read_a 01001
force read_b 01010
force write_address 01010
force din X"10001010"
run 4

# Test - Read Register 10 and 11
# Write to Register 11 1000 1011
force read_a 01010
force read_b 01011
force write_address 01011
force din X"10001011"
run 4

# Test - Read Register 11 and 12
# Write to Register 12 1000 1100
force read_a 01011
force read_b 01100
force write_address 01100
force din X"10001100"
run 4

# Test - Read Register 12 and 13
# Write to Register 13 1000 1101
force read_a 01100
force read_b 01101
force write_address 01101
force din X"10001101"
run 4

# Test - Read Register 13 and 14
# Write to Register 14 1000 1110
force read_a 01101
force read_b 01110
force write_address 01110
force din X"10001110"
run 4

# Test - Read Register 14 and 15
# Write to Register 15 1000 1111
force read_a 01110
force read_b 01111
force write_address 01111
force din X"10001111"
run 4

# Test - Read Register 15 and 16
# Write to Register 16 1001 0000
force read_a 01111
force read_b 10000
force write_address 10000
force din X"10010000"
run 4

# Test - Read Register 16 and 17
# Write to Register 17 1001 0001
force read_a 10000
force read_b 10001
force write_address 10001
force din X"10010001"
run 4

# Test - Read Register 17 and 18
# Write to Register 18 1001 0010
force read_a 10001
force read_b 10010
force write_address 10010
force din X"10010010"
run 4

# Test - Read Register 18 and 19
# Write to Register 19 1001 0011
force read_a 10010
force read_b 10011
force write_address 10011
force din X"10010011"
run 4

# Test - Read Register 19 and 20
# Write to Register 20 1001 0100
force read_a 10011
force read_b 10100
force write_address 10100
force din X"10010100"
run 4

# Test - Read Register 20 and 21
# Write to Register 21 1001 0101
force read_a 10100
force read_b 10101
force write_address 10101
force din X"10010101"
run 4

# Test - Read Register 21 and 22
# Write to Register 22 1001 0110
force read_a 10101
force read_b 10110
force write_address 10110
force din X"10010110"
run 4

# Test - Read Register 22 and 23
# Write to Register 23 1001 0111
force read_a 10110
force read_b 10111
force write_address 10111
force din X"10010111"
run 4

# Test - Read Register 23 and 24
# Write to Register 24 1001 1000
force read_a 10111
force read_b 11000
force write_address 11000
force din X"10011000"
run 4

# Test - Read Register 24 and 25
# Write to Register 25 1001 1001
force read_a 11000
force read_b 11001
force write_address 11001
force din X"10011001"
run 4

# Test - Read Register 25 and 26
# Write to Register 26 1001 1010
force read_a 11001
force read_b 11010
force write_address 11010
force din X"10011010"
run 4

# Test - Read Register 26 and 27
# Write to Register 27 1001 1011
force read_a 11010
force read_b 11011
force write_address 11011
force din X"10011011"
run 4

# Test - Read Register 27 and 28
# Write to Register 28 1001 1011
force read_a 11011
force read_b 11100
force write_address 11100
force din X"10011100"
run 4

# Test - Read Register 28 and 29
# Write to Register 29 1001 1101
force read_a 11100
force read_b 11101
force write_address 11101
force din X"10011101"
run 4

# Test - Read Register 29 and 30
# Write to Register 30 1001 1110
force read_a 11101
force read_b 11110
force write_address 11110
force din X"10011110"
run 4

# Test - Read Register 30 and 31
# Write to Register 31 1001 1111
force read_a 11110
force read_b 11111
force write_address 11111
force din X"10011111"
run 4

# Test - Random Register 5 and 16
force write 0
force read_a 00101
force read_b 10000
run 4
