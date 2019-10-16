----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:01:42 08/23/2019 
-- Design Name: 
-- Module Name:    td - Behavioral 
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
use IEEE.STD_LOGIC_1164.ALL;
use UNISIM.vcomponents.all;
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

entity td is
generic( n : positive := 64);

       Port ( start1 : in  STD_LOGIC;
			  reset1 : in  STD_LOGIC;
           dout : out  STD_LOGIC_VECTOR (7 downto 0)
			  );

end td;

architecture Behavioral of td is

component encoder1
	generic( m : integer := 8);
    Port ( therm : in  STD_LOGIC_VECTOR (255 downto 0);
	        resete : in STD_LOGIC;
           bin : out  STD_LOGIC_VECTOR ((m-1) downto 0));
end component;


signal z : STD_LOGIC_VECTOR (4*n downto 0);
signal d : STD_LOGIC_VECTOR (4*n downto 1);
--signal dout :   STD_LOGIC_VECTOR (7 downto 0);

begin


z(0) <= start1;
generate_carr: for i in 1 to n generate

first_carry: if i=1 generate
comp: carry4 port map (
CO => z(4 downto 1),
--O => z(4 downto 1),
	CI => '0',
	CYINIT => z(0),
	DI => "0000",
	S => "1111"

);
end generate;

carry: if i>1 generate
comp: carry4 port map (
	CO => z(4*i downto 4*i-3),
	--O => z(4*i downto 4*i-3),
--	CI => z(4*i-4),
--	CYINIT => '0',
	CI => z(4*i-4),
	CYINIT => '0',
	DI => "0000",
	S => "1111"
	
	
);
end generate;
--
--
--
end generate generate_carr;




generate_dff: for i in 1 to 4*n generate

comp : FDCE_1
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => d(i), -- Data output
C => start1, -- Clock input
CE => '1', -- Clock enable input
CLR => reset1, -- Asynchronous clear input
D => z(i) -- Data input
);
end generate generate_dff;


enc: encoder1 PORT MAP(
therm => d,
resete => reset1,
bin => dout
);


end Behavioral;

