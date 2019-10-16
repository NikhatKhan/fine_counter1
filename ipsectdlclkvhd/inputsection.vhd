----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:06:53 08/21/2019 
-- Design Name: 
-- Module Name:    insec - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
Library UNISIM;
use UNISIM.vcomponents.all;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity insec is
    Port ( start : in  STD_LOGIC;
           clock: in  STD_LOGIC;
			  reset2 : in STD_LOGIC;
           o_start : out  STD_LOGIC);


end insec;

architecture Behavioral of insec is
signal q1,q2 :STD_LOGIC;
begin
FDRE_inst1 : FDCE
 -- Initial value of register ('0' or '1')
port map (
Q => q1, -- Data output
C => start, -- Clock input
CE => '1', -- Clock enable input
CLR => q2, -- Synchronous reset input
D => '1' -- Data input
);

FDRE_inst2 : FDCE
-- Initial value of register ('0' or '1')
port map (
Q => q2, -- Data output
C => clock, -- Clock input
CE => '1', -- Clock enable input
CLR => reset2, -- Synchronous reset input
D => q1 -- Data input
);

o_start <= q1;

end Behavioral;

