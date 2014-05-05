--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;
--------------------------------------------------------------------------------
ENTITY YCbCr_TESTBENCH IS
END YCbCr_TESTBENCH;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
ARCHITECTURE behavior OF YCbCr_TESTBENCH IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT YCbCrToRGB332
    PORT(
         CLK100 : IN  std_logic;
         D_BUG : OUT  std_logic_vector(3 downto 0);
         Y0 : IN  std_logic_vector(7 downto 0);
         Y1 : IN  std_logic_vector(7 downto 0);
         CB : IN  std_logic_vector(7 downto 0);
         CR : IN  std_logic_vector(7 downto 0);
         CLK_IN : IN  std_logic;
         DATA : OUT  std_logic_vector(15 downto 0);
         CLK_OUT : OUT  std_logic
        );
    END COMPONENT;
--------------------------------------------------------------------------------
   --Inputs
   signal CLK100 : std_logic := '0';
   signal Y0 : std_logic_vector(7 downto 0) := (others => '0');
   signal Y1 : std_logic_vector(7 downto 0) := (others => '0');
   signal CB : std_logic_vector(7 downto 0) := (others => '0');
   signal CR : std_logic_vector(7 downto 0) := (others => '0');
   signal CLK_IN : std_logic := '0';

 	--Outputs
   signal D_BUG : std_logic_vector(3 downto 0);
   signal DATA : std_logic_vector(15 downto 0);
   signal CLK_OUT : std_logic;

   -- Clock period definitions
   constant CLK100_period : time := 10 ns;
   constant CLK_IN_period : time := 400 ns;
   constant CLK_OUT_period : time := 10 ns;
--------------------------------------------------------------------------------
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: YCbCrToRGB332 PORT MAP (
          CLK100 => CLK100,
          D_BUG => D_BUG,
          Y0 => Y0,
          Y1 => Y1,
          CB => CB,
          CR => CR,
          CLK_IN => CLK_IN,
          DATA => DATA,
          CLK_OUT => CLK_OUT
        );
--------------------------------------------------------------------------------
 
   CLK_IN_process :process
   begin
      -- Initialize Inputs
      Y0 <= "00000000";
      Y1 <= "00000000";
      CR <= "00000000";
      CB <= "00000000";
		CLK_IN <= '0';
--		CLK_OUT <= '0';
      D_BUG(3 downto 0) <= (others => '0');
      
      while true loop
         for i in 0 to 5 loop
            wait for CLK_IN_period/2;
            CLK_IN <= '1';
            wait for CLK_IN_period/2;
            CLK_IN <= '0';
            if i = 0 then
               Y0 <= "00000000";
               Y1 <= "00000000";
               CR <= "00000000";
               CB <= "00000000";
            elsif i = 1 then
               Y0 <= "00000000";
               Y1 <= "00000000";
               CR <= "11111111";
               CB <= "00000000";
            elsif i = 2 then
               Y0 <= "00000000";
               Y1 <= "00000000";
               CR <= "00000000";
               CB <= "11111111";
            elsif i = 3 then
               Y0 <= "00000000";
               Y1 <= "00000000";
               CR <= "00000000";
               CB <= "11111111";
            elsif i = 4 then
               Y0 <= "00000000";
               Y1 <= "11111111";
               CR <= "00000000";
               CB <= "00000000";
            elsif i = 5 then
               Y0 <= "11111111";
               Y1 <= "11111111";
               CR <= "11111111";
               CB <= "11111111";
            end if;
         end loop;
      end loop;
   end process;

   -- Clock process definitions
   CLK100_process :process
   begin
		CLK100 <= '0';
		wait for CLK100_period/2;
		CLK100 <= '1';
		wait for CLK100_period/2;
   end process;

END;
