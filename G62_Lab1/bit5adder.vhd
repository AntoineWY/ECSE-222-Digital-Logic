library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.all;-- Use all existed entities: fulladder

entity bit5adder is
	port (A, B	: in	std_logic_vector(4 downto 0);	-- Input: Two 5-bit binary representation as operands
			Cin	: in	std_logic;		               -- Input: a 1-bit binary bit as carry in
			S		: out	std_logic_vector(4 downto 0); -- Output: A 5-bit binary representation as sum
			Cout	: out std_logic);                   -- Output: A 1-bit binary representation as carry-out.
	end bit5adder;                                  --         Sum and carryout makes up a integrated 6 bit sum
	
	architecture structure of bit5adder is
		signal c_internal : std_logic_vector (3 downto 0);		-- An array of 4 internal ripple carries
			component fulladd                                  -- Using component: A one bit full adder
				port(
					Cin, A, B : in 	std_logic;						--refer to the comment of port in "fulladd"
					S, Cout	 : out	std_logic);						--refer to the comment of port in "fulladd"
			end component;
	
	
	
		begin
			stage0 : fulladd port map (Cin, 			   A(0), B(0), S(0), c_internal(0)); -- Add A(0), B(0), Cin together to get S(0) as the first bit from the least significant bit and c-internal(0) as the first internal carry.
			stage1 : fulladd port map (c_internal(0), A(1), B(1), S(1), c_internal(1)); -- Add A(1), B(1), c-internal(0) together to get S(1) as the second bit from the least significant bit and c-internal(1) as the second internal carry.
			stage2 : fulladd port map (c_internal(1), A(2), B(2), S(2), c_internal(2)); -- Add A(2), B(2), c-internal(1) together to get S(2) as the third bit from the least significant bit and c-internal(2) as the third internal carry.
			stage3 : fulladd port map (c_internal(2), A(3), B(3), S(3), c_internal(3)); -- Add A(3), B(3), c-internal(2) together to get S(3) as the forth bit from the least significant bit and c-internal(3) as the forth internal carry.
			stage4 : fulladd port map (Cin  => c_internal(3), -- Take c-internal(3) as the oprand of addition.
												A    => A(4),			  -- Take A(4) as the oprand of addition.
												B	  => B(4), 			  -- Take B(4) as the oprand of addition.
												S	  => S(4), 			  -- Output is the MSB of the 5-bit sum.
												Cout => Cout);			  -- Output: carry-out.
		end structure;