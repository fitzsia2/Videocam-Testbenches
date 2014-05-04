--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:27:24 03/25/2014
-- Design Name:   
-- Module Name:   F:/Professional/Projects/VideoCam/TestBenches/CrcLoader_tb.vhd
-- Project Name:  VideoCam
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CrcLoader
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
 
ENTITY CrcLoader_tb IS
END CrcLoader_tb;
 
ARCHITECTURE behavior OF CrcLoader_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
   COMPONENT CrcLoader
      GENERIC(
         UDP_PAYLOAD_SIZE : INTEGER := 800
         );
      PORT(
         CLK_IN : IN STD_LOGIC; -- 25MHz
         COUNT_IN : IN INTEGER;
         TXD : OUT STD_LOGIC_VECTOR(7 downto 0) := (others => 'Z');
         LOAD_INIT_OUT : OUT STD_LOGIC := '0';
         CALC_OUT : OUT STD_LOGIC := '0';
         D_VALID_OUT : OUT STD_LOGIC := '0';
         RCLK_OUT : OUT STD_LOGIC := '0'; -- Initiates a read from memory
         RADDR_OUT : OUT STD_LOGIC_VECTOR(25 downto 0) := (others => '0'); -- Address to read from memory
         DATA_IN : IN STD_LOGIC_VECTOR(63 downto 0); -- Data from memory
         DCLK_IN : IN STD_LOGIC -- Indicates valid data on PDATA_IN
      );
   END COMPONENT;
    

   --Inputs
   signal CLK_IN_EXT : std_logic := '0';
   signal COUNT_IN_EXT : INTEGER := 0;
   signal DATA_IN_EXT : std_logic_vector(63 downto 0) := (others => '0');
   signal DCLK_IN_EXT : std_logic := '0';

 	--Outputs
   signal TXD_EXT : std_logic_vector(7 downto 0);
   signal RCLK_OUT_EXT : std_logic;
   signal RADDR_OUT_EXT : std_logic_vector(25 downto 0);

   -- Clock period definitions
   constant CLK_IN_period : time := 10 ns;
   constant COUNT_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CrcLoader PORT MAP (
          CLK_IN => CLK_IN_EXT,
          COUNT_IN => COUNT_IN_EXT,
          TXD => TXD_EXT,
          RCLK_OUT => RCLK_OUT_EXT,
          RADDR_OUT => RADDR_OUT_EXT,
          DATA_IN => DATA_IN_EXT,
          DCLK_IN => DCLK_IN_EXT
        );

   -- Clock process definitions
   CLK_IN_process :process
   begin
		CLK_IN_EXT <= '0';
		wait for CLK_IN_period/2;
		CLK_IN_EXT <= '1';
		wait for CLK_IN_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin
      wait for 100 ns; -- hold reset state for 100 ns.
      
      while TRUE loop
         COUNT_IN_EXT <= COUNT_IN_EXT + 1;
         wait for COUNT_period;
      END LOOP;
   end process;
 

   -- Stimulus process
   data_proc: process
   begin
      wait for 300 ns;
      while true loop
         
         DATA_IN_EXT( (7) downto 0 ) <= X"12";
         DATA_IN_EXT( (15) downto 8 ) <= X"34";
         DATA_IN_EXT( (23) downto 16 ) <= X"56";
         DATA_IN_EXT( (31) downto 24 ) <= X"78";
         DATA_IN_EXT( (39) downto 32 ) <= X"9A";
         DATA_IN_EXT( (47) downto 40 ) <= X"BC";
         DATA_IN_EXT( (55) downto 48 ) <= X"DE";
         DATA_IN_EXT( (63) downto 56 ) <= X"F0";
         
         DCLK_IN_EXT <= '1';
         wait for 10 ns;
         DCLK_IN_EXT <= '0';
         wait for 310 ns;
      end loop;
   end process;

END;
