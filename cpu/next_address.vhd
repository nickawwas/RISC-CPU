-- Nicholas Kawwas (40124338)
-- COEN 316 DM-X Lab 3
-- Design and Implement a Next Address

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity next_address is 
	port (  rt, rs, pc : in std_logic_vector(31 downto 0);
		target_address : in std_logic_vector(25 downto 0);
                branch_type, pc_sel : in std_logic_vector(1 downto 0);
		next_pc : out std_logic_vector(31 downto 0)
     	);
end next_address;

architecture next_address_arch of next_address is
    begin
	
	-- Calculate Next Address 
        next_addr: process(rs, rt, pc, pc_sel, branch_type, target_address)
        begin
            case pc_sel is 
                when "01" =>
                    -- Jump to Extended Target Address
                    next_pc <= std_logic_vector(resize(unsigned(target_address), 32));	
                when "10" =>
                    -- Jump Register - Jump to Specified Register, Rs
                    next_pc <= rs;
                when "00" => 
	            -- No Unconditional Jump for 00 (Straightline Instructions and Conditional Branches) 
	            case branch_type is
        	        when "00" =>
                		-- No Branch
                   		next_pc <= pc + 1;
                	when "01" =>
                   	 	-- Branch Equal (Beq)
                   	 	-- Add Branch Offset if Rs and Rt Are Equal (ie Branch Condition Satisfied)
                    		if rs = rt then
                       		 	next_pc <= pc + 1 + std_logic_vector(resize(signed(target_address(15 downto 0)), 32));
                    		else
                        		-- Branch Condition Not Satisifed
                        		next_pc <= pc + 1;
                    		end if;
                	when "10" =>
                    		-- Branch Not Equal (Bne)
                    		-- Add Branch Offset if Rs and Rt Are Not Equal (ie Branch Condition Satisfied)
                    		if rs /= rt then
                        		next_pc <= pc + 1 + std_logic_vector(resize(signed(target_address(15 downto 0)), 32));
                    		else
                        		-- Branch Condition Not Satisifed
                        		next_pc <= pc + 1;
                    		end if;
                	when others => 
                    		-- Branch Less Than Zero (Bltz)
                    		-- Add Branch Off if Rs is Less than 0 (ie Branch Condition Satisfied)
                    		if signed(rs) < 0 then
                        		next_pc <= pc + 1 + std_logic_vector(resize(signed(target_address(15 downto 0)), 32));
                    		else
                        		-- Branch Condition Not Satisifed
                       	 		next_pc <= pc + 1;
                    		end if;
            	end case;
				when others => 
					-- Not Used For 11 - Simply Increments Pc By 1 		    
					next_pc <= pc + 1;
	    end case;
        end process;
end next_address_arch;

