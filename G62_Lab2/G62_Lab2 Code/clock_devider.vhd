--------------------------------------library declaration of the clocker devider entity---------------------------------
library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.ALL;
use ieee.numeric_std.ALL;

--------------------------------------Declaration of the clocker devider variables-------------------------------------
entity clock_divider is
	Port(enable	: in	std_logic;
		  reset	: in	std_logic;
		  clk		: in	std_logic;
		  en_out	: out	std_logic);
end clock_divider;

--------------------------------------Architecture of the clocker devider ----------------------------------------------
	architecture logic of clock_divider is
		signal temp : std_logic_vector(18 downto 0);
		signal innerEnable : std_logic;
	begin
		process(clk, reset)
		begin
			if 	(reset = '0') 			then temp <= "1111010000100011111"; -- Threshold is 499999
			elsif (rising_edge(clk) and (temp/= 0)) 	then                 -- 20ns* 500000 = 0.01s which is the prefered period for the stopwatch
			
						if	(enable='1')	then temp <= temp - 1;
												else temp <= temp;		
												end if;                              -- Implementation information please refer to upNcounter
						                                                       -- the clock divider follows the same idea 
						innerEnable <= '1';                                    -- The counting down process is symmetrical
			elsif ((rising_edge(clk)) and (temp = 0)) then
						if	(enable='1')	then temp <= "1111010000100011111";
												else temp <= temp;						
												end if;
						innerEnable <= '0';
			end if;
		end process;
		en_out <= not innerEnable;
	end logic;