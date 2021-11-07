-- Nicholas Kawwas (40124338)
-- COEN 316 DM-X Lab 1
-- Board Wrap & Port Map Register File for Nexys FPGA

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_signed.all;

entity regfile_board is 
	port (  reset, clk, write: in std_logic;
		read_a_in, read_b_in, write_address_in : in std_logic_vector(1 downto 0);
		din_in : in std_logic_vector(3 downto 0);
		out_a_out, out_b_out : out std_logic_vector(3 downto 0)
     	);
end regfile_board;


architecture regfile_board_arch of regfile_board is
	-- Define Signals
        signal read_a, read_b, write_address: std_logic_vector(4 downto 0);
        signal din, out_a, out_b: std_logic_vector(31 downto 0);

	-- Declare Regfile  Module Component
	component regfile_module
		port (  reset, clk, write: in std_logic;
			read_a, read_b, write_address : in std_logic_vector(4 downto 0);
			din : in std_logic_vector(31 downto 0);
			out_a, out_b : out std_logic_vector(31 downto 0)
     		);
	end component;

	-- Declare Configuration to Specific Entity	
	for regfile : regfile_module use entity WORK.regfile(regfile_arch);

	begin
        
	-- Board Wrapper: FPGA Doesn't Contain Enough Switches
    read_a(1 downto 0) <= read_a_in(1) & read_a_in(0);
	read_b(1 downto 0) <= read_b_in(1) & read_b_in(0);
	write_address(1 downto 0) <= write_address_in(1) & write_address_in(0);	
	read_a(4 downto 2) <= (others => '0');
	read_b(4 downto 2) <= (others => '0');	
	write_address(4 downto 2) <= (others => '0');	
	din(3 downto 0) <= din_in(3) & din_in(2) & din_in(1) & din_in(0);
	din(31 downto 4) <= (others => '0');

	-- Map Ports to Values
	regfile : regfile_module port map (din => din, read_a => read_a, read_b => read_b, reset => reset, clk => clk, write => write, write_address => write_address, out_a => out_a, out_b => out_b);

	-- Board Wrapper: FPGA Doesn't Contain Enough LEDs
	out_a_out(3 downto 0) <= out_a(3 downto 0);
	out_b_out(3 downto 0) <= out_b(3 downto 0);
end regfile_board_arch;
