-------------------------------------------------------------------------------
-- COMPANY: 	 NONE
--
-- ENGINEER:	 Rangel Alvarado
--
-- MODULE NAME:  Blink_LED
--
-- DESCRIPTION:  Usa un contador que hara encender los LEDs on / off a intervalos
--				 regulares. La rata de cambio es intercambiable a traves del tipo
--				 generico en el diseño (BLINK_RATE). Existe una senal de reset 
--               activo bajo que en cuanto sea asertada causara que la cuenta se
--               reinicie y apague los LEDs
--
-- REVISION:	 1.0 - 01/20/19 File Created.
--
-- COMMENTS:	 Todos los LEDs se deben de encender simultaneamente. Si desea 
--               cambiar esto, debe dar un valor inicial en la senal (led_reg)
--				 el cual actuara bajo la logina VHDL descrita.
-------------------------------------------------------------------------------

-- Librarias
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.math_real.all;
use IEEE.numeric_std.all;

-- Entidad
entity BLINKY_LED is
	Generic (
		NUM_LEDS	: integer := 4;	        -- 4 LEDs por defecto Arty A7
		CLK_RATE	: integer := 100000000; -- 100 MHz por defecto Arty A7
		BLINK_RATE 	: integer := 4);		-- 2 Hz por defecto (modificable)
	Port (
		Led_Out     : out std_logic_vector(NUM_LEDS - 1 downto 0);
		Clk			: in std_logic;
		Reset		: in std_logic);        -- Activo bajo
end BLINKY_LED;

-- Arquitectura
architecture behavior of BLINKY_LED is

-- Calcula el maximo valor a alcancar MAX_VAL, dependiente de BLINK_RATE


-- Calcula el numero de bits requeridos a contar MAX_VAL


-- Registro que contiene el actual valor de cuenta


-- Registro que contiene el valor de salidas

	
	begin
		-- Asigna el valor a la salida

	
		-- Proceso que incrementa el valor del contador cada ciclo de reloj

		-- Proceso que conmutara la salida del led cada tiempo de conteo
		-- y que alcance su valor maximo calculado (MAX_VAL)

end behavior;