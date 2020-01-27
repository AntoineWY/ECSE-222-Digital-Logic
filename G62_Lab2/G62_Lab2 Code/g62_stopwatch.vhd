--------------------------------------library declaration of the stopwatch entity-------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;

--------------------------------------Declaration of the stopwatch variables------------------------------------------
entity g62_stopwatch is
PORT( start  : in std_logic;
      stop   : in std_logic;
		reset  : in std_logic;
		clk    : in std_logic;
		HEX0   : out std_logic_vector(6 downto 0);
		HEX1   : out std_logic_vector(6 downto 0);
		HEX2   : out std_logic_vector(6 downto 0);
		HEX3   : out std_logic_vector(6 downto 0);
		HEX4   : out std_logic_vector(6 downto 0);
		HEX5   : out std_logic_vector(6 downto 0));
end g62_stopwatch;

--------------------------------------Architecture of the stopwatch----------------------------------------------------
architecture structure of g62_stopwatch is
	
		signal buttonEnable : std_logic;
		signal innerEn: std_logic_vector (6 downto 0);
		signal LEDbit0: std_logic_vector (3 downto 0);
		signal LEDbit1: std_logic_vector (3 downto 0);
		signal LEDbit2: std_logic_vector (3 downto 0);
		signal LEDbit3: std_logic_vector (3 downto 0);
		signal LEDbit4: std_logic_vector (3 downto 0);
		signal LEDbit5: std_logic_vector (3 downto 0);

			component upNCounter  -- Declare upNCounter componenent
				Port(enable	: in	std_logic;
					reset	 : in	   std_logic;
					clk	 : in	   std_logic;
					radix  : in    std_logic_vector(3 downto 0);
					en_out : out   std_logic;
					count	 : out	std_logic_vector(3 downto 0));
			end component;
			
			component decoder                   -- Declare decoder componenent
			port    (	segmentcode : in	std_logic_vector(3 downto 0);
							segments 	: out std_logic_vector(6 downto 0));
			end component;
	
	
			component clock_divider             -- Declare clock divider componenent
					Port(enable	: in	std_logic;
						reset	: in	std_logic;
						clk		: in	std_logic;
						en_out	: out	std_logic);
			end component;
			
begin

      cd1: clock_divider port map(buttonEnable, reset, clk, innerEn(0)); --map to a clock divider
		
		uc0: upNCounter port map (innerEn(0),reset , clk, "1001", innerEn(1),LEDbit0 ); --map to a mod-10 (0-9) up counter
		uc1: upNCounter port map (innerEn(1),reset , clk, "1001", innerEn(2),LEDbit1 ); --map to a mod-10 (0-9) up counter
		uc2: upNCounter port map (innerEn(2),reset, clk, "1001", innerEn(3),LEDbit2 );  --map to a mod-10 (0-9) up counter
		uc3: upNCounter port map (innerEn(3), reset, clk, "0101", innerEn(4),LEDbit3 ); --map to a mod-6 (0-5) up counter
		uc4: upNCounter port map (innerEn(4), reset , clk, "1001", innerEn(5),LEDbit4 );--map to a mod-10 (0-9) up counter
		uc5: upNCounter port map (innerEn(5), reset , clk, "0101", innerEn(6),LEDbit5 );--map to a mod-6 (0-5) up counter
		
		de0: decoder port map (LEDbit0, HEX0); -- map to a decoder to the LED segment representation
		de1: decoder port map (LEDbit1, HEX1);
		de2: decoder port map (LEDbit2, HEX2);
		de3: decoder port map (LEDbit3, HEX3);
		de4: decoder port map (LEDbit4, HEX4);
		de5: decoder port map (LEDbit5, HEX5);
		
	  
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