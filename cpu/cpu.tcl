# Nicholas Kawwas (40124338)
# COEN 316 - LAB DM-X
# Script to Run Vivado in Batch Mode

# Dependency
# source /CMC/tools/xilinx/Vivado_2018.2/Vivado/2018.2/settings64_CMC_central_license.csh

# Run Script
# vivado -log cpu.log -mode batch -source cpu.tcl

# Read VHDL Source Files and XDC Constraints File
read_vhdl { ./cpu_board.vhd ./cpu.vhd ./control_unit.vhd ./next_address.vhd ./pc.vhd ./i_cache.vhd ./regfile.vhd ./sign_extend.vhd ./alu.vhd ./d_cache.vhd}
read_xdc cpu.xdc

# Synthesize Design using Top Level VHDL Entity Name and Target Xilinx FPGA
synth_design -top cpu_board -part xc7a100tcsg324-1

opt_design
place_design
route_design

report_timing_summary

# Generate Bitstream File
write_bitstream -force cpu.bit
