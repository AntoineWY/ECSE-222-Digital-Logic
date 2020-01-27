library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.all; -- Use all existed entities: 5 bit ripple adder and decoder

entity g62_lab1 is
	port (
			A,	B 				:	in 	std_logic_vector(4   downto  0); -- Input: Two 5-bit binary representation  as operands
			decoded_A		:	out 	std_logic_vector(13  downto  0); -- output: 1. decoded A, a 14 bit representation correspond to the led segments
			decoded_B		:	out 	std_logic_vector(13  downto  0); -- 2. decoded B, a 14 bit representation correspond to the led segments
			decoded_AplusB	:	out	std_logic_vector(13	downto  0)); -- 3. Decoded SUM, a 14 bit representation correspond to the led segments
	end g62_lab1;
	
	architecture structure of g62_lab1 is
		signal result : std_logic_vector (7 downto 0);	    -- Result is a 8 bit binary vector representing the contenated sum
		signal resultFront : std_logic_vector (3 downto 0); -- First 4 bit of the result
		signal resultBack : std_logic_vector (3 downto 0);	 -- Last 4 bit of the result
		signal AFront : std_logic_vector (3 downto 0);	    -- First 4 bit of the operand A (LSB to the 4th bit)
		signal ABack : std_logic_vector (3 downto 0);	    -- Last 4 bit of the operand A (MSB)
		signal BFront : std_logic_vector (3 downto 0);	    -- First 4 bit of the operand B
		signal BBack : std_logic_vector (3 downto 0);	    -- Last 4 bit of the operand b
		signal S_in : std_logic_vector (4 downto 0);	       -- A 5 bit internal sum (without the carry out)
		signal Cout_in: std_logic;	                         -- A one bit variable representing internal carry-out 
		
		
			component bit5adder
				port (A, B	: in	std_logic_vector(4 downto 0);  -- Declare the component to be used: the five bit ripple adder
						Cin	: in	std_logic;		
						S		: out	std_logic_vector(4 downto 0);
						Cout	: out std_logic);
			end component;
			
			component decoder
			port    (	segmentcode : in	std_logic_vector(3 downto 0);  -- Declare the component to be used: decode the sum to led format
							segments 	: out std_logic_vector(6 downto 0));
			end component;
	
	
	
		begin
		
         AFront <= A(3 downto 0); -- partition the 5 bit input operand A
	      ABack  <= "000" &  A(4); -- Concatenate three 0s to the front of the most Significant bit to consist the first 4 bit of A
			BFront <= B(3 downto 0); -- Similar to the operation to A, partition of B and concatenation
	      BBack  <= "000" &  B(4);		
			
			G1: decoder port map (AFront ,decoded_A(6 downto 0)); -- Decode the two parts of A into a 14 bit representation on 2 led
		   G2: decoder port map (ABack ,decoded_A(13 downto 7));
         G3: decoder port map (BFront ,decoded_B(6 downto 0)); -- Decode the two parts of B into a 14 bit representation on 2 led
		   G4: decoder port map (BBack ,decoded_B(13 downto 7));	
			
			G5: bit5adder port map (A,B,'0',S_in,Cout_in); -- Perform the ripple addition
			result <= "00"& Cout_in & S_in;                -- Concatenate the 2 zeros and carry-out in front of the MSB of 5 bit sum
			
			resultFront <= result(3 downto 0);             -- Partition the concatenated 8 bit sum in 2 parts
	      resultBack  <= result(7 downto 4);	
			G6: decoder port map (resultFront ,decoded_AplusB(6 downto 0));  -- Decode the two parts (2 4-bit vector) into two 7 bit led rep
		   G7: decoder port map (resultBack ,decoded_AplusB(13 downto 7));
			
			
			
			
		end structure;