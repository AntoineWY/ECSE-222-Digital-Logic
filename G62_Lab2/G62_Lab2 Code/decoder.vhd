library IEEE;
	use IEEE.STD_LOGIC_1164.ALL;
	use IEEE.NUMERIC_STD.ALL;
	entity decoder is -- Declare the entity for decoding the 4-bit binary signal to 7-segment LED format
		 Port (	segmentcode : in	std_logic_vector(3 downto 0);--Input: a 4-bit binary signal which refers to the number we are going to represent by the 7-segment LED.
					segments 	: out std_logic_vector(6 downto 0));--Output: a 7-bit binary signal that represent the 7-segment LED, with the most significant bit refers to bit-6 and the least significant bit refers to bit-0.
	end decoder;			
	
	architecture Display of decoder is 
	begin
		process(segmentcode)	
		begin
			case segmentcode is -- List all the possible 4-bit binary siganls and their relative 7-segment LED signal.
				when "0000" => segments <= "1000000"; -- 4-bit binary signal of number "0" in base-16 and its relative 7-bit segment signal 
				when "0001" => segments <= "1111001"; -- 4-bit binary signal of number "1" in base-16 and its relative 7-bit segment signal
				when "0010" => segments <= "0100100"; -- 4-bit binary signal of number "2" in base-16 and its relative 7-bit segment signal
				when "0011" => segments <= "0110000"; -- 4-bit binary signal of number "3" in base-16 and its relative 7-bit segment signal
				when "0100" => segments <= "0011001"; -- 4-bit binary signal of number "4" in base-16 and its relative 7-bit segment signal
				when "0101" => segments <= "0010010"; -- 4-bit binary signal of number "5" in base-16 and its relative 7-bit segment signal
				when "0110" => segments <= "0000010"; -- 4-bit binary signal of number "6" in base-16 and its relative 7-bit segment signal
				when "0111" => segments <= "1111000"; -- 4-bit binary signal of number "7" in base-16 and its relative 7-bit segment signal
				when "1000" => segments <= "0000000"; -- 4-bit binary signal of number "8" in base-16 and its relative 7-bit segment signal
				when "1001" => segments <= "0010000"; -- 4-bit binary signal of number "9" in base-16 and its relative 7-bit segment signal
				when "1010" => segments <= "0001000"; -- 4-bit binary signal of number "a" in base-16 and its relative 7-bit segment signal
				when "1011" => segments <= "0000011"; -- 4-bit binary signal of number "b" in base-16 and its relative 7-bit segment signal
				when "1100" => segments <= "1000110"; -- 4-bit binary signal of number "c" in base-16 and its relative 7-bit segment signal
				when "1101" => segments <= "0100001"; -- 4-bit binary signal of number "d" in base-16 and its relative 7-bit segment signal
				when "1110" => segments <= "0000110"; -- 4-bit binary signal of number "e" in base-16 and its relative 7-bit segment signal
				when "1111" => segments <= "0001110"; -- 4-bit binary signal of number "f" in base-16 and its relative 7-bit segment signal
				when others => segments <= "1111111"; -- All of the other 4-bit binary signals and their relative 7-bit segment signal
			end case;
		end process;
	end Display;