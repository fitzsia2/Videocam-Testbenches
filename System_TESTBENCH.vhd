--------------------------------------------------------------------------------
LIBRARY ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;
--------------------------------------------------------------------------------
ENTITY System_TESTBENCH IS
END System_TESTBENCH;
--------------------------------------------------------------------------------
  ARCHITECTURE behavior OF System_TESTBENCH IS 

  -- Component Declaration for UUT
   COMPONENT VideoCam
      PORT(
         CLK100    : in STD_LOGIC;
         CAM_EN    : in STD_LOGIC;
         VGA_EN    : in STD_LOGIC;
         D_BUG     : out STD_LOGIC_VECTOR(15 downto 0);
         -- Camera Signals
         CAM_SIOC  : out STD_LOGIC;
         CAM_SIOD  : out STD_LOGIC;
         CAM_VSYNC : in  STD_LOGIC;
         CAM_HREF  : in  STD_LOGIC;
         CAM_PCLK  : in  STD_LOGIC;
         CAM_DATA  : in  STD_LOGIC_VECTOR (7 downto 0);
         CAM_XCLK  : out  STD_LOGIC;
         -- Memory Signals
         MEM_MT_CRE: out STD_LOGIC;
         MEM_DATA  : inout  STD_LOGIC_VECTOR (15 downto 0);
         MEM_ADR   : out  STD_LOGIC_VECTOR (25 downto 0);
         PCM_CS_L  : out  STD_LOGIC;
         MEM_CS_L  : out  STD_LOGIC;
         MEM_OE_L  : out  STD_LOGIC;
         MEM_WR_L  : out  STD_LOGIC;
         MEM_ADV_L : out  STD_LOGIC;
         MEM_CLK_L : out  STD_LOGIC;
         MEM_UB_L  : out  STD_LOGIC;
         MEM_LB_L  : out  STD_LOGIC;
         -- VGA Signals
         RED_OUT   : out STD_LOGIC_VECTOR(2 downto 0);
         GREEN_OUT : out STD_LOGIC_VECTOR(2 downto 0);
         BLUE_OUT  : out STD_LOGIC_VECTOR(2 downto 1);
         HS_OUT    : out STD_LOGIC;
         VS_OUT    : out STD_LOGIC;
         -- Ethernet Signals
         ETH_TXCLK : IN std_logic;          
         ETH_RSTN_L : OUT std_logic;
         ETH_MODE0_RXD0 : OUT std_logic;
         ETH_CRS : INOUT std_logic;
         ETH_MODE1_RXD1 : OUT std_logic;
         ETH_MODE2_COL : OUT std_logic;
         ETH_TXD : OUT std_logic_vector(3 downto 0);
         ETH_TXEN : OUT std_logic;
         ETH_INT_L_TXER_TX4 : OUT std_logic;
         ETH_AD0_RXER_RXD4 : OUT std_logic;
         ETH_AD1_RXCLK : OUT std_logic;
         ETH_AD2_RXD3 : OUT std_logic;
         ETH_RMIISEL_RXD2 : OUT std_logic;
         -- LED Signals
         LED_ARRAY_L : OUT std_logic_vector(7 downto 0)
      );
   END COMPONENT;
--------------------------------------------------------------------------------
-- Interfaced Signals to UUT
--------------------------------------------------------------------------------

         signal CLK100    : STD_LOGIC := '0';
         signal CAM_EN    : STD_LOGIC := '1';
         signal VGA_EN    : STD_LOGIC := '0';
         signal D_BUG     : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
         -- Camera Signals
         signal CAM_SIOC  : STD_LOGIC := '0';
         signal CAM_SIOD  : STD_LOGIC := '0';
         signal CAM_XCLK  : STD_LOGIC := '0';
         signal CAM_PCLK  : STD_LOGIC := '0';
         signal CAM_VSYNC : STD_LOGIC := '0';
         signal CAM_HREF  : STD_LOGIC := '0';
         signal CAM_DATA  : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
         -- Memory Signals
         signal MEM_MT_CRE: STD_LOGIC;
         signal MEM_DATA  : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
         signal MEM_ADR   : STD_LOGIC_VECTOR (25 downto 0) := (others => '0');
         signal PCM_CS_L  : STD_LOGIC;
         signal MEM_CS_L  : STD_LOGIC;
         signal MEM_OE_L  : STD_LOGIC;
         signal MEM_WR_L  : STD_LOGIC;
         signal MEM_ADV_L : STD_LOGIC;
         signal MEM_CLK_L : STD_LOGIC;
         signal MEM_UB_L  : STD_LOGIC;
         signal MEM_LB_L  : STD_LOGIC;
         -- VGA Signals
         signal RED_OUT   : STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
         signal GREEN_OUT : STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
         signal BLUE_OUT  : STD_LOGIC_VECTOR(2 downto 1) := (others => '0');
         signal HS_OUT    : STD_LOGIC := '0';
         signal VS_OUT    : STD_LOGIC := '0';
         -- Ethernet Signals
         signal ETH_TXCLK : std_logic;          
         signal ETH_RSTN_L :  std_logic;
         signal ETH_MODE0_RXD0 :  std_logic;
         signal ETH_CRS :  std_logic;
         signal ETH_MODE1_RXD1 :  std_logic;
         signal ETH_MODE2_COL :  std_logic;
         signal ETH_TXD :  std_logic_vector(3 downto 0);
         signal ETH_TXEN :  std_logic;
         signal ETH_INT_L_TXER_TX4 :  std_logic;
         signal ETH_AD0_RXER_RXD4 :  std_logic;
         signal ETH_AD1_RXCLK : std_logic;
         signal ETH_AD2_RXD3 : std_logic;
         signal ETH_RMIISEL_RXD2 : std_logic;
         -- LED Signals
         signal LED_ARRAY_L : std_logic_vector(7 downto 0);
        
     -- Clock Period Definitions
         constant CLK100_period : time := 10 ns;
         constant CAM_PCLK_period : time := 41.67 ns;
         constant CAM_XCLK_period : time := 41.67 ns;
         constant tLINE_period : time := 32669.28 ns;
        
--------------------------------------------------------------------------------
-- Port Routing
--------------------------------------------------------------------------------
  BEGIN

   -- Component Instantiation
      uut: VideoCam PORT MAP(
         CLK100 => CLK100,
         CAM_EN => CAM_EN,
         VGA_EN => VGA_EN,
         D_BUG => D_BUG,
         -- Camera Signals
         CAM_SIOC => CAM_SIOC,
         CAM_SIOD => CAM_SIOD,
         CAM_VSYNC => CAM_VSYNC,
         CAM_HREF => CAM_HREF,
         CAM_PCLK => CAM_PCLK,
         CAM_DATA => CAM_DATA,
         CAM_XCLK => CAM_XCLK,
         -- Memory Signals
         MEM_MT_CRE => MEM_MT_CRE,
         MEM_DATA => MEM_DATA,
         MEM_ADR => MEM_ADR,
         PCM_CS_L => PCM_CS_L,
         MEM_CS_L => MEM_CS_L,
         MEM_OE_L => MEM_OE_L,
         MEM_WR_L => MEM_WR_L,
         MEM_ADV_L => MEM_ADV_L,
         MEM_CLK_L => MEM_CLK_L,
         MEM_UB_L => MEM_UB_L,
         MEM_LB_L => MEM_LB_L,
         -- VGA Signals
         RED_OUT => RED_OUT,
         GREEN_OUT => GREEN_OUT,
         BLUE_OUT => BLUE_OUT,
         HS_OUT => HS_OUT,
         VS_OUT => VS_OUT,
			-- Ethernet Signals
         ETH_CRS => ETH_CRS,
         ETH_RSTN_L => ETH_RSTN_L,
         ETH_MODE0_RXD0 => ETH_MODE0_RXD0,
         ETH_MODE1_RXD1 => ETH_MODE1_RXD1,
         ETH_MODE2_COL => ETH_MODE2_COL,
         ETH_TXD => ETH_TXD,
         ETH_TXEN => ETH_TXEN,
         ETH_TXCLK => ETH_TXCLK,
         ETH_INT_L_TXER_TX4 => ETH_INT_L_TXER_TX4,
         ETH_AD0_RXER_RXD4 => ETH_AD0_RXER_RXD4,
         ETH_AD1_RXCLK => ETH_AD1_RXCLK,
         ETH_AD2_RXD3 => ETH_AD2_RXD3,
         ETH_RMIISEL_RXD2 => ETH_RMIISEL_RXD2
      );

--------------------------------------------------------------------------------
-- Test Description
--------------------------------------------------------------------------------

   tb1 : PROCESS
   BEGIN
      wait for CLK100_period/2;
      CLK100 <= '1';
      wait for CLK100_period/2;
      CLK100 <= '0';
   END PROCESS;
   
   tb2 : PROCESS
   variable cnt : INTEGER := 0;
   BEGIN
      wait for CLK100_period*25;
      ETH_TXCLK <= '0';
      wait for CLK100_period*25;
      ETH_TXCLK <= '1';
   END PROCESS;

   tb : PROCESS
   variable cnt : INTEGER := 0;
   BEGIN
   -- Initialize Variables
      CAM_VSYNC <= '1';
      CAM_HREF <= '0';
      CAM_EN <= '1';
      wait for 1934095 ns;
      
   -- Main
      while true loop
         wait for tLINE_period*3;
         CAM_VSYNC <= '0';
         wait for tLINE_period*17;
         CAM_HREF <= '1';
         for i in 1 to 480 loop
            for c in 1 to 640 loop
               if(cnt = 0) then
                  cnt := 1;
                  CAM_DATA <= "00001100";
               elsif(cnt = 1) then
                  cnt := 2;
                  CAM_DATA <= "11111111";
               elsif(cnt = 2) then
                  cnt := 3;
                  CAM_DATA <= "00001111";
               elsif(cnt = 3) then
                  cnt := 4;
                  CAM_DATA <= "11111111";
               elsif(cnt = 4) then
                  cnt := 5;
                  CAM_DATA <= "00001010";
               elsif(cnt = 5) then
                  cnt := 6;
                  CAM_DATA <= "00001111";
               elsif(cnt = 6) then
                  cnt := 7;
                  CAM_DATA <= "11111111";
               elsif(cnt = 7) then
                  cnt := 0;
                  CAM_DATA <= "11111111";
               end if;
               CAM_PCLK <= '0';
               wait for CAM_PCLK_period/2;
               CAM_PCLK <= '1';
               wait for CAM_PCLK_period/2;
            end loop;
            CAM_HREF <= '0';
            wait for CAM_PCLK_period*144;
            CAM_HREF <= '1';
         end loop;
         wait for tLINE_period*10;
         CAM_VSYNC <= '1';
      end loop;
   END PROCESS tb;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
END;  --  End Test Bench 
