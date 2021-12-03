-- Nicholas Kawwas (40124338)
-- COEN 316 DM-X Lab 5
-- Board Wrapper for CPU

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity cpu_board is 
	port (  clk, reset: in std_logic;
			rt_out, rs_out, pc_out : out std_logic_vector(3 downto 0);
			overflow, zero : out std_logic
     	);
end cpu_board;

architecture cpu_board_arch of cpu_board is
	-- Declare CPU  Module Component
	component cpu_module
		port (  clk, reset: in std_logic;
			rt_out, rs_out, pc_out : out std_logic_vector(31 downto 0);
			overflow, zero : out std_logic
     	);
	end component;

	-- Declare Configuration to Specific Entity	
	for cpu : cpu_module use entity WORK.cpu(cpu_arch);

	-- Signals
	signal rs, rt, pc : std_logic_vector(31 downto 0);
	
	begin
	
	-- Map Ports to Values
	cpu : cpu_module port map (clk => clk, reset => reset, rt_out => rt, rs_out => rs, pc_out => pc, overflow => overflow, zero => zero);

	-- Board Wrapper: FPGA Doesn't Contain Enough LEDs
	rt_out(3 downto 0) <= rt(3 downto 0); 
	rs_out(3 downto 0) <= rs(3 downto 0); 
	pc_out(3 downto 0) <= pc(3 downto 0);
end cpu_board_arch;
