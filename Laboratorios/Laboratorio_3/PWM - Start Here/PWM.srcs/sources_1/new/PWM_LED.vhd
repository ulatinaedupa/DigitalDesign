-------------------------------------------------------------------------------
-- COMPANY:      NONE
--
-- ENGINEER:     Rangel Alvarado
--
-- MODULE NAME:  PWM_LED
--
-- DESCRIPTION:  Realiza un modulador de ancho de pulso.  Un modulador de ancho
--               de pulso modifica el tiempo de encendido sin variar su fre-
--               cuencia.  En este caso, al utilizar un LED observaremos que
--               la intensidad disminuye y por consiguiente el ciclo de tra-
--               bajo
--
-- REVISION:     1.0 - 02/04/19 File Created.
--
-- COMMENTS:     None.
-------------------------------------------------------------------------------

-- Librerías
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;                -- Para STD_LOGIC
use IEEE.NUMERIC_STD.ALL;                   -- Para UNSIGNED

entity PWM_LED is
Generic (

Port(

     );
end PWM_LED;

-- Arquitectura
architecture Behavioral of PWM_LED is

-- Constantes
-- Contador de máxima frecuencia
-- Pasos mínimo para cada cambio de PWM


-- Senales
-- pwm_value = valor de la senal pwm
-- freq_count = contador de la senal de frecuencia
-- pwm_count = contador de ton
-- max_pwm_count = contador de ton+toff
-- pwm_step_count = contador de pasos de cuenta


begin
    -- Convertir el ciclo de trabajo a máxima cuenta de pwm

    
    -- Proceso que corre la señal de salida a la frecuencia correcta
    -- El detalle es, debemos contar desde 0 hasta ton y luego apagarlo
    -- El contador debe seguir adelante desde 0 hasta la max_pwm_count
    -- Todo este trayecto el led estará apagado salvo en ton
    -- El siguiente proceso detalla estas partes
	-- Convert Duty_Cycle to max_pwm_count
	
	-- Process that runs signal out at the correct frequency

end Behavioral;