-- Nicholas Kawwas (40124338)
-- COEN 316 DM-X Lab 4
-- Design and Implement a Sign Extend

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_signed.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity sign_extend is
        port (  immediate_in : in std_logic_vector(15 downto 0);
                func : in std_logic_vector(1 downto 0);
                full_out : out std_logic_vector(31 downto 0)
        );
end sign_extend;

architecture sign_extend_arch of sign_extend is
	begin
	
	process(immediate_in, func)
	begin
		case(func) is
			when "00" => 
				-- Func = 00 for Load Upper Immediate (Pad Lower with 0s)	
				full_out(15 downto 0) <= (others => '0');
				full_out(31 downto 16) <= immediate_in;
			when "11" => 
				-- Func = 11 for Logical Instructions (Pad Upper with 0s)
				full_out <= std_logic_vector(resize(unsigned(immediate_in), 32));
			when others =>
				-- Func = 01 for Set Less immediate (Sign Extend with MSB)
				-- Func = 10 for Arithmetic Instructions (Sign Extend with MSB)
				full_out <= std_logic_vector(resize(signed(immediate_in), 32));
		end case;
	end process;
end sign_extend_arch;
