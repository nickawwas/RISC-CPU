-- Nicholas Kawwas (40124338)
-- COEN 316 DM-X Lab 4
-- Design and Implement a Data Cache

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity d_cache is
        port (  din : in std_logic_vector(31 downto 0);
				clk, reset, data_write : in std_logic;
				addr : in std_logic_vector(4 downto 0);
				dout : out std_logic_vector(31 downto 0)
			);
end d_cache;

architecture d_cache_arch of d_cache is
	-- Define Data Cache (32 32-Bit Blocks)
	type arr is array(0 to 31) of std_logic_vector(31 downto 0);
	signal d_ram : arr;

	begin
	
	process(clk, reset)
	begin
		-- Asynchronous Reset
		if reset = '1' then 
			for i in 0 to 31 loop
				d_ram(i) <= (others => '0');
			end loop;
		-- Synchronous Write
		elsif rising_edge(clk) then
			if data_write = '1' then
				d_ram(to_integer(unsigned(addr))) <= din;
			end if;
		end if;
	end process;

	dout <= d_ram(to_integer(unsigned(addr)));
end d_cache_arch;
