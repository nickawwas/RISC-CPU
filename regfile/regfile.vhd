-- Nicholas Kawwas (40124338)
-- COEN 316 DM-X Lab 2
-- Design and Implement a Register File

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity regfile is 
	port (  reset, clk, write: in std_logic;
		read_a, read_b, write_address : in std_logic_vector(4 downto 0);
		din : in std_logic_vector(31 downto 0);
		out_a, out_b : out std_logic_vector(31 downto 0)
     	);
end regfile;


architecture regfile_arch of regfile is
	-- Define Constant to Make Code Expandable
	constant NUM_REG : integer := 32;
	
	-- Define Register File (32 32-Bit Registers)
	type reg_arr is array (0 to (NUM_REG - 1)) of std_logic_vector(31 downto 0);
	signal regs : reg_arr;

	begin
	
	sync_write: process(clk, reset)
	begin
		-- Asynchronous Rest
		if reset = '1' then
			-- Loop Through and Reset Each Register
			for i in 0 to (NUM_REG - 1) loop
				regs(i) <= (others => '0');
			end loop; 
		-- Synchronous Write
		elsif rising_edge(clk) then
			-- Write at Rising Edge of Clock to Specified Write Address
			if write = '1' then
				regs(to_integer(unsigned(write_address))) <= din;
			end if;
		end if;
	end process;

	async_read: process(regs, read_a, read_b)
	begin 
		-- Asynchronous Read
		out_a <= regs(to_integer(unsigned(read_a)));
		out_b <= regs(to_integer(unsigned(read_b)));
	end process;
end regfile_arch;
