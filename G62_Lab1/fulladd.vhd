library ieee;
use ieee.std_logic_1164.all; --Using Standard libraries 

entity fulladd is -- Declare the entity title for a one bit full adder
	port (Cin, A, B	: in	std_logic;  -- Input: A,B are two operands for addition and Cin is the carry-in
			s, Cout		: out	std_logic); -- Output: S is the sum bit and Cout is the carry out bit
end fulladd;

	architecture Func of fulladd is
		begin
			s 		<= A XOR B XOR Cin; -- logic function for sum bit S
			Cout	<= (A AND B) OR (Cin AND A) OR (Cin AND B); -- Logic function for carry out bit
		end Func;