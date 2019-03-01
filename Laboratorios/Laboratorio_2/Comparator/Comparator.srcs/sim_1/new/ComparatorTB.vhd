-------------------------------------------------------------------------------
-- COMPANY: 	 NONE
--
-- ENGINEER:	 Rangel Alvarado
--
-- MODULE NAME:  Comparator
--
-- DESCRIPTION:  Archivo de test.  Comparamos varios valores binarios para ver
--               si el comparador está haciendo el trabajo.
--
-- REVISION:	 1.0 - 01/23/19 File Created.
--
-- COMMENTS:	 Se crea un archivo TB de simulación para ver el resultado.
-------------------------------------------------------------------------------


-- Definicion de librería
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Creamos una entidad de prueba
entity ComparatorTB is
end ComparatorTB;

-- Inicio de la arquitectura del test bench
architecture testbench of ComparatorTB is

-- Definimos el componente
component Comparator is
  Port (x   : in std_logic_vector (3 downto 0);
        y   : in std_logic_vector (3 downto 0); 
        comp: out std_logic_vector (2 downto 0)
        );
end component Comparator;

-- Creamos unas señales para el mapping
signal x, y: std_logic_vector(3 downto 0)  := "0000";
signal comp: std_logic_vector (2 downto 0) := "000";

-- Inicio del test bench
begin

  -- Mapeo del comparador
  UUT: Comparator
      port map(x, y, comp);

  -- Datos de prueba
  TBDATA:  process
  begin
      -- Probamos la condicion menor que a los 20ns
      wait for 20 ns;
        x <= "0110";
        y <= "1001";
        
      -- Probamos la condicion igual que a los 20 ns siguientes
      wait for 20 ns;
        x <= "1100";
        y <= "1100";
        
      -- Probamos la condición mayor que a los siguientes 20 ns 
      wait for 20 ns;
        x <= "1110";
        y <= "0100";
  end process TBDATA;
end testbench;