-- Nicholas Kawwas (40124338)
-- COEN 316 DM-X Lab 4
-- Design and Implement the Datapath 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity datapath is 
	port (  clk, reset, reg_dst, reg_in_src, reg_write, alu_src, add_sub, data_write : in std_logic;
        	branch_type, pc_sel, logic_func, func : in std_logic_vector(1 downto 0);
     		overflow, zero : out std_logic 
		);
end datapath;

architecture datapath_arch of datapath is
	-- Declare Next Address Module and Configure to Specific Entity
	component next_address_module
		port (  rt, rs, pc : in std_logic_vector(31 downto 0);
			target_address : in std_logic_vector(25 downto 0);
                	branch_type, pc_sel : in std_logic_vector(1 downto 0);
			next_pc : out std_logic_vector(31 downto 0)
     		);	
	end component;

	for next_address : next_address_module use entity WORK.next_address(next_address_arch);

	-- Declare Program Counter Module and Configure to Specific Entity
	component pc_module
        	port (  pc_in : in std_logic_vector(31 downto 0);
					clk, reset : in std_logic;
               		pc_out : out std_logic_vector(31 downto 0)
       		 );
	end component;	
	
	for pc : pc_module use entity WORK.pc(pc_arch);
	
	-- Declare Instruction Cache Module and Configure to Specific Entity
	component i_cache_module
       		 port ( addr : in std_logic_vector(4 downto 0);
                	instr : out std_logic_vector(31 downto 0)
       		 );
	end component;

	for i_cache : i_cache_module use entity WORK.i_cache(i_cache_arch);

	-- Declare Register File Module and Configure to Specific Entity
	component regfile_module
	port (  reset, clk, write: in std_logic;
			read_a, read_b, write_address : in std_logic_vector(4 downto 0);
			din : in std_logic_vector(31 downto 0);
			out_a, out_b : out std_logic_vector(31 downto 0)
     	);
	end component;

	for regfile : regfile_module use entity WORK.regfile(regfile_arch);
	
	-- Declare Sign Extend Module and Configure to Specific Entity
	component sign_extend_module
        port (  immediate_in : in std_logic_vector(15 downto 0);
                func : in std_logic_vector(1 downto 0);
                full_out : out std_logic_vector(31 downto 0)
        );
	end component;

	for sign_extend : sign_extend_module use entity WORK.sign_extend(sign_extend_arch);

	-- Declare Arithmetic Logic Unit Module and Configure to Specific Entity
	component alu_module
	port (  add_sub: in std_logic;
			func, logic_func: in std_logic_vector(1 downto 0);
			x, y : in std_logic_vector(31 downto 0);
        	zero, overflow : out std_logic;
        	output : out std_logic_vector(31 downto 0)
     	);
	end component;

	for alu : alu_module use entity WORK.alu(alu_arch);

	-- Declare Data Cache Module and Configure to Specific Entity
	component d_cache_module
        port (  din : in std_logic_vector(31 downto 0);
				clk, reset, data_write : in std_logic;
				addr : in std_logic_vector(4 downto 0);
				dout : out std_logic_vector(31 downto 0)
			);
	end component;
	
	for d_cache : d_cache_module use entity WORK.d_cache(d_cache_arch);

	-- Signals for Datapath
	signal reg_out_a, reg_out_b, pc_out, ic_out, next_out, sign_out, d_in, y_in, alu_out, dc_out : std_logic_vector(31 downto 0) := (others => '0');
	signal add : std_logic_vector(4 downto 0);

	begin

	-- Next Address Port Mapped
	-- Regfile Output a (Rs Contents) is Source Register Contents
	-- Regfile Output b (Rt Contents) is Second Source Register Contents
	-- Instruction Cache (Bits 0-25) is the Target Address for J Instructions
	next_address : next_address_module port map(rs => reg_out_a, rt => reg_out_b, pc => pc_out, target_address => ic_out(25 downto 0), branch_type => branch_type, pc_sel => pc_sel, next_pc => next_out);
	
	-- Program Counter Port Mapped
	-- Next Address Output is PC Input
	pc : pc_module port map(pc_in => next_out, clk => clk, reset => reset, pc_out => pc_out);

	-- Instruction Cache Port Mapped
	-- PC Ouput (Bits 0-4) is Address Input for Instruction Cache Memory (ROM)
	i_cache : i_cache_module port map(addr => pc_out(4 downto 0), instr => ic_out);

	-- Set Write Address Destination Register to Either Rt (Bits 16-20) or Rd (Bits 11-15)
	add <= ic_out(15 downto 11) when reg_dst = '1' else ic_out(20 downto 16);

	-- Register File Port Mapped
	-- Instruction Cache Output (Bits 21 to 25), Rs Address, is Read Address A
	-- Instruction Cache Output (Bits 16-20), Rt Address, is Read Address B
	-- Add is Write Address from the MUX between Rd and Rt
	-- Din is Data In from MUX between Data Cache Output and ALU Output
	regfile : regfile_module port map(reset => reset, clk => clk, write => reg_write, read_a => ic_out(25 downto 21), read_b => ic_out(20 downto 16), write_address => add, din => d_in, out_a => reg_out_a, out_b => reg_out_b);

	-- Sign Extend Port Mapped
	-- Instruction Cache (Bits 0-15) is the Immediate Data Input
	-- Sign Out is the Extended Immediate Data Output
 	sign_extend : sign_extend_module port map(immediate_in => ic_out(15 downto 0), func => func, full_out => sign_out);

	-- Set Input Y as Regfile out_b, rt contents (0) or Sign Extended sign_out, immediate data (1)
	y_in <= sign_out when alu_src = '1' else reg_out_b;

	-- Arithmetic Logic Unit Port Mapped
	-- Regfile Output a (Rs Contents) is used as X
	-- Either Sign Extend Output (Extended Immediate Data) or Regfile Output b (Rt Contents) is used as Y
	alu : alu_module port map(add_sub => add_sub, func => func, logic_func => logic_func, x => reg_out_a, y => y_in, zero => zero, overflow => overflow, output => alu_out);

	-- Data Cache Port Mapped
	-- Regfile Output b (Rt Contents) is used as Data In
	-- ALU Output (Bits 0-4) is used as Address
	d_cache : d_cache_module port map(din => reg_out_b, clk => clk, reset => reset, data_write => data_write, addr => alu_out(4 downto 0), dout => dc_out); 

	-- Write Back to Regfile with ALU output (1) or D Cache dout (0)
	d_in <= dc_out when reg_in_src = '0' else alu_out;
end datapath_arch;

