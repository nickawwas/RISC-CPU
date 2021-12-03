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
				-- addi r3, r0, 0
				instr <= "00100000000000110000000000000000";
			when "00001" => 
				-- addi r1, r0, 0   
				instr <= "00100000000000010000000000000000";
			when "00010" => 
				-- addi r2,r0,5
				instr <= "00100000000000100000000000000101"; 
			when "00011" =>
				-- loop add r1,r1,r2
				instr <= "00000000001000100000100000100000";
			when "00100" =>
				-- addi r2, r2, -1
				instr <= "00100000010000101111111111111111";
			when "00101" =>
				-- beq r2,r3 (+1) THERE
				instr <= "00010000010000110000000000000001";
			when "00110" => 
				-- jump 3  (LOOP)
				instr <= "00001000000000000000000000000011";
			when "00111" =>
				 -- there sw r1, 0(r0)
				instr <= "10101100000000010000000000000000";
			when "01000" =>
				-- lw r4, 0(r0)
				instr <= "10001100000001000000000000000000";
			when "01001" =>
				-- andi r4,r4, 0x000A 
				instr <= "00110000100001000000000000001010";
			when "01010" =>
				 -- ori r4,r4, 0x0001
				instr <= "00110100100001000000000000000001";
			when "01011" =>
				-- xori r4,r4, 0xB
				instr <= "00111000100001000000000000001011";
			when "01100" =>
				-- xori r4,r4, 0x0000
				instr <= "00111000100001000000000000000000";
			when others => 
				-- Dont Care
				instr <= "00000000000000000000000000000000";
		end case;
	end process;
end i_cache_arch;
