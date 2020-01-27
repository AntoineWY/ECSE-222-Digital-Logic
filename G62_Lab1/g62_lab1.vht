-- Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus Prime License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "03/02/2019 19:17:46"
                                                            
-- Vhdl Test Bench template for design  :  g62_lab1
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;    
use ieee.numeric_std.all;                            

ENTITY g62_lab1_vhd_tst IS
END g62_lab1_vhd_tst;
ARCHITECTURE g62_lab1_arch OF g62_lab1_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL A : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL B : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL decoded_A : STD_LOGIC_VECTOR(13 DOWNTO 0);
SIGNAL decoded_AplusB : STD_LOGIC_VECTOR(13 DOWNTO 0);
SIGNAL decoded_B : STD_LOGIC_VECTOR(13 DOWNTO 0);
COMPONENT g62_lab1
	PORT (
	A : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	B : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	decoded_A : OUT STD_LOGIC_VECTOR(13 DOWNTO 0);
	decoded_AplusB : OUT STD_LOGIC_VECTOR(13 DOWNTO 0);
	decoded_B : OUT STD_LOGIC_VECTOR(13 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : g62_lab1
	PORT MAP (
-- list connections between master ports and signals
	A => A,
	B => B,
	decoded_A => decoded_A,
	decoded_AplusB => decoded_AplusB,
	decoded_B => decoded_B
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- code that executes only once                      
WAIT;                                                       
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN          
 FOR i in 0 to 31 loop
        A <= std_logic_vector (to_unsigned(i,5));
		  B <=  std_logic_vector (to_unsigned(31,5));  -- code executes for every event on sensitivity list  
		  wait for 10 ns;
		  end loop;                                               
        -- code executes for every event on sensitivity list  
WAIT;                                                        
END PROCESS always;                                          
END g62_lab1_arch;
