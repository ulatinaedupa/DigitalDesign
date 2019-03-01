----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/18/2019 12:07:09 AM
-- Design Name: 
-- Module Name: ShiftRegister - Behavioral
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
use IEEE.numeric_std.ALL;

-- Declare the Entity
entity ShiftRegister is
Port ( 
    Qa  : out std_logic;
    Qb  : out std_logic;
    Qc  : out std_logic;
    Qd  : out std_logic;
    Din : in std_logic;
    Rst : in std_logic;
    clk : in std_logic);
end ShiftRegister;

-- Define the Architecture
architecture Behavioral of ShiftRegister is

-- Define the signals
signal A, B, C, D : std_logic := '0';

begin
    Qa <= A;
    Qb <= B;
    Qc <= C;
    Qd <= D;

    shifting: process(clk)
    begin
        if (rising_edge(clk)) then
            if (Rst = '1') then
                A <= '0';
                B <= '0';
                C <= '0';
                D <= '0';
            else 
                A <= Din;
                B <= A;
                C <= B;
                D <= C;
            end if;
        end if;
    end process shifting;
end Behavioral;
