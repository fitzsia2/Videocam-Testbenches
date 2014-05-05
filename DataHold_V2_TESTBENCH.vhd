--------------------------------------------------------------------------------
LIBRARY ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;
--------------------------------------------------------------------------------
ENTITY DataHold_V2_TESTBENCH IS
END DataHold_V2_TESTBENCH;
--------------------------------------------------------------------------------
ARCHITECTURE behavior OF DataHold_V2_TESTBENCH IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DataHold_V2
    PORT(
         ARST : IN  std_logic;
         CLK100 : IN  std_logic;
         CLK_IN : IN  std_logic;
         D0 : IN  std_logic_vector(7 downto 0);
         D1 : IN  std_logic_vector(7 downto 0);
         D2 : IN  std_logic_vector(7 downto 0);
         D3 : IN  std_logic_vector(7 downto 0);
         CLK_OUT : OUT  std_logic;
         D_OUT : OUT  std_logic_vector(63 downto 0);
         D_BUG : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    
--------------------------------------------------------------------------------
-- Interfaced Signals to UUT
--------------------------------------------------------------------------------

   --Inputs
   signal ARST : std_logic := '0';
   signal CLK100 : std_logic := '0';
   signal CLK_IN : std_logic := '0';
   signal D0 : std_logic_vector(7 downto 0) := (others => '0');
   signal D1 : std_logic_vector(7 downto 0) := (others => '0');
   signal D2 : std_logic_vector(7 downto 0) := (others => '0');
   signal D3 : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal CLK_OUT : std_logic;
   signal D_OUT : std_logic_vector(63 downto 0);
   signal D_BUG : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant CLK100_period : time := 10 ns;
   constant CLK_IN_period : time := 400 ns;
   constant CLK_OUT_period : time := 10 ns;
 
--------------------------------------------------------------------------------
-- Port Routing
--------------------------------------------------------------------------------
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DataHold_V2 PORT MAP (
          ARST => ARST,
          CLK100 => CLK100,
          CLK_IN => CLK_IN,
          D0 => D0,
          D1 => D1,
          D2 => D2,
          D3 => D3,
          CLK_OUT => CLK_OUT,
          D_OUT => D_OUT,
          D_BUG => D_BUG
        );

--------------------------------------------------------------------------------
-- Test Description
--------------------------------------------------------------------------------
   -- Clock process definitions
   CLK100_process :process
   begin
		CLK100 <= '0';
		wait for CLK100_period/2;
		CLK100 <= '1';
		wait for CLK100_period/2;
   end process;
 
   CLK_IN_process :process
   begin
		CLK_IN <= '0';
		wait for CLK_IN_period/2;
		CLK_IN <= '1';
		wait for CLK_IN_period/2;
   end process;
 
   -- Stimulus process
   stim_proc: process
   begin
      ARST <= '0';
      D0(7 downto 0) <= (others => '0');
      D1(7 downto 0) <= (others => '0');
      D2(7 downto 0) <= (others => '0');
      D3(7 downto 0) <= (others => '0');
      while true loop
         for i in 0 to 3 loop
            wait for CLK_IN_period;
            if( i = 0 ) then
               D0(7 downto 0) <= "11111111";
               D1(7 downto 0) <= "11111111";
               D2(7 downto 0) <= "11111111";
               D3(7 downto 0) <= "11111111";
            elsif( i = 1 ) then
               D0(7 downto 0) <= "10101010";
               D1(7 downto 0) <= "10101010";
               D2(7 downto 0) <= "10101010";
               D3(7 downto 0) <= "10101010";
            elsif( i = 2 ) then
               D0(7 downto 0) <= "01010101";
               D1(7 downto 0) <= "01010101";
               D2(7 downto 0) <= "01010101";
               D3(7 downto 0) <= "01010101";
            elsif( i = 3 ) then
               D0(7 downto 0) <= "00000000";
               D1(7 downto 0) <= "00000000";
               D2(7 downto 0) <= "00000000";
               D3(7 downto 0) <= "00000000";
            end if;
         end loop;
      end loop;
      wait;
   end process;

END;
