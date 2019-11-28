----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:16:25 11/24/2019 
-- Design Name: 
-- Module Name:    delay - Behavioral 
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
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
Library UNISIM;
use UNISIM.vcomponents.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity delay is
generic( C_DELAY_TAP_VALUE : integer := 10);
      port(--clock : in std_logic;
		refclk : in std_logic;
		resett : in std_logic;
		  start_signal : in std_logic;
		  delayed_start_signal: out std_logic);
		  --count_valuein : in std_logic_vector (4 downto 0);
		  --count_valueout : out std_logic_vector (4 downto 0) );
end delay;

architecture Behavioral of delay is
--signal refclk_bufg : std_logic;
begin
--idelay_inst : idelay 
IDELAYE2_inst : IDELAYE2
   generic map (
      CINVCTRL_SEL => "FALSE",              -- Enable dynamic clock inversion (FALSE, TRUE)
      DELAY_SRC => "IDATAIN",               -- Delay input (IDATAIN, DATAIN)
      HIGH_PERFORMANCE_MODE => "FALSE",     -- Reduced jitter ("TRUE"), Reduced power ("FALSE")
      IDELAY_TYPE => "FIXED",          		-- FIXED, VARIABLE, VAR_LOAD, VAR_LOAD_PIPE
		--IDELAY_FORMAT => "TIME",
      IDELAY_VALUE => C_DELAY_TAP_VALUE,    -- Input delay tap setting (0-31)
      PIPE_SEL => "FALSE",                  -- Select pipelined mode, FALSE, TRUE
      REFCLK_FREQUENCY => 200.0,            -- IDELAYCTRL clock input frequency in MHz (190.0-210.0, 290.0-310.0).
      SIGNAL_PATTERN => "DATA"             -- DATA, CLOCK input signal
   )
  
   port map (
      CNTVALUEOUT => open,                  -- 5-bit output: Counter value output
      DATAOUT => delayed_start_signal,         -- 1-bit output: Delayed data output
      C => '0',                             -- 1-bit input: Clock input
      CE => '0',                            -- 1-bit input: Active high enable increment/decrement input
      CINVCTRL => '0',                      -- 1-bit input: Dynamic clock inversion input
      CNTVALUEIN => "00000",                -- 5-bit input: Counter value input
      DATAIN => '0',                        -- 1-bit input: Internal delay data input
      IDATAIN => start_signal,                  -- 1-bit input: Data input from the I/O
      INC => '0',                           -- 1-bit input: Increment / Decrement tap delay input
      LD => '0',                            -- 1-bit input: Load IDELAY_VALUE input
      LDPIPEEN => '0',                      -- 1-bit input: Enable PIPELINE register to load data input
      REGRST => '0'                         -- 1-bit input: Active-high reset tap-delay input
   );
	
	IDELAYCTRL_inst: IDELAYCTRL
	port map(
	RDY => open,
	REFCLK => refclk,
--	REFCLK => refclk_bufg,
	RST => resett
	);
	
--	refclk_bufg : BUFG
--	port map( I => refclk,
--	O => refclk_bufg);
	
end Behavioral;

