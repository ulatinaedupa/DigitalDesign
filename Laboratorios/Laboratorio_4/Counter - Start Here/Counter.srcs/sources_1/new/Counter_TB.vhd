-------------------------------------------------------------------------------
-- COMPANY: 	 NONE
--
-- ENGINEER:	 Rangel Alvarado
--
-- MODULE NAME:  COUNTER_TB
--
-- DESCRIPTION:  Archivo de test.  
--               Prueba la generacion de una señal de contador
--
-- REVISION:	 1.0 - 01/23/19 File Created.
--
-- COMMENTS:	 Se crea un archivo TB de simulación para ver el resultado.
-------------------------------------------------------------------------------

-- Definicion de librería
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.MATH_REAL.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Creamos una entidad de prueba
entity Counter_TB is
end Counter_TB;

-- Inicio de la arquitectura del test bench
architecture testbench of Counter_TB is


-- Definimos el componente
component Counter is
    Generic (
             MAX_VAL     : integer := 2**4;  -- valor maximo de conteo
             SYNC_Reset  : boolean := true    -- Si vamos a realizar conteo...
                                              -- sincrono o asincrono
            );
    Port (
          Max_Count : out std_logic;          -- registro que avisa la cuenta maxima
          Clk       : in std_logic;           -- reloj del sistema
          Reset     : in std_logic            -- bit de reinicio del sistema
          );
end component Counter;

-- Creación de señales


-- Inicio del test bench
begin

  -- Mapeo del PWM_LED
  UUT: Counter

  -- Datos de prueba

  -- Reloj del sistema
  TBCLK: process
  end process TBCLK;
  
  -- Reset del contador
  TBRST: process
  begin        
  end process TBRST;  
  
end testbench;