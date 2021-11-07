# Nicholas Kawwas (40124338)
# COEN 316 LAB DM-X 

# Map VHDL Synthesis to Nexys Board
# Clock 
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clk];

# Input - Switches
set_property -dict { PACKAGE_PIN J15   IOSTANDARD LVCMOS33 } [get_ports { din_in[0] }];
set_property -dict { PACKAGE_PIN L16   IOSTANDARD LVCMOS33 } [get_ports { din_in[1] }];
set_property -dict { PACKAGE_PIN M13   IOSTANDARD LVCMOS33 } [get_ports { din_in[2] }];
set_property -dict { PACKAGE_PIN R15   IOSTANDARD LVCMOS33 } [get_ports { din_in[3] }]; 

set_property -dict { PACKAGE_PIN R17   IOSTANDARD LVCMOS33 } [get_ports { reset }];

set_property -dict { PACKAGE_PIN T18   IOSTANDARD LVCMOS33 } [get_ports { clk }];
 
set_property -dict { PACKAGE_PIN U18   IOSTANDARD LVCMOS33 } [get_ports { read_a_in[0] }]; 
set_property -dict { PACKAGE_PIN R13   IOSTANDARD LVCMOS33 } [get_ports { read_a_in[1] }]; 

set_property -dict { PACKAGE_PIN T8    IOSTANDARD LVCMOS33 } [get_ports { read_b_in[0] }];
set_property -dict { PACKAGE_PIN U8    IOSTANDARD LVCMOS33 } [get_ports { read_b_in[1] }];

set_property -dict { PACKAGE_PIN R16   IOSTANDARD LVCMOS33 } [get_ports { write }];

set_property -dict { PACKAGE_PIN T13   IOSTANDARD LVCMOS33 } [get_ports { write_address_in[0] }];
set_property -dict { PACKAGE_PIN H6    IOSTANDARD LVCMOS33 } [get_ports { write_address_in[1] }];

# Output - LEDs
set_property -dict { PACKAGE_PIN H17   IOSTANDARD LVCMOS33 } [get_ports { out_a_out[0] }];
set_property -dict { PACKAGE_PIN K15   IOSTANDARD LVCMOS33 } [get_ports { out_a_out[1] }];
set_property -dict { PACKAGE_PIN J13   IOSTANDARD LVCMOS33 } [get_ports { out_a_out[2] }];
set_property -dict { PACKAGE_PIN N14   IOSTANDARD LVCMOS33 } [get_ports { out_a_out[3] }];

set_property -dict { PACKAGE_PIN R18   IOSTANDARD LVCMOS33 } [get_ports { out_b_out[0] }];
set_property -dict { PACKAGE_PIN V17   IOSTANDARD LVCMOS33 } [get_ports { out_b_out[1] }];
set_property -dict { PACKAGE_PIN U17   IOSTANDARD LVCMOS33 } [get_ports { out_b_out[2] }];
set_property -dict { PACKAGE_PIN U16   IOSTANDARD LVCMOS33 } [get_ports { out_b_out[3] }];

