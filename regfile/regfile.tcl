# Nicholas Kawwas (40124338)
# COEN 316 - LAB DM-X
# Script to Run Vivado in Batch Mode

# Dependency
# source /CMC/tools/xilinx/Vivado_2018.2/Vivado/2018.2/settings64_CMC_central_license.csh

# Run Script
# vivado -log regfile.log -mode batch -source regfile.tcl

# Read VHDL Source Files and XDC Constraints File
read_vhdl { ./regfile.vhd ./regfile_board.vhd }
read_xdc regfile.xdc

# Synthesize Design using Top Level VHDL Entity Name and Target Xilinx FPGA
synth_design -top regfile_board -part xc7a100tcsg324-1

opt_design
place_design
route_design

report_timing_summary

# Generate Bitstream File
write_bitstream -force regfile.bit 
