library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ShiftRegisterTestBench is
end ShiftRegisterTestBench;

architecture test of ShiftRegisterTestBench is

component ShiftRegister
Port ( 
    Qa  : out std_logic;
    Qb  : out std_logic;
    Qc  : out std_logic;
    Qd  : out std_logic;
    Din : in std_logic;
    Rst : in std_logic;
    clk : in std_logic);
end component;

signal Qa, Qb, Qc, Qd : std_logic;
signal Din : std_logic := '0';
signal Rst : std_logic := '0';
signal clk : std_logic := '1';

begin

    UUT: ShiftRegister
        port map(Qa, Qb, Qc, Qd,  Din, Rst, clk);
        
    TBCLK: process
    begin
        wait for 10 ns;
        clk <= not clk;
    end process TBCLK;

    TBDATA:  process
    begin
        wait for 40 ns;
        Din <= not Din;
        wait for 150 ns;
    end process TBDATA;

end test;
