--------------------------------------------------------------------------------
LIBRARY ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;
--------------------------------------------------------------------------------
ENTITY DataHold_TESTBENCH IS
END DataHold_TESTBENCH;
--------------------------------------------------------------------------------
ARCHITECTURE behavior OF DataHold_TESTBENCH IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DataHold
    PORT(
         CLK_IN : IN  std_logic;
         CLK100 : IN std_logic;
         ARST_L : IN  std_logic;
         D_IN : IN  std_logic_vector(15 downto 0);
         CLK_OUT : OUT  std_logic;
         D_OUT : OUT  std_logic_vector(63 downto 0);
         D_BUG : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    
--------------------------------------------------------------------------------
-- Interfaced Signals to UUT
--------------------------------------------------------------------------------
   --Inputs
   signal CLK100 : std_logic := '0';
   signal CLK_IN : std_logic := '0';
   signal ARST_L : std_logic := '0';
   signal D_IN : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal CLK_OUT : std_logic;
   signal D_OUT : std_logic_vector(63 downto 0);
   signal D_BUG : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant CLK100_period : time := 10 ns;
   constant CLK_IN_period : time := 20 ns;
   constant CLK_OUT_period : time := 10 ns;
 
--------------------------------------------------------------------------------
-- Port Routing
--------------------------------------------------------------------------------
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DataHold PORT MAP (
          CLK_IN => CLK_IN,
          CLK100 => CLK100,
          ARST_L => ARST_L,
          D_IN => D_IN,
          CLK_OUT => CLK_OUT,
          D_OUT => D_OUT,
          D_BUG => D_BUG
        );
        
--------------------------------------------------------------------------------
-- Test Description
--------------------------------------------------------------------------------
   tb: process
   begin
      report "Test Complete";
      wait;
   end process;

   -- Clock process definitions
   CLK100_process :process
   begin
      CLK100 <= '0';
      wait for CLK100_period/2;
      CLK100 <= '1';
      wait for CLK100_period/2;
   end process;
   
   -- Clock process definitions
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
      ARST_L <= '1';
      D_IN(15 downto 0) <= (others => '0');
      while true loop
         for i in 0 to 3 loop
            if( i = 0 ) then D_IN(15 downto 0) <= "1111111111111111";
            elsif( i = 1 ) then D_IN(15 downto 0) <= "1010101010101010";
            elsif( i = 2 ) then  D_IN(15 downto 0) <= "0101010101010101";
            elsif( i = 3 ) then  D_IN(15 downto 0) <= "0000000000000000";
            end if;
            wait for CLK_IN_period;
         end loop;
      end loop;
      wait;
   end process;

END;
