-------------------------------------------------------------------------------
-- COMPANY: 	 NONE
--
-- ENGINEER:	 Rangel Alvarado
--
-- MODULE NAME:  Comparator
--
-- DESCRIPTION:  Ejemplo de if-elsif-else-endif.  Usamos un comparador de 4bits
--               las entradas 'x' y 'y' son evaluadas cada ciclo de reloj y 
--               si el resultado de 'x' con 'y' tiene las siguientes caract.
--               x > y => salida comp Bit2 = 1
--               x = y => saldia comp Bit1 = 1
--               x < y => salida comp Bit0 = 1
--
-- REVISION:	 1.0 - 01/23/19 File Created.
--
-- COMMENTS:	 Se crea un archivo TB de simulación para ver el resultado.
-------------------------------------------------------------------------------


-- Librería estándar de IEEE
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Definimos el comparador
entity Comparator is
  Port (x   : in std_logic_vector (3 downto 0);
        y   : in std_logic_vector (3 downto 0); 
        comp: out std_logic_vector (2 downto 0)
        );
end Comparator;

-- Definimos nuestra arquitectura
architecture Behavioral of Comparator is
begin

  -- Proceso que compara bits
  compbits: process(x, y)
  begin
    if (x > y) then 
      comp <= "100";
    elsif (x = y) then
      comp <= "010";
    elsif (x < y) then
      comp <= "001";
    else 
      comp <= (others => '1');
    end if;
  end process compbits;

end Behavioral;
