-- Nicholas Kawwas (40124338)
-- COEN 316 DM-X Lab 4
-- Design and Implement a Program Counter

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity pc is
        port (  pc_in : in std_logic_vector(31 downto 0);
				clk, reset : in std_logic;
                pc_out : out std_logic_vector(31 downto 0)
        );
end pc;

architecture pc_arch of pc is
	begin
	
	process(clk, reset)
	begin
		-- Asynchronous Reset
		if reset = '1' then 
			pc_out <= (others => '0');
		-- Synchronous Write
		elsif rising_edge(clk) then
			pc_out <= pc_in;
		end if;
	end process;
end pc_arch;
