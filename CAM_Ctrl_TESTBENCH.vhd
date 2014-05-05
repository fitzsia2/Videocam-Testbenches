--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:57:10 06/01/2013
-- Design Name:   
-- Module Name:   C:/Users/Andrew/Desktop/VideoCam/TestBenches/CAM_Ctrl_TESTBENCH.vhd
-- Project Name:  VideoCam
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CAM_Ctrl
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY CAM_Ctrl_TESTBENCH IS
END CAM_Ctrl_TESTBENCH;
 
ARCHITECTURE behavior OF CAM_Ctrl_TESTBENCH IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CAM_Ctrl
    PORT(
         CLK_IN : IN  std_logic;
         SIOC : OUT  std_logic;
         SIOD : OUT  std_logic;
         VSYNC : IN  std_logic;
         HREF : IN  std_logic;
         PCLK : IN  std_logic;
         DATA : IN  std_logic_vector(7 downto 0);
         CAM_EN : IN  std_logic;
         D_BUG : OUT  std_logic_vector(3 downto 0);
         XCLK : OUT  std_logic;
         ARST_L : OUT  std_logic;
         PWDN : OUT  std_logic;
         CLK_OUT : OUT  std_logic;
         D0 : OUT  std_logic_vector(7 downto 0);
         D1 : OUT  std_logic_vector(7 downto 0);
         D2 : OUT  std_logic_vector(7 downto 0);
         D3 : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK_IN : std_logic := '0';
   signal VSYNC : std_logic := '0';
   signal HREF : std_logic := '0';
   signal PCLK : std_logic := '0';
   signal DATA : std_logic_vector(7 downto 0) := (others => '0');
   signal CAM_EN : std_logic := '0';

 	--Outputs
   signal SIOC : std_logic;
   signal SIOD : std_logic;
   signal D_BUG : std_logic_vector(3 downto 0);
   signal XCLK : std_logic;
   signal ARST_L : std_logic;
   signal PWDN : std_logic;
   signal CLK_OUT : std_logic;
   signal D0 : std_logic_vector(7 downto 0);
   signal D1 : std_logic_vector(7 downto 0);
   signal D2 : std_logic_vector(7 downto 0);
   signal D3 : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_IN_period : time := 10 ns;
   constant CLK_OUT_period : time := 10 ns;
         constant PCLK_period : time := 100 ns;
         constant XCLK_period : time := 100 ns;
         constant tLINE_period : time := 78400 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CAM_Ctrl PORT MAP (
          CLK_IN => CLK_IN,
          SIOC => SIOC,
          SIOD => SIOD,
          VSYNC => VSYNC,
          HREF => HREF,
          PCLK => PCLK,
          DATA => DATA,
          CAM_EN => CAM_EN,
          D_BUG => D_BUG,
          XCLK => XCLK,
          ARST_L => ARST_L,
          PWDN => PWDN,
          CLK_OUT => CLK_OUT,
          D0 => D0,
          D1 => D1,
          D2 => D2,
          D3 => D3
        );

   -- Clock process definitions
   CLK_IN_process :process
   begin
		CLK_IN <= '0';
		wait for CLK_IN_period/2;
		CLK_IN <= '1';
		wait for CLK_IN_period/2;
   end process;

   tb : PROCESS
   variable cnt : INTEGER := 0;
   BEGIN
   -- Initialize Variables
      VSYNC <= '1';
      HREF <= '0';
      CAM_EN <= '1';
      
   -- Main
      while true loop
         wait for tLINE_period*3;
         VSYNC <= '0';
         wait for tLINE_period*17;
         HREF <= '1';
         for i in 1 to 480 loop
            for c in 1 to 640 loop
               if(cnt = 0) then
                  cnt := 1;
                  DATA <= "00001100";
               elsif(cnt = 1) then
                  cnt := 2;
                  DATA <= "11111111";
               elsif(cnt = 2) then
                  cnt := 3;
                  DATA <= "00001111";
               elsif(cnt = 3) then
                  cnt := 4;
                  DATA <= "11111111";
               elsif(cnt = 4) then
                  cnt := 5;
                  DATA <= "00001010";
               elsif(cnt = 5) then
                  cnt := 6;
                  DATA <= "00001111";
               elsif(cnt = 6) then
                  cnt := 7;
                  DATA <= "11111111";
               elsif(cnt = 7) then
                  cnt := 0;
                  DATA <= "10101010";
               end if;
               PCLK <= '0';
               wait for PCLK_period/2;
               PCLK <= '1';
               wait for PCLK_period/2;
            end loop;
            HREF <= '0';
            wait for PCLK_period*144;
            HREF <= '1';
         end loop;
         wait for tLINE_period*10;
         VSYNC <= '1';
      end loop;
   END PROCESS tb;

END;
