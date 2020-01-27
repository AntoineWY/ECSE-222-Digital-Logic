-- Author: Yinuo Wang 260766084
-- Author: Yicheng Song 260763294
-- Date: 5 APR. 2019
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;

entity g62_multi_mode_counter is
	port(	start		: in std_logic;
			stop		: in std_logic;
			direction: in std_logic;
			reset		: in std_logic;
			clk		: in std_logic;
			HEX0		: out std_logic_vector(6 downto 0);
			HEX1		: out std_logic_vector(6 downto 0));
end g62_multi_mode_counter;

--------------------------------------Architecture of the multi_mode_counter----------------------------------------------------
architecture structure of g62_multi_mode_counter is
	
		signal buttonEnable : std_logic;
		signal innerEn: std_logic;
		signal LEDvalue: std_logic_vector (3 downto 0);



			component FSM  
				port (enable		:in std_logic;
						direction	:in std_logic;
						reset			:in std_logic;
						clk			:in std_logic;
						count			:out std_logic_vector(3 downto 0));
			end component;
			
			component decoder                   -- Declare decoder componenent
			port    (segmentcode : in	std_logic_vector(3 downto 0);
						segments0 	: out std_logic_vector(6 downto 0);
						segments1	: out std_logic_vector(6 downto 0));
			end component;
	
	
			component clock_divider             -- Declare clock divider componenent
					Port(enable	: in	std_logic;
						  reset	: in	std_logic;
						  clk		: in	std_logic;
						  en_out	: out	std_logic);
			end component;
			
begin

      cd: clock_divider port map(buttonEnable, reset, clk, innerEn); --map to a clock divider
		
		fsm1: FSM port map(innerEn, direction, reset, clk,  LEDvalue); 
	   Decoder: decoder port map(LEDvalue,HEX0,HEX1);
		
	  
 process(clk,reset)
		 begin

		if (rising_edge(clk)) then
		
			if(start ='1' and stop = '0') then 
					buttonEnable <= '0'; --stop is pressed, enable set to zero, the entire system froze from clock divider
			
			elsif(start ='0' and stop = '1') then 
					buttonEnable <= '1';  -- start is pressed. Clk_divider starts and activate entire system
			
			else
					buttonEnable <= buttonEnable;

			end if;
			
		end if;
		
		

 end process;
 
 

			
		end structure;