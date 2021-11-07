-- Nicholas Kawwas (40124338)
-- COEN 316 DM-X Lab 1
-- Design an ALU

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_signed.all;

entity alu is 
	port (  add_sub: in std_logic;
		func, logic_func: in std_logic_vector(1 downto 0);
		x, y : in std_logic_vector(31 downto 0);
        	zero, overflow : out std_logic;
        	output : out std_logic_vector(31 downto 0)
     	);
end alu;


architecture alu_arch of alu is
	-- Adder/Subtractor & Logic Signals
	signal add_sub_out, logic_out: std_logic_vector(31 downto 0);
	begin

	-- Adder/Subtractor Unit
	-- Add_Sub => Control Input to Perform Either Addition or Subtraction 
	process(x, y, add_sub)
		begin
		
		-- Add/Sub Output: + (0), - (1)	
		if add_sub = '0' then
			add_sub_out <= x + y;
		else
			add_sub_out <= x - y;
		end if; 
	end process;

	-- Logic Unit
	process(x, y, logic_func)
		begin

		-- Logic Output: And (00), Or (01), Xor (10), Nor (11) 
		if logic_func = "00" then
			logic_out <= x AND y;
		elsif logic_func = "01" then
			logic_out <= x OR y;
		elsif logic_func = "10" then
			logic_out <= x XOR y;
		else
			logic_out <= x NOR y;
		end if;
	end process;


	-- Multiplexer
	process(y, add_sub_out, logic_out, func)
		begin
		
		-- Output: y (00), Add/Sub Output (01), MSB Followed By 0s (10), Logic Output (11)
		if func = "00" then
			output <= y;
		elsif func = "01" then
			output <= (0 => add_sub_out(31), others => '0');
		elsif func = "10" then
            output <= add_sub_out;
		else
			output <= logic_out; 
		end if;
	end process;

	
	-- Zero
	process(add_sub_out)
		variable zero_word: std_logic_vector(31 downto 0);
		begin
		zero_word := (others => '0');

		-- Zero Output: 1 (32 Bit Zero), 0 (Non Zero Value)
		if add_sub_out = zero_word then
				zero <= '1';
		else
				zero <= '0';
		end if;
	end process;

	-- Overflow
	process(x, y, add_sub, add_sub_out)
		begin

		-- Addition Cases (0), Subtraction Cases (1)
		if(add_sub = '0') then
			-- Negative Add Output W/ Two Positive Inputs
			-- Positive Add Output W/ Two Negative Inputs 
			if(add_sub_out(31) /= x(31) and x(31) = y(31)) then
					overflow <= '1';
			else
					overflow <= '0';
			end if;
		else 
			-- Negative Sub Output W/ First Positive and Second Negative 
			-- Positive Sub Output W/ First Negative and Second Positive
			if(add_sub_out(31) /= x(31) and x(31) /= y(31)) then
				overflow <= '1';
			else 
				overflow <= '0';
			end if;
		end if;
	end process;
end alu_arch;