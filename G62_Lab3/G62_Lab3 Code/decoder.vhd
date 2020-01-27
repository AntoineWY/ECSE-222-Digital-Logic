-- Author: Yinuo Wang 260766084
-- Author: Yicheng Song 260763294
-- Date: 5 APR. 2019
library IEEE;
	use IEEE.STD_LOGIC_1164.ALL;
	use IEEE.NUMERIC_STD.ALL;
	entity decoder is
		 Port (	segmentcode : in	std_logic_vector(3 downto 0);		--Input numbers represented by a 4-bit binary signal.
					segments0 	: out std_logic_vector(6 downto 0);		--The 7-segment code of the first digit of the state.
					segments1	: out std_logic_vector(6 downto 0));	--The 7-segment code of the second digit of the state.
	end decoder;			
	
	architecture Display of decoder is 
		signal segments : std_logic_vector(13 downto 0);	--A 14 bits binary signal which the first 7 bits represent the fitst digit and the last 7 bits represent the second one.
	begin
		process(segmentcode)	
		begin
			case segmentcode is				
				when "0001" => segments <= "10000001111001";	-- The 14-bit segment code for '01'
				when "0010" => segments <= "10000000100100";	-- The 14-bit segment code for '02'
				when "0011" => segments <= "10000000110000"; -- The 14-bit segment code for '03'
				when "0100" => segments <= "10000000011001"; -- The 14-bit segment code for '04'
				when "0101" => segments <= "10000000010010"; -- The 14-bit segment code for '05'
				when "0110" => segments <= "10000000000010"; -- The 14-bit segment code for '06'
				when "0111" => segments <= "10000001111000"; -- The 14-bit segment code for '07'
				when "1000" => segments <= "10000000000000"; -- The 14-bit segment code for '08'
				when "1001" => segments <= "10000000010000"; -- The 14-bit segment code for '09'
			
				when "1010" => segments <= "11110011000000"; -- The 14-bit segment code for '10'
				when "1011" => segments <= "11110011111001"; -- The 14-bit segment code for '11'
				when "1100" => segments <= "11110010100100"; -- The 14-bit segment code for '12'
				when "1101" => segments <= "11110010110000"; -- The 14-bit segment code for '13'
				when "1110" => segments <= "11110010011001"; -- The 14-bit segment code for '14'
				when "1111" => segments <= "11110010010010"; -- The 14-bit segment code for '15'
				when others => segments <= "11111111111111"; -- The 14-bit segment code for '16'
			end case;
		end process;
		
		segments1 <= segments(13 downto  7); --Taking the first 7 bits of the 14-bit binary signal as the 7-segment for the first digit.
		segments0 <= segments(6  downto  0); --Taking the last 7 bits of the 14-bit binary signal as the 7-segment for the second digit.
		
	end Display;	
	