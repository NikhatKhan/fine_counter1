----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:04:33 08/23/2019 
-- Design Name: 
-- Module Name:    encoder1 - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity encoder1 is
generic( m : integer := 8);
    Port ( therm : in  STD_LOGIC_VECTOR (255 downto 0);
	        resete : in STD_LOGIC;
           bin : out  STD_LOGIC_VECTOR ((m-1) downto 0));
end encoder1;

architecture Behavioral of encoder1 is


begin
process(therm,resete)
variable i: integer range 0 to 255; 
begin
if resete = '1' then
bin <= "00000000";
else
for i in 0 to 255 loop                               

if therm((255-i)) = '1' then 
bin <= conv_std_logic_vector((256-i),m); -- Loop integer converted to type unsigned for output 
exit;
end if ;

end loop ; 
end if;
end process ; 
end Behavioral;



