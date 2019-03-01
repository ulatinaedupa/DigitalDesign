--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
--Date        : Fri Jan 18 15:30:02 2019
--Host        : DESKTOP-KNE27AI running 64-bit major release  (build 9200)
--Command     : generate_target Button_LED_wrapper.bd
--Design      : Button_LED_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Button_LED_wrapper is
end Button_LED_wrapper;

architecture STRUCTURE of Button_LED_wrapper is
  component Button_LED is
  end component Button_LED;
begin
Button_LED_i: component Button_LED
 ;
end STRUCTURE;
