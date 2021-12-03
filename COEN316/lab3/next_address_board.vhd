-- Nicholas Kawwas (40124338)
-- COEN 316 DM-X Lab 3
-- Board Wrapper for Next Address 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity next_address_board is 
	port (  rt_in, rs_in, pc_in : in std_logic_vector(1 downto 0);
		target_address_in : in std_logic_vector(2 downto 0);
                branch_type_in, pc_sel_in : in std_logic_vector(1 downto 0);
		next_pc_out : out std_logic_vector(2 downto 0)
     	);
end next_address_board;

architecture next_address_board_arch of next_address_board is
	-- Define Signals
        signal rt, rs, pc: std_logic_vector(31 downto 0);
	signal target_address: std_logic_vector(25 downto 0);
        signal branch_type, pc_sel: std_logic_vector(1 downto 0);
	signal next_pc : std_logic_vector(31 downto 0);

	-- Declare Regfile  Module Component
	component next_address
		port (  rt, rs, pc : in std_logic_vector(31 downto 0);
			target_address : in std_logic_vector(25 downto 0);
			branch_type, pc_sel : in std_logic_vector(1 downto 0);
			next_pc : out std_logic_vector(31 downto 0)
     		);
	end component;

	-- Declare Configuration to Specific Entity	
	for next_address_comp: next_address use entity WORK.next_address(next_address_arch);

	begin
        
	-- Board Wrapper: FPGA Doesn't Contain Enough Switches
	rt(1 downto 0) <= rt_in(1) & rt_in(0);
	rs(1 downto 0) <= rs_in(1) & rs_in(0);
	pc(1 downto 0) <= pc_in(1) & pc_in(0); 
	rt(31 downto 2) <= (others => '0');
	rs(31 downto 2) <= (others => '0');
	pc(31 downto 2) <= (others => '0');
	
	target_address(2 downto 0) <= target_address_in(2 downto 0);
        target_address(25 downto 3) <= (others => '0');
	
	-- Map Ports to Values
	next_address_comp : next_address port map (rt => rt, rs => rs, pc => pc, target_address => target_address, branch_type => branch_type_in, pc_sel => pc_sel_in, next_pc => next_pc);

	-- Board Wrapper: FPGA Doesn't Contain Enough LEDs
	next_pc_out(2 downto 0) <= next_pc(2 downto 0); 

end next_address_board_arch;
