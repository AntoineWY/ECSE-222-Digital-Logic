--------------------------------------library declaration of the unCounter entity---------------------------------
library ieee; 
use ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.ALL;
use ieee.numeric_std.ALL;

--------------------------------------Declaration of the up counter variables-------------------------------------
entity upNCounter is 
	Port(enable	: in	std_logic;
		  reset	: in	std_logic;
		  clk		: in	std_logic;
		  radix  : in  std_logic_vector(3 downto 0);    --Radix: An input defines the upper bound (modulo) of the upcounter
		  en_out : out std_logic;                       --out enable, will be used as ripples to the next counter
		  count	: out	std_logic_vector(3 downto 0));   --output indicating the current state of the up counter
end upNCounter;

--------------------------------------Architecture of the up counter----------------------------------------------
	architecture counter of upNCounter is
		signal temp : std_logic_vector(3 downto 0);
		signal inner_En : std_logic;
	begin
		process(clk, reset)
		begin
		
			if 	(reset = '0') 			then temp <= "0000"; --current state set to zero
			
			
			elsif (rising_edge(clk) and temp /= radix)then
			
						if	(enable='1')	then temp <= temp + 1;
												else temp <= temp;       --when state is under the boundry
						                  end if;                  --keep adding the state and keep the output to be zero
					   inner_En <= '1'; -- will be zero since the output is NOTed
			
			elsif(rising_edge(clk) and temp = radix) then
			           
						 if(enable='1')	then temp <= "0000";     --when state reaches boundry
						                  inner_En <= '0';         --reset the state to be 0
												else temp <= temp;
												inner_En <= '1';         -- output set to 0 (will be NOTed to 1 in the end)
						                  end if;
			
			end if;
			
			
			
			
		end process;
		en_out <= not inner_En; -- NOT output
		count <= temp;          -- Get the current state(for decoders and LEDs)
	end counter;