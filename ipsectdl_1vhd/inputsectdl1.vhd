----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:54:29 08/23/2019 
-- Design Name: 
-- Module Name:    inputsectdl1 - Behavioral 
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

entity inputsectdl1 is
generic( n : positive := 64);

    Port ( topstart : in  STD_LOGIC;
          -- topstop : in  STD_LOGIC;
			 topreset : in  STD_LOGIC;
           --dout : out  STD_LOGIC_VECTOR ((4*n-1) downto 0));
			  topclk   : in STD_LOGIC;
			  toptxen   : in STD_LOGIC;
			  toptxRdy : out  STD_LOGIC;
				toptxclk : out  STD_LOGIC;
				 -- bin : out  STD_LOGIC_VECTOR ((m-1) downto 0);
        tx : out  STD_LOGIC;
          o_start : out std_logic);


end inputsectdl1;

architecture Behavioral of inputsectdl1 is


component insec is
    Port ( start : in  STD_LOGIC;
           clock : in  STD_LOGIC;
            reset2 : in STD_LOGIC;
           o_start : out  STD_LOGIC);
end component;

component td is
generic( n : positive := 64);

    Port ( start1 : in  STD_LOGIC;
          --clkcc : in  STD_LOGIC;
  	  reset1 : in  STD_LOGIC;
	dout : out  STD_LOGIC_VECTOR (7 downto 0)
			  );
			
end component;



component uart1 is
    Port (
        I_clk : in  STD_LOGIC;
       

        I_reset: in  STD_LOGIC;

        I_txData : in  STD_LOGIC_VECTOR (7 downto 0);
        I_txSig : in  STD_LOGIC;
        O_txRdy : out  STD_LOGIC;
        O_tx : out  STD_LOGIC;
       O_txclk : out  STD_LOGIC

    );
end component;


signal d3 : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
signal m3 :std_logic;


begin

o_start <= m3;

ip: insec port map(
start => topstart,
clock => topclk,
reset2 =>topreset,
o_start => m3
 );

tap: td port map(

start1 => m3,
--clkcc => topstop,
reset1 => topreset,
dout => d3
);




comp: uart1 PORT MAP(
 I_clk => topclk,
       

        I_reset => topreset,

        I_txData => d3,
        I_txSig => toptxen,
        O_txRdy => toptxRdy,
        O_tx => tx,
		  O_txclk =>  toptxclk 
		  
		 
);



--startpulse=>m3;




end Behavioral;

