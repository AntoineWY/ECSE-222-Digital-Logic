-- Author: Yinuo Wang 260766084
-- Author: Yicheng Song 260763294
-- Date: 5 APR. 2019
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
		signal temp : std_logic_vector(25 downto 0);
		signal innerEnable : std_logic;
	begin
		process(clk, reset)
		begin
			if 	(reset = '0') 			then temp <= "10111110101111000001111111"; -- Threshold is 49999999
			elsif (rising_edge(clk) and (temp/= 0)) 	then                 -- 20ns* 50000000 = 1s which is the prefered period for the Multi-Mode Counter
			
						if	(enable='1')	then temp <= temp - 1;
												else temp <= temp;		
												end if;                              -- Implementation information please refer to down counter
						                                                       -- the Multi-Mode Counter follows the same idea with specific threshold 
						innerEnable <= '1';                                   
			elsif ((rising_edge(clk)) and (temp = 0)) then
						if	(enable='1')	then temp <= "10111110101111000001111111";
												else temp <= temp;						
												end if;
						innerEnable <= '0';
			end if;
		end process;
		en_out <= not innerEnable;
	end logic;