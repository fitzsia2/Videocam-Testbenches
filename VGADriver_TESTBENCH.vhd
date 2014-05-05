--------------------------------------------------------------------------------
LIBRARY ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;
--------------------------------------------------------------------------------
ENTITY VGADriver_TESTBENCH IS
END VGADriver_TESTBENCH;
 
ARCHITECTURE behavior OF VGADriver_TESTBENCH IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT VGADriver
      PORT(
         CLK_100M_IN : in STD_LOGIC;
         D_BUG     : out STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
         CLK_OUT   : out STD_LOGIC := '0';
         ADR_READ  : out STD_LOGIC_VECTOR(25 downto 0) := (others => '0');
         CLK_IN    : in STD_LOGIC;
         D_IN      : in STD_LOGIC_VECTOR(63 downto 0);
         RED_OUT   : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
         GREEN_OUT : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
         BLUE_OUT  : out STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
         HS_OUT    : out STD_LOGIC := '1';
         VS_OUT    : out STD_LOGIC := '1';
         VGA_EN    : in STD_LOGIC
      );
    END COMPONENT;
    

   --Inputs
   signal CLK_100M_IN : std_logic := '0';
   signal CLK_IN : std_logic := '0';
   signal D_IN : std_logic_vector(63 downto 0) := (others => '0');
   signal VGA_EN : std_logic := '0';

 	--Outputs
   signal D_BUG : std_logic_vector(3 downto 0);
   signal CLK_OUT : std_logic;
   signal ADR_READ : std_logic_vector(26 downto 1);
   signal RED_OUT : std_logic_vector(2 downto 0);
   signal GREEN_OUT : std_logic_vector(2 downto 0);
   signal BLUE_OUT : std_logic_vector(1 downto 0);
   signal HS_OUT : std_logic;
   signal VS_OUT : std_logic;

   -- Clock period definitions
   constant CLK_100M_IN_period : time := 10 ns;
   constant CLK_IN_period : time := 320 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: VGADriver PORT MAP (
          CLK_100M_IN => CLK_100M_IN,
          D_BUG => D_BUG,
          CLK_OUT => CLK_OUT,
          ADR_READ => ADR_READ,
          CLK_IN => CLK_IN,
          D_IN => D_IN,
          RED_OUT => RED_OUT,
          GREEN_OUT => GREEN_OUT,
          BLUE_OUT => BLUE_OUT,
          HS_OUT => HS_OUT,
          VS_OUT => VS_OUT,
          VGA_EN => VGA_EN
        );

   -- Clock process definitions
   CLK_100M_IN_process :process
   begin
		CLK_100M_IN <= '0';
		wait for CLK_100M_IN_period/2;
		CLK_100M_IN <= '1';
		wait for CLK_100M_IN_period/2;

   end process;
   
   -- Stimulus process
   stim_proc: process
   begin		
      wait for 100 ns;	
      VGA_EN <= '1';
      D_IN <= "1110001100011100111000110001110011100011000111001110001100011100";
      while true loop
         wait for CLK_IN_period/2;
         CLK_IN <= '1';
         wait for CLK_IN_period/2;
         CLK_IN <= '0';
      end loop;
   end process;
END;
