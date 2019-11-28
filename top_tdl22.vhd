----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:55:10 02/13/2019 
-- Design Name: 
-- Module Name:    tdll1 - Behavioral 
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
Library IEEE;
Library UNISIM;
use UNISIM.vcomponents.all;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.NUMERIC_STD.ALL;



entity TDL_top is
generic( n : positive := 64);

    Port ( topstart : in  STD_LOGIC;
           --topstop : in  STD_LOGIC;
			 topreset : in  STD_LOGIC;
           --dout : out  STD_LOGIC_VECTOR ((4*n-1) downto 0));
			  topclk   : in STD_LOGIC;
			  toptxen   : in STD_LOGIC;
			  toptxRdy : out  STD_LOGIC;
				toptxclk : out  STD_LOGIC;
				 -- bin : out  STD_LOGIC_VECTOR ((m-1) downto 0);
        tx : out  STD_LOGIC;
         -- o_start : out std_logic;
		  locked : out STD_LOGIC);
			  
end TDL_top;


architecture TDL_top of TDL_top is


component td1 is
generic( n : positive := 64);

    Port ( start1 : in  STD_LOGIC;   
          clkcc : in  STD_LOGIC;
			  reset1 : in  STD_LOGIC;
			   dout : out  STD_LOGIC_VECTOR (7 downto 0)
			  );
			
end component;


component uart_simple is
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

component pll is
port
 (-- Clock in ports
  clkp           : in     std_logic;
  -- Clock out ports
  clk_outp          : out    std_logic;
  -- Status and control signals
  resetp             : in     std_logic;
 LOCKEDp            : out    std_logic);
 end component;
 
component insec is
    Port ( start : in  STD_LOGIC;
           clock : in  STD_LOGIC;
			  reset2 : in STD_LOGIC;
           o_start : out  STD_LOGIC);
end component;

component delay is
        port(--clock : in std_logic;
		  refclk : in std_logic;
		  resett : in std_logic;
		       start_signal : in std_logic;
		       delayed_start_signal : out std_logic);
end component;

signal d3 : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
signal m4, m6 :std_logic;


begin

--o_start <= m3;

--ip: insec port map(
--start => topstart,
--clock => m6,
--reset2 =>topreset,
--o_start => m3
-- );
 
 pl : pll port map(
 clkp => topclk,
 clk_outp => m6,
 resetp => topreset,
 LOCKEDp => locked
 );

tap: td1 port map(

start1 => topstart,
clkcc => m4,
reset1 => topreset,
dout => d3
);

delayy: delay port map(
--clock => topclock,
refclk => m6,
resett => topreset,
start_signal => topstart,
delayed_start_signal => m4
);

comp: uart_simple PORT MAP(
 I_clk => m6,

        I_reset => topreset,

        I_txData => d3,
        I_txSig => toptxen,
        O_txRdy => toptxRdy,
        O_tx => tx,
		  O_txclk =>  toptxclk 
		  
		 
);



--startpulse=>m3;
end TDL_top;


