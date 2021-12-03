# Nicholas Kawwas (40124338)
# COEN 316 LAB DM-X 

# Map VHDL Synthesis to Nexys Board
# Input - Switches
set_property -dict { PACKAGE_PIN J15   IOSTANDARD LVCMOS33 } [get_ports { rt_in[0] }];
set_property -dict { PACKAGE_PIN L16   IOSTANDARD LVCMOS33 } [get_ports { rt_in[1] }];

set_property -dict { PACKAGE_PIN M13   IOSTANDARD LVCMOS33 } [get_ports { rs_in[0] }];
set_property -dict { PACKAGE_PIN R15   IOSTANDARD LVCMOS33 } [get_ports { rs_in[1] }]; 

set_property -dict { PACKAGE_PIN R17   IOSTANDARD LVCMOS33 } [get_ports { pc_in[0] }];
set_property -dict { PACKAGE_PIN T18   IOSTANDARD LVCMOS33 } [get_ports { pc_in[1] }];
 
set_property -dict { PACKAGE_PIN U18   IOSTANDARD LVCMOS33 } [get_ports { target_address_in[0] }]; 
set_property -dict { PACKAGE_PIN R13   IOSTANDARD LVCMOS33 } [get_ports { target_address_in[1] }]; 
set_property -dict { PACKAGE_PIN T8    IOSTANDARD LVCMOS33 } [get_ports { target_address_in[2] }]; 

set_property -dict { PACKAGE_PIN U8    IOSTANDARD LVCMOS33 } [get_ports { branch_type_in[0] }];
set_property -dict { PACKAGE_PIN R16   IOSTANDARD LVCMOS33 } [get_ports { branch_type_in[1] }];

set_property -dict { PACKAGE_PIN T13   IOSTANDARD LVCMOS33 } [get_ports { pc_sel_in[0] }];
set_property -dict { PACKAGE_PIN H6    IOSTANDARD LVCMOS33 } [get_ports { pc_sel_in[1] }];

# Output - LEDs
set_property -dict { PACKAGE_PIN H17   IOSTANDARD LVCMOS33 } [get_ports { next_pc_out[0] }];
set_property -dict { PACKAGE_PIN K15   IOSTANDARD LVCMOS33 } [get_ports { next_pc_out[1] }];
set_property -dict { PACKAGE_PIN J13   IOSTANDARD LVCMOS33 } [get_ports { next_pc_out[2] }];
