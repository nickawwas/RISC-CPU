-- Nicholas Kawwas (40124338)
-- COEN 316 DM-X Lab 5
-- Design and Implement a Control Unit

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity control_unit is
	port (  op_code, func_field : in std_logic_vector(5 downto 0);
			reg_dst, reg_in_src, reg_write, alu_src, add_sub, data_write : out std_logic;
			branch_type, pc_sel, logic_func, func : out std_logic_vector(1 downto 0)
        );
end control_unit;

architecture control_unit_arch of control_unit is
	begin
	
	set_control_bits : process(op_code, func_field)
	variable control_bits : std_logic_vector(13 downto 0);
	begin
		case(op_code) is
			when "000000" => 
				case(func_field) is
					when "100000" => 
						-- Add
						control_bits := "11100000100000";
					when "100010" =>
						-- Sub
						control_bits := "11101000100000";
					when "101010" =>
						-- Slt
						control_bits := "11100000010000";
					when "100100" =>
						-- And
						control_bits := "11101000110000";
					when "100101" =>
						-- Or
						control_bits := "11100001110000";
					when "100110" =>
						-- Xor
						control_bits := "11100010110000";
					when "100111" =>
						-- Nor
						control_bits := "11100011110000";
					when "001000" =>
						-- Jr
						control_bits := "00000000000010";
					when others =>
						-- Invalid Op 
						control_bits := "00000000000000";
				end case;
			when "000001" =>
				-- Bltz
				control_bits := "00000000001100";
			when "000010" =>
				-- J
				control_bits := "00000000000001";
			when "000100" => 
				-- Beq
				control_bits := "00000000000100";
			when "000101" =>
				-- Bne
				control_bits := "00000000001000";
			when "001000" =>
				-- Addi
				control_bits := "10110000100000";
			when "001010" =>
				-- Slti
				control_bits := "10110000010000";
			when "001100" =>
				-- Andi
				control_bits := "10110000110000";
			when "001101" =>
				-- ori
				control_bits := "10110001110000";
			when "001110" =>
				-- xori
				control_bits := "10110010110000";
			when "001111" =>
				-- lui
				control_bits := "10110000000000";
			when "100011" =>
				-- lw
				control_bits := "10010010100000";
			when "101011" =>
				-- sw
				control_bits := "00010100100000";
			when others => 
				-- Invalid Op 
				control_bits := "00000000000000";
		end case;

		-- Use Control Bits to Assign Values to Control Bits
		reg_write <= control_bits(13);
		reg_dst <= control_bits(12);
		reg_in_src <= control_bits(11);
		alu_src <= control_bits(10);
		add_sub <= control_bits(9);
		data_write <= control_bits(8);
		logic_func <= control_bits(7 downto 6);
		func <= control_bits(5 downto 4);
		branch_type <= control_bits(3 downto 2);
		pc_sel <= control_bits(1 downto 0);
	end process;
end control_unit_arch;
