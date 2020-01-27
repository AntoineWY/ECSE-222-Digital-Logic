-- Author: Yinuo Wang 260766084
-- Author: Yicheng Song 260763294
-- Date: 5 APR. 2019
library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.ALL;
use ieee.numeric_std.ALL;

entity FSM is
	port (enable		:in std_logic;
			direction	:in std_logic;
			reset			:in std_logic;
			clk			:in std_logic;
			count			:out std_logic_vector(3 downto 0));
			
end FSM;

architecture counter of FSM is
   type State_type IS (A,B,C,D,E,F,G,H,I,J,K,L,M,N,O); --Declare all the 15 kinds of states.
	signal y: State_type;
	
	begin
		process(clk, reset, direction, enable)
		begin
		if (reset = '0') then		  --The FSM should be set to initial condition as the reset is active low.
	      if (direction = '0') then --As required, the initial condition should be set to A, which represent 1, when the direction is upward.
			y <= A;
			else
			y <= O;						  --The initial condition should be set to O, which represnet 9, when the direction is downward.
		   end if;
			
		elsif(rising_edge(clk)) then 
		case y is
			when A =>
				if enable = '1' then
					if direction = '0' then      --Take state A as example, if the direction is upward ( direction = 0 )
						y <= B;						  --Then it turns to state B.
					else								  --If the direction is downward ( direction = 1 )
						y <= O;						  --Then it turns to state O.
					end if;
				else
				   y <= A;							  --THe state remain the same when the enable = 0
				end if;
				
			when B =>
				if enable = '1' then
					if direction = '0' then		  
						y <= C;						  --Similar to state A, the state turns to C when direction is upward.
					else
						y <= A;						  --The state turns to A when direction is downward.
					end if;
				else
					y <= B;
				end if;
				
			when C =>
				if enable = '1' then
					if direction = '0' then
						y <= D;
					else
						y <= B;
					end if;
				else
				   y <= C;
				end if;
			
			when D =>
				if enable = '1' then
					if direction = '0' then
						y <= E;
					else
						y <= C;
					end if;
				else
				   y <= D;
				end if;
				
			when E =>
				if enable = '1' then
					if direction = '0' then
						y <= F;
					else
						y <= D;
					end if;
				else
				   y <= E;
				end if;
				
			when F =>
				if enable = '1' then
					if direction = '0' then
						y <= G;
					else
						y <= E;
					end if;
				else
				   y <= F;
				end if;
				
			when G =>
				if enable = '1' then
					if direction = '0' then
						y <= H;
					else
						y <= F;
					end if;
				else
				   y <= G;
				end if;
				
			when H =>
				if enable = '1' then
					if direction = '0' then
						y <= I;
					else
						y <= G;
					end if;
				else
				   y <= H;
				end if;
				
			when I =>
				if enable = '1' then
					if direction = '0' then
						y <= J;
					else
						y <= H;
					end if;
				else
				   y <= I;
				end if;
				
			when J =>
				if enable = '1' then
					if direction = '0' then
						y <= K;
					else
						y <= I;
					end if;
				else
				   y <= J;
				end if;
		
			when K =>
				if enable = '1' then
					if direction = '0' then
						y <= L;
					else
						y <= J;
					end if;
				else
				   y <= K;
				end if;
				
			when L =>
				if enable = '1' then
					if direction = '0' then
						y <= M;
					else
						y <= K;
					end if;
				else
				   y <= L;
				end if;
				
			when M =>
				if enable = '1' then
					if direction = '0' then
						y <= N;
					else
						y <= L;
					end if;
				else
				   y <= M;
				end if;
				
			when N =>
				if enable = '1' then
					if direction = '0' then
						y <= O;
					else
						y <= M;
					end if;
				else
				   y <= N;
				end if;
				
			when O =>
				if enable = '1' then
					if direction = '0' then
						y <= A;
					else
						y <= N;
					end if;
				else
				   y <= O;
				end if;
				
			end case;
		end if;
		end process;
				
		process(y)
		begin
			case y is 
				when A => count <= "0001";	--State A represent the 4-bit binary signal of digits 01
		 	   when B => count <= "0010";	--State B represent the 4-bit binary signal of digits 02
				when C => count <= "0100";	--State C represent the 4-bit binary signal of digits 04
				when D => count <= "1000";	--State D represent the 4-bit binary signal of digits 08
				when E => count <= "0011";	--State E represent the 4-bit binary signal of digits 03
			   when F => count <= "0110";	--State F represent the 4-bit binary signal of digits 06
				when G => count <= "1100";	--State G represent the 4-bit binary signal of digits 12
				when H => count <= "1011";	--State H represent the 4-bit binary signal of digits 11
				when I => count <= "0101";	--State I represent the 4-bit binary signal of digits 05
				when J => count <= "1010";	--State J represent the 4-bit binary signal of digits 10
				when K => count <= "0111";	--State K represent the 4-bit binary signal of digits 07
				when L => count <= "1110";	--State L represent the 4-bit binary signal of digits 14
				when M => count <= "1111";	--State M represent the 4-bit binary signal of digits 15
				when N => count <= "1101";	--State N represent the 4-bit binary signal of digits 13
				when O => count <= "1001";	--State O represent the 4-bit binary signal of digits 09
			end case;
		end process;

	end counter;