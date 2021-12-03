# Nicholas Kawwas (40124338)
# COEN 316 - LAB DM-X
# Script to Run Vivado in Batch Mode

# Dependency
# source /CMC/tools/xilinx/Vivado_2018.2/Vivado/2018.2/settings64_CMC_central_license.csh

# Run Script
# vivado -log next_address.log -mode batch -source next_address.tcl

# Read VHDL Source Files and XDC Constraints File
read_vhdl { ./next_address_board.vhd ./next_address.vhd }
read_xdc next_address.xdc

# Synthesize Design using Top Level VHDL Entity Name and Target Xilinx FPGA
synth_design -top next_address_board -part xc7a100tcsg324-1

opt_design
place_design
route_design

report_timing_summary

# Generate Bitstream File
write_bitstream -force next_address_backup.bit 
