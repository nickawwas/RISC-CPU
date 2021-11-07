-- Nicholas Kawwas (40124338)
-- COEN 316 DM-X Lab 1
-- Board Wrap & Port Map ALU for Nexys FPGA

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_signed.all;

entity alu_board is 
	port (  add_sub: in std_logic;
		func, logic_func: in std_logic_vector(1 downto 0);
		x_in, y_in : in std_logic_vector(3 downto 0);
        	zero, overflow : out std_logic;
        	output_out : out std_logic_vector(3 downto 0)
     	);
end alu_board;

architecture alu_board_arch of alu_board is
	-- Define Signals
	signal x, y, output: std_logic_vector(31 downto 0);

	-- Declare ALU Module Component
	component alu_module
        port (  add_sub: in std_logic;
                func, logic_func: in std_logic_vector(1 downto 0);
                x, y : in std_logic_vector(31 downto 0);
                zero, overflow : out std_logic;
                output : out std_logic_vector(31 downto 0)
        );
	end component;

	-- Declare Configuration to Specific Entity	
	for alu: alu_module use entity WORK.alu(alu_arch);

	begin

	-- Board Wrapper: FPGA Doesn't Contain Enough 
	x(3 downto 0) <= x_in(3) & x_in(2) & x_in(1) & x_in(0);
	y(3 downto 0) <= y_in(3) & y_in(2) & y_in(1) & y_in(0);
	x(31 downto 4) <= (others => '0');
	y(31 downto 4) <= (others => '0');

	-- Map Ports to Values
	alu: alu_module port map (add_sub => add_sub, func => func, logic_func => logic_func, x => x, y => y, zero => zero, overflow => overflow, output => output);

	output_out(3 downto 0) <= output(3 downto 0);
end alu_board_arch;
