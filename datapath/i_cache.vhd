-- Nicholas Kawwas (40124338)
-- COEN 316 DM-X Lab 4
-- Design and Implement a Instruction Cache

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity i_cache is
        port (  addr : in std_logic_vector(4 downto 0);
                instr : out std_logic_vector(31 downto 0)
        );
end i_cache;

architecture i_cache_arch of i_cache is
	begin
	
	process(addr)
	begin
		case(addr) is
			when "00000" => 
				-- Addr = 00000 for Addi r1, r0, 1
				instr <= "00100000000000010000000000000001";
			when "00001" => 
				-- Addr = 00001 for Addi r2, r0, 2
				instr <= "00100000000000100000000000000010";
			when "00010" => 
				-- Addr = 00010 for Addi r2, r2, r1
				instr <= "00000000010000010001000000100000";
			when "00011" => 
				-- Addr = 00011 for Jump 00010
				instr <= "00001000000000000000000000000010";
			when others => 
				-- Addr = 00100 for Dont Care
				instr <= "00000000000000000000000000000000";
		end case;
	end process;
end i_cache_arch;
