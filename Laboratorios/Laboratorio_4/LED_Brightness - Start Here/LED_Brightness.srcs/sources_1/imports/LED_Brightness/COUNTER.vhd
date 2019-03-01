-------------------------------------------------------------------------------
-- COMPANY: 	 NONE
--
-- ENGINEER:	 NONE
--
-- MODULE NAME:  COUNTER
--
-- DESCRIPTION:  Up counter with either a synchronous reset or asynchronous 
--				 reset.
--
-- REVISION:	 1.0 - 11/25/2017 File Created.
--
-- COMMENTS:	 
-------------------------------------------------------------------------------

-- Libraries
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.math_real.all;
use IEEE.numeric_std.all;

entity COUNTER is
	Generic (
		MAX_VAL 		: integer := 2**30;
		SYNCH_Reset		: boolean := true);
	Port (
		Max_Count 		: out std_logic;
		Clk 			: in std_logic;
		Reset 			: in std_logic);
end COUNTER;

architecture behavior of COUNTER is

	constant bit_depth	: integer := integer(ceil(log2(real(MAX_VAL))));
	signal Count_reg	: unsigned(bit_depth - 1 downto 0) := (others => '0');
	
	begin
	
	synch_rst : if SYNCH_Reset = true generate
		Count_proc: process(Clk)
		begin
			if rising_edge(Clk) then
				if((Reset = '0') or (Count_reg = MAX_VAL)) then
					Count_reg <= (others => '0');
				else
					Count_reg <= Count_reg + 1;
				end if;
			end if;
		end process;
	end generate;
	
	asynch_rst : if SYNCH_Reset = false generate
		Count_proc: process(Clk, Reset)
		begin
			if(Reset = '0') then
				Count_reg <= (others => '0');
			elsif rising_edge(Clk) then
				if(Count_reg = MAX_VAL) then
					Count_reg <= (others => '0');
				else
					Count_reg <= Count_reg + 1;
				end if;
			end if;
		end process;
	end generate;
	
	output_proc: process(Count_reg)
		begin
		Max_Count <= '0';
		if(Count_reg = MAX_VAL) then
			Max_Count <= '1';
		end if;
	end process;
end behavior;