--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:39:54 09/06/2019
-- Design Name:   
-- Module Name:   C:/Users/dell/Desktop/nikhat/PROJECT_TDC/kishancodes/inputsectdl/input.vhd
-- Project Name:  inputsectdl
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: insec
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY input IS
END input;
 
ARCHITECTURE behavior OF input IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT insec
    PORT(
         start : IN  std_logic;
         clock : IN  std_logic;
         reset2 : IN  std_logic;
         o_start : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal start : std_logic := '0';
   signal clock : std_logic := '0';
   signal reset2 : std_logic := '0';

 	--Outputs
   signal o_start : std_logic;

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: insec PORT MAP (
          start => start,
          clock => clock,
          reset2 => reset2,
          o_start => o_start
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      reset2 <= '1';
		wait for 32ns;
		reset2 <= '0';
		start <= '1';
		wait for 50ns;
		start <= '0';
		wait for 50ns;
		start <= '1';
		wait for 50ns;
		start <= '0';
		wait for 50ns;
		start <= '1';
		wait for 50ns;
	

      -- insert stimulus here 

      wait;
   end process;

END;
