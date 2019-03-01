----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/13/2019 02:29:30 PM
-- Design Name: 
-- Module Name: Button_LED - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Button_LED is
  Generic (
      NUM_BUTTONS : INTEGER := 4
  ); 
  Port ( 
      LED_Out   : Out std_logic_vector(NUM_BUTTONS - 1 downto 0);
      Button_In : In  std_logic_vector(NUM_BUTTONS - 1 downto 0);
      Enable    : In  std_logic
  );
end Button_LED;

architecture Behavioral of Button_LED is

begin
    -- set the outputs of LEDs
    LED_Out <= Button_In when Enable = '0' else (others => '0');
end Behavioral;
