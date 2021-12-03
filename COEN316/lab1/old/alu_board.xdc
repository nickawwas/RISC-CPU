# Nicholas Kawwas (40124338)
# COEN 316 LAB DM-X 

# Map VHDL Synthesis to Nexys Board
set_property IOSTANDARD LVCMOS33 [ get_ports { x[0] } ];
set_property IOSTANDARD LVCMOS33 [ get_ports { x[1] } ];
set_property IOSTANDARD LVCMOS33 [ get_ports { x[2] } ];
set_property IOSTANDARD LVCMOS33 [ get_ports { x[3] } ];

set_property IOSTANDARD LVCMOS33 [ get_ports { y[0] } ];
set_property IOSTANDARD LVCMOS33 [ get_ports { y[1] } ];
set_property IOSTANDARD LVCMOS33 [ get_ports { y[2] } ];
set_property IOSTANDARD LVCMOS33 [ get_ports { y[3] } ];

set_property IOSTANDARD LVCMOS33 [ get_ports { add_sub } ];

set_property IOSTANDARD LVCMOS33 [ get_ports { logic_func[0] } ];
set_property IOSTANDARD LVCMOS33 [ get_ports { logic_func[1] } ];

set_property IOSTANDARD LVCMOS33 [ get_ports { func[0] } ];
set_property IOSTANDARD LVCMOS33 [ get_ports { func[1] } ];

set_property IOSTANDARD LVCMOS33 [ get_ports { output[0] } ];
set_property IOSTANDARD LVCMOS33 [ get_ports { output[1] } ];
set_property IOSTANDARD LVCMOS33 [ get_ports { output[2] } ];
set_property IOSTANDARD LVCMOS33 [ get_ports { output[3] } ];

set_property IOSTANDARD LVCMOS33 [ get_ports { overflow } ];

set_property IOSTANDARD LVCMOS33 [ get_ports { zero } ];
