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
				-- addi r2, r0, 1
				instr <= "00100000000000100000000000000001";
			when "00001" => 
				-- add r1, r0, r2   
				instr <= "00000000000000100000100000100000";
			when "00010" => 
				-- and r3, r0, r1
				instr <= "00000000000000010001100000100100"; 
			when "00011" =>
				-- loop add r2, r1, r2
				instr <= "00000000001000100001000000100000";
			when "00100" =>
				-- ori r3, r1, 0x0002
				instr <= "00110100001000110000000000000010";
			when "00101" =>
				-- beq r2, r3, 1 (break)
				instr <= "00010000011000100000000000000001";
			when "00110" => 
				-- jump 3  (Loop)
				instr <= "00001000000000000000000000000011";
			when "00111" =>
				 -- break sw r1, 0(r1)
				instr <= "10101100001000010000000000000000";
			when "01000" =>
				-- lw r2, 0(r1)
				instr <= "10001100001000100000000000000000";
			when others => 
				-- Dont Care
				instr <= "00000000000000000000000000000000";
		end case;
	end process;
end i_cache_arch;
