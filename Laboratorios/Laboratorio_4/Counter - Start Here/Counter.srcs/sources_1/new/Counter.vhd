------------------------------------------------------------------------------------------------------------------------------------------
-- COMPANY:      NONE
--
-- ENGINEER:     Rangel Alvarado
--
-- MODULE NAME:  Counter
--
-- DESCRIPTION:  Cuenta de 0 a MAX_VAL.
--               Posee mecanismos de generación de reset asíncrono y síncrono
--
-- REVISION:     1.0 - 02/16/19 File Created.
--
-- COMMENTS:     None.
------------------------------------------------------------------------------------------------------------------------------------------

-- Librerías
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.MATH_REAL.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Entidad del Contador
entity Counter is
    Generic (
             MAX_VAL     : integer := 2**30;  -- valor maximo de conteo
             SYNC_Reset  : boolean := true    -- Si vamos a realizar conteo...
                                              -- sincrono o asincrono
            );
    Port (
          Max_Count : out std_logic;          -- registro que avisa la cuenta maxima
          Clk       : in std_logic;           -- reloj del sistema
          Reset     : in std_logic            -- bit de reinicio del sistema
          );
end Counter;


-- Inicia la descripcion de operacion del componente
architecture Behavioral of Counter is

    begin

end Behavioral;