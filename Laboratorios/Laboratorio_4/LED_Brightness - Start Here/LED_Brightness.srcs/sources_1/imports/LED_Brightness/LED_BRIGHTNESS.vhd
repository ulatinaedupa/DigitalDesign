-------------------------------------------------------------------------------
-- COMPANY: 	 NONE
--
-- ENGINEER:	 NONE
--
-- MODULE NAME:  LED_BRIGHTNESS
--
-- DESCRIPTION:  This design uses a COUNTER to change the duty cycle of a PWM
--				 signal. These PWM signals are used to change the brightness
-- 				 of the LED. The higher the duty cycle the brighter the LED
--				 becomes. A signal with 100% duty cycle would make the LED the
--				 brightest possible, this is the same as driving the line high.
--
-- REVISION:	 1.0 - 11/20/2017 File Created.
--
-- COMMENTS:	 If there are 0 RGB LED's there are two options:
--					1) Put 0 for the 'NUM_RGB_LEDS' generic
--					2) Leave the 'RGB_R_Out', 'RGB_G_Out', 
--					   and 'RGB_B_Out' signals disconnected
---
-- 				 This will cause the RGB LED outputs to be removed when the 
--				 design is synthesized.
--
--				 The RGB LED's require 3 outputs, for the Red (R), Green (G), 
--				 and Blue(B).
--
--				 RGB_R_Out(1), RGB_G_Out(1), RGB_B_Out(1) all correspond to
--				 the same LED.
--
--				 Changing the LED_MAX_COUNT and RGB_MAX_COUNT determine how
--				 long it takes the LED's to reach maximum brightness.
-------------------------------------------------------------------------------

-- Libraries
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
use IEEE.math_real.ALL;

-- Entity
entity LED_BRIGHTNESS is
	Generic (
		INPUT_CLK		: integer := 100000000; -- 50 MHz default
		NUM_RGB_LEDS	: integer := 4;
		NUM_LEDS 		: integer := 4);		
	Port (
		Led_Out			: out std_logic_vector(NUM_LEDS - 1 downto 0);
		RGB_R_Out		: out std_logic_vector(NUM_RGB_LEDS - 1 downto 0);
		RGB_G_Out		: out std_logic_vector(NUM_RGB_LEDS - 1 downto 0);
		RGB_B_Out		: out std_logic_vector(NUM_RGB_LEDS - 1 downto 0);
		Clk				: in std_logic;
		LED_Enable		: in std_logic;
		RGB_Enable		: in std_logic);	-- Active Low
end LED_BRIGHTNESS;

-- Architecture
architecture behavior of LED_BRIGHTNESS is

-- Components
-- Pulse Width Modulation Design
component PWM
	Generic (
		BIT_DEPTH	: integer := 8;
		INPUT_CLK	: integer := 50000000; -- 50MHz
		FREQ		: integer := 50); -- 50Hz
	Port (
		Pwm_Out 	: out std_logic;
		Duty_Cycle	: in std_logic_vector(BIT_DEPTH - 1 downto 0);
		Clk			: in std_logic;
		Enable		: in std_logic);
end component PWM;

-- COUNTER
component COUNTER
	Generic (
		MAX_VAL 		: integer := 2**30;
		SYNCH_Reset		: boolean := true);
	Port (
		Max_Count 		: out std_logic;
		Clk 			: in std_logic;
		Reset 			: in std_logic);
end component COUNTER;

-- Signals and Constants
-- 85 is from taking 255, the max PWM value, and dividing by 3 seconds
constant LED_MAX_COUNT	: integer := INPUT_CLK / 85;
constant RGB_MAX_COUNT	: integer := INPUT_CLK / 1365;
constant SYN_RESET		: boolean := true;
constant MAX_LED_DUTY	: integer := 255;
constant MAX_RGB_DUTY	: integer := 4095;

signal led_max_cnt		: std_logic := '0';
signal rgb_max_cnt		: std_logic := '0';
signal led_pwm_reg		: std_logic := '0';
signal red_pwm_reg		: std_logic := '0';
signal grn_pwm_reg		: std_logic := '0';
signal blu_pwm_reg		: std_logic := '0';

signal rgb_counter_rst	: std_logic := '0';
signal led_counter_rst	: std_logic := '0';

signal led_duty_cycle	: unsigned(7 downto 0) := (others => '0');
signal rgb_duty_cycle	: unsigned(11 downto 0) := (others => '0');

begin
	-- Assign Outputs
	Led_Out <= (others => led_pwm_reg);
	RGB_R_Out <= (others => red_pwm_reg);
	RGB_G_Out <= (others => grn_pwm_reg);
	RGB_B_Out <= (others => blu_pwm_reg);
	
	-- Invert enable signal for counter
	rgb_counter_rst <= not RGB_Enable;
	led_counter_rst <= not LED_Enable;

	-- LED Counter
	LED_COUNTER: COUNTER 
		generic map(LED_MAX_COUNT, SYN_RESET) 
		port map(Max_Count => led_max_cnt, Clk => Clk, Reset => led_counter_rst);
	
	-- RGB Counter


		
	-- LED PWM Signal Generator (8 bit, 50Hz)
	LED_PWM: PWM
		generic map(8, INPUT_CLK, 50)
		port map(led_pwm_reg, std_logic_vector(led_duty_cycle), Clk, LED_Enable);
		
	-- RGB LED PWM Signal Generator [RED] (4 bit, 50Hz)
	RGB_RED_PWM: PWM
		generic map(4, INPUT_CLK, 50)
		port map(red_pwm_reg, std_logic_vector(rgb_duty_cycle(3 downto 0)), Clk, RGB_Enable);
	
	-- RGB LED PWM Signal Generator [GREEN] (4 bit, 50Hz)



	-- RGB LED PWM Signal Generator [BLUE] (4 bit, 50Hz)
	RGB_BLU_PWM: PWM
		generic map(4, INPUT_CLK, 50)
		port map(blu_pwm_reg, std_logic_vector(rgb_duty_cycle(11 downto 8)), Clk, RGB_Enable);
	
	-- LED PWM Count update Process
	Led_Count_Proc: process(Clk)
	begin
		if rising_edge(Clk) then
			if (led_duty_cycle = MAX_LED_DUTY) then
				led_duty_cycle <= (others => '0');
			elsif (led_max_cnt = '1') then
				led_duty_cycle <= led_duty_cycle + 1;
			end if;
		end if;
	end process Led_Count_Proc;
	
	-- RGB PWM Count Update Process
	Rgb_Count_Proc: process(Clk)
	begin
		if rising_edge(Clk) then
			if (rgb_duty_cycle = MAX_RGB_DUTY) then
				rgb_duty_cycle <= (others => '0');
			elsif (rgb_max_cnt = '1') then
				rgb_duty_cycle <= rgb_duty_cycle + 1;
			end if;
		end if;
	end process Rgb_Count_Proc;
	
end behavior;