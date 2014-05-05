--------------------------------------------------------------------------------
--   
-- 
-- VHDL Test Bench Created by ISE for module: CRC
-- 
-- Sequence copied from iSim waveform used for CRC generation at http://www.zorc.breitbandkatze.de/crc.html
-- %00%1d%92%f3%31%53%a3%1c%6d%df%b6%b6%08%00%45%00%00%34%00%00%40%00%ff%11%00%00%c0%a8%89%78%c0%a8%89%01%0a%0a%0c%00%00%20%00%00%12%34%56%78%9a%bc%de%f0%12%34%56%78%9a%bc%de%f0%12%34%56%78%9a%bc%de%f0
--           ETHERNET FRAME                 |                        IP HEADER                          |      UDP HEADER       |                                 UDP DATA                              |
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY CRCGenerator_TESTBENCH IS
END CRCGenerator_TESTBENCH;
 
ARCHITECTURE behavior OF CRCGenerator_TESTBENCH IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CRC
    PORT(
         CLOCK : IN  std_logic;
         RESET : IN  std_logic;
         DATA : IN  std_logic_vector(7 downto 0);
         LOAD_INIT : IN  std_logic;
         CALC : IN  std_logic;
         D_VALID : IN  std_logic;
         CRC : OUT  std_logic_vector(7 downto 0);
         CRC_REG : OUT  std_logic_vector(31 downto 0);
         CRC_VALID : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLOCK : std_logic := '0';
   signal RESET : std_logic := '0';
   signal DATA : std_logic_vector(7 downto 0) := (others => '0');
   signal LOAD_INIT : std_logic := '0';
   signal CALC : std_logic := '0';
   signal D_VALID : std_logic := '0';

 	--Outputs
   signal CRC_O : std_logic_vector(7 downto 0);
   signal CRC_REG : std_logic_vector(31 downto 0);
   signal CRC_VALID : std_logic;

   -- Clock period definitions
   constant CLOCK_period : time := 1 ns;
 
----------------------------------------
-- Definitions
----------------------------------------
-- Ethernet Header Offsets

CONSTANT ETHERNETCOUNT3 : INTEGER := 1;
CONSTANT ETHERNETCOUNT4 : INTEGER := ETHERNETCOUNT3 + 1;
CONSTANT ETHERNETCOUNT5 : INTEGER := ETHERNETCOUNT4 + 1;
CONSTANT ETHERNETCOUNT6 : INTEGER := ETHERNETCOUNT5 + 1;
CONSTANT ETHERNETCOUNT7 : INTEGER := ETHERNETCOUNT6 + 1;
CONSTANT ETHERNETCOUNT8 : INTEGER := ETHERNETCOUNT7 + 1;
CONSTANT ETHERNETCOUNT9 : INTEGER := ETHERNETCOUNT8 + 1;
CONSTANT ETHERNETCOUNT10 : INTEGER := ETHERNETCOUNT9 + 1;
CONSTANT ETHERNETCOUNT11 : INTEGER := ETHERNETCOUNT10 + 1;
CONSTANT ETHERNETCOUNT12 : INTEGER := ETHERNETCOUNT11 + 1;
CONSTANT ETHERNETCOUNT13 : INTEGER := ETHERNETCOUNT12 + 1;
CONSTANT ETHERNETCOUNT14 : INTEGER := ETHERNETCOUNT13 + 1;
CONSTANT ETHERNETCOUNT15 : INTEGER := ETHERNETCOUNT14 + 1;
CONSTANT ETHERNETCOUNT16 : INTEGER := ETHERNETCOUNT15 + 1;
CONSTANT ETHERNETCOUNT17 : INTEGER := ETHERNETCOUNT16 + 1;
CONSTANT ETHERNETCOUNT18 : INTEGER := ETHERNETCOUNT17 + 1;
CONSTANT ETHERNETCOUNT19 : INTEGER := ETHERNETCOUNT18 + 1;
CONSTANT ETHERNETCOUNT20 : INTEGER := ETHERNETCOUNT19 + 1;
CONSTANT ETHERNETCOUNT21 : INTEGER := ETHERNETCOUNT20 + 1;
CONSTANT ETHERNETCOUNT22 : INTEGER := ETHERNETCOUNT21 + 1;
CONSTANT ETHERNETCOUNT23 : INTEGER := ETHERNETCOUNT22 + 1;
CONSTANT ETHERNETCOUNT24 : INTEGER := ETHERNETCOUNT23 + 1;
CONSTANT ETHERNETCOUNT25 : INTEGER := ETHERNETCOUNT24 + 1;
CONSTANT ETHERNETCOUNT26 : INTEGER := ETHERNETCOUNT25 + 1;
CONSTANT ETHERNETCOUNT27 : INTEGER := ETHERNETCOUNT26 + 1;
CONSTANT ETHERNETCOUNT28 : INTEGER := ETHERNETCOUNT27 + 1;
CONSTANT ETHERNETCOUNT29 : INTEGER := ETHERNETCOUNT28 + 1;
CONSTANT ETHERNETCOUNT30 : INTEGER := ETHERNETCOUNT29 + 1;
CONSTANT ETHERNETCOUNT31 : INTEGER := ETHERNETCOUNT30 + 1;
CONSTANT ETHERNETCOUNT32 : INTEGER := ETHERNETCOUNT31 + 1;
CONSTANT ETHERNETCOUNT33 : INTEGER := ETHERNETCOUNT32 + 1;
CONSTANT ETHERNETCOUNT34 : INTEGER := ETHERNETCOUNT33 + 1;
CONSTANT ETHERNETCOUNT35 : INTEGER := ETHERNETCOUNT34 + 1;
CONSTANT ETHERNETCOUNT36 : INTEGER := ETHERNETCOUNT35 + 1;
CONSTANT ETHERNETCOUNT37 : INTEGER := ETHERNETCOUNT36 + 1;
CONSTANT ETHERNETCOUNT38 : INTEGER := ETHERNETCOUNT37 + 1;
CONSTANT ETHERNETCOUNT39 : INTEGER := ETHERNETCOUNT38 + 1;
CONSTANT ETHERNETCOUNT40 : INTEGER := ETHERNETCOUNT39 + 1;
CONSTANT ETHERNETCOUNT41 : INTEGER := ETHERNETCOUNT40 + 1;
CONSTANT ETHERNETCOUNT42 : INTEGER := ETHERNETCOUNT41 + 1;
CONSTANT ETHERNETCOUNT43 : INTEGER := ETHERNETCOUNT42 + 1;
CONSTANT ETHERNETCOUNT44 : INTEGER := ETHERNETCOUNT43 + 1;
CONSTANT ETHERNETCOUNT45 : INTEGER := ETHERNETCOUNT44 + 1;
CONSTANT ETHERNETCOUNT46 : INTEGER := ETHERNETCOUNT45 + 1;
CONSTANT ETHERNETCOUNT47 : INTEGER := ETHERNETCOUNT46 + 1;
CONSTANT ETHERNETCOUNT48 : INTEGER := ETHERNETCOUNT47 + 1;
CONSTANT ETHERNETCOUNT49 : INTEGER := ETHERNETCOUNT48 + 1;
CONSTANT ETHERNETCOUNT50 : INTEGER := ETHERNETCOUNT49 + 1;
CONSTANT ETHERNETCOUNT51 : INTEGER := ETHERNETCOUNT50 + 1;
CONSTANT ETHERNETCOUNT52 : INTEGER := ETHERNETCOUNT51 + 1;
CONSTANT ETHERNETCOUNT53 : INTEGER := ETHERNETCOUNT52 + 1;
CONSTANT ETHERNETCOUNT54 : INTEGER := ETHERNETCOUNT53 + 1;
CONSTANT ETHERNETCOUNT55 : INTEGER := ETHERNETCOUNT54 + 1;
CONSTANT ETHERNETCOUNT56 : INTEGER := ETHERNETCOUNT55 + 1;
CONSTANT ETHERNETCOUNT57 : INTEGER := ETHERNETCOUNT56 + 1;
CONSTANT ETHERNETCOUNT58 : INTEGER := ETHERNETCOUNT57 + 1;
CONSTANT ETHERNETCOUNT59 : INTEGER := ETHERNETCOUNT58 + 1;
CONSTANT ETHERNETCOUNT60 : INTEGER := ETHERNETCOUNT59 + 1;
CONSTANT ETHERNETCOUNT61 : INTEGER := ETHERNETCOUNT60 + 1;
CONSTANT ETHERNETCOUNT62 : INTEGER := ETHERNETCOUNT61 + 1;
CONSTANT ETHERNETCOUNT63 : INTEGER := ETHERNETCOUNT62 + 1;
CONSTANT ETHERNETCOUNT64 : INTEGER := ETHERNETCOUNT63 + 1;
CONSTANT ETHERNETCOUNT65 : INTEGER := ETHERNETCOUNT64 + 1;
CONSTANT ETHERNETCOUNT66 : INTEGER := ETHERNETCOUNT65 + 1;
CONSTANT ETHERNETCOUNT67 : INTEGER := ETHERNETCOUNT66 + 1;
CONSTANT ETHERNETCOUNT68 : INTEGER := ETHERNETCOUNT67 + 1;
CONSTANT ETHERNETCOUNT69 : INTEGER := ETHERNETCOUNT68 + 1;

-- Nibble Count (14Bytes of ethernet header)
-- ----------------------------------------------------------------------------------------
-- -  7bytes    - 1Byte -   6bytes   -  6bytes   - 2bytes -           - 4bytes -   12bytes
-- -  Preamble  -  SFD  -  DestAddr  -  SrcAddr  -  Type  -  PayLoad  -  CRC   -  FrameGap
-- ----------------------------------------------------------------------------------------
-- |            |       |            |           |        |           |        |
-- |0           |14   15|          27|         39|      43|         51|    9015|

   -- IPv4 Header Offsets

   -- 20Bytes
   -- 0  |0____.____|1____.____|2____.____|3____.____|
   -- 4  | Ver |Leng|Serv Type |     Total Length    |
   -- 8  |    Identification   |Flags|Fragment Offset|
   -- 12 |    TTL   | Protocol | Header Checksum     |
   -- 16 |             Source Address                |
   -- 20 |            Destination Address            |

      -- UDP Header Offsets
      -- 8Bytes
      -- 0  |0____.____|1____.____|2____.____|3____.____|
      -- 4  |    Source Address   | Destination Address |
      -- 8  |        Length       |       Checksum      |
      -- (24Byes of data)
      
-- 

----------------------------------------
-- Ethernet frame constructors
----------------------------------------
-- Ethernet Header Constants
CONSTANT ETHPREAMBLE : STD_LOGIC_VECTOR := "1010";
CONSTANT SFD1 : STD_LOGIC_VECTOR := X"AA";
CONSTANT SFD2 : STD_LOGIC_VECTOR := X"AB";
CONSTANT MAC_DESTADDR1 : STD_LOGIC_VECTOR := X"00"; -- 00-1d-92-f3-31-53
CONSTANT MAC_DESTADDR2 : STD_LOGIC_VECTOR := X"1D";
CONSTANT MAC_DESTADDR3 : STD_LOGIC_VECTOR := X"92";
CONSTANT MAC_DESTADDR4 : STD_LOGIC_VECTOR := X"F3";
CONSTANT MAC_DESTADDR5 : STD_LOGIC_VECTOR := X"31";
CONSTANT MAC_DESTADDR6 : STD_LOGIC_VECTOR := X"53";
CONSTANT MAC_SRCADDR1 : STD_LOGIC_VECTOR := X"A3";  -- A3-1C-6D-DF-B6-B6
CONSTANT MAC_SRCADDR2 : STD_LOGIC_VECTOR := X"1C";
CONSTANT MAC_SRCADDR3 : STD_LOGIC_VECTOR := X"6D";
CONSTANT MAC_SRCADDR4 : STD_LOGIC_VECTOR := X"DF";
CONSTANT MAC_SRCADDR5 : STD_LOGIC_VECTOR := X"B6";
CONSTANT MAC_SRCADDR6 : STD_LOGIC_VECTOR := X"B6";
CONSTANT ETHERTYPE1 : STD_LOGIC_VECTOR := X"08"; -- 0
CONSTANT ETHERTYPE2 : STD_LOGIC_VECTOR := X"00"; -- 8

-- IPv4 Header Constants
CONSTANT IP_VER_IHL : STD_LOGIC_VECTOR := X"45";
CONSTANT IP_SRVTP1 : STD_LOGIC_VECTOR := X"00";
CONSTANT IP_LENG1 : STD_LOGIC_VECTOR := X"00"; -- = (20 Byte IP header) + (8 Byte UDP header) + (24 Byte UDP payload) = 52
CONSTANT IP_LENG2 : STD_LOGIC_VECTOR := X"34";
CONSTANT IP_ID1 : STD_LOGIC_VECTOR := X"00";
CONSTANT IP_ID2 : STD_LOGIC_VECTOR := X"00";
CONSTANT IP_FLAGS_OFFSET1 : STD_LOGIC_VECTOR := X"40";
CONSTANT IP_OFFSET2 : STD_LOGIC_VECTOR := X"00";
CONSTANT IP_TTL1 : STD_LOGIC_VECTOR := X"FF";
CONSTANT IP_PROTOCOL1 : STD_LOGIC_VECTOR := X"11"; -- UDP Protocol ID
CONSTANT IP_HDCHKSUM1 : STD_LOGIC_VECTOR := X"00";
CONSTANT IP_HDCHKSUM2 : STD_LOGIC_VECTOR := X"00";
CONSTANT IP_SRCIP1 : STD_LOGIC_VECTOR := X"C0"; -- IP source is 192.168.137.120
CONSTANT IP_SRCIP2 : STD_LOGIC_VECTOR := X"A8";
CONSTANT IP_SRCIP3 : STD_LOGIC_VECTOR := X"89"; -- .168
CONSTANT IP_SRCIP4 : STD_LOGIC_VECTOR := X"78";
CONSTANT IP_DSTIP1 : STD_LOGIC_VECTOR := X"C0"; -- IP destination is 192
CONSTANT IP_DSTIP2 : STD_LOGIC_VECTOR := X"A8";
CONSTANT IP_DSTIP3 : STD_LOGIC_VECTOR := X"89"; -- .168
CONSTANT IP_DSTIP4 : STD_LOGIC_VECTOR := X"01";

-- UDP Header Constants
CONSTANT UDP_SRCADR1 : STD_LOGIC_VECTOR := X"0A"; -- Least significant nibble
CONSTANT UDP_SRCADR2 : STD_LOGIC_VECTOR := X"0A";
CONSTANT UDP_DSTADR1 : STD_LOGIC_VECTOR := X"0C";
CONSTANT UDP_DSTADR2 : STD_LOGIC_VECTOR := X"00";
CONSTANT UDP_LENG1 : STD_LOGIC_VECTOR := X"00"; -- 24 Byte payload
CONSTANT UDP_LENG2 : STD_LOGIC_VECTOR := X"20";
CONSTANT UDP_CHKSUM1 : STD_LOGIC_VECTOR := X"00"; -- 
CONSTANT UDP_CHKSUM2 : STD_LOGIC_VECTOR := X"00";
CONSTANT UDP_DATA_N1 : STD_LOGIC_VECTOR := X"12";
CONSTANT UDP_DATA_N2 : STD_LOGIC_VECTOR := X"34";
CONSTANT UDP_DATA_N3 : STD_LOGIC_VECTOR := X"56";
CONSTANT UDP_DATA_N4 : STD_LOGIC_VECTOR := X"78";
CONSTANT UDP_DATA_N5 : STD_LOGIC_VECTOR := X"9A";
CONSTANT UDP_DATA_N6 : STD_LOGIC_VECTOR := X"BC";
CONSTANT UDP_DATA_N7 : STD_LOGIC_VECTOR := X"DE";
CONSTANT UDP_DATA_N8 : STD_LOGIC_VECTOR := X"F0";
CONSTANT UDP_CHKSUM : STD_LOGIC_VECTOR := "0000"; -- 0

CONSTANT END_OF_TX1 : STD_LOGIC_VECTOR := "01101";
CONSTANT END_OF_TX2 : STD_LOGIC_VECTOR := "00111";
   
--------------------------------------------------------------------------------
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CRC PORT MAP (
          CLOCK => CLOCK,
          RESET => RESET,
          DATA => DATA,
          LOAD_INIT => LOAD_INIT,
          CALC => CALC,
          D_VALID => D_VALID,
          CRC => CRC_O,
          CRC_REG => CRC_REG,
          CRC_VALID => CRC_VALID
        );

   -- Clock process definitions
   CLOCK_process :process
   CONSTANT STARTOFCOUNTER : INTEGER := 0;
   CONSTANT ENDOFCOUNTER : INTEGER := (120);
   variable EthCounter :INTEGER := 0;
   begin
      CLOCK <= '0';
      wait for CLOCK_period/2;
      CLOCK <= '1';
      wait for CLOCK_period/2;
      CLOCK <= '0';
      wait for CLOCK_period/2;
      CLOCK <= '1';
      while true loop
		wait for CLOCK_period/2;
         CLOCK <= '0';
         
--         if(EthCounter <= ETHERNETCOUNT1) then DATA <= SFD1;
--         elsif(EthCounter = ETHERNETCOUNT2) then DATA <= SFD2;
         if(EthCounter = ETHERNETCOUNT3) then DATA <= MAC_DESTADDR1;
         elsif(EthCounter = ETHERNETCOUNT4) then DATA <= MAC_DESTADDR2;
         elsif(EthCounter = ETHERNETCOUNT5) then DATA <= MAC_DESTADDR3;
         elsif(EthCounter = ETHERNETCOUNT6) then DATA <= MAC_DESTADDR4;
         elsif(EthCounter = ETHERNETCOUNT7) then DATA <= MAC_DESTADDR5;
         elsif(EthCounter = ETHERNETCOUNT8) then DATA <= MAC_DESTADDR6;
         elsif(EthCounter = ETHERNETCOUNT9) then DATA <= MAC_SRCADDR1;
         elsif(EthCounter = ETHERNETCOUNT10) then DATA <= MAC_SRCADDR2;
         elsif(EthCounter = ETHERNETCOUNT11) then DATA <= MAC_SRCADDR3;
         elsif(EthCounter = ETHERNETCOUNT12) then DATA <= MAC_SRCADDR4;
         elsif(EthCounter = ETHERNETCOUNT13) then DATA <= MAC_SRCADDR5;
         elsif(EthCounter = ETHERNETCOUNT14) then DATA <= MAC_SRCADDR6;
         elsif(EthCounter = ETHERNETCOUNT15) then DATA <= ETHERTYPE1;
         elsif(EthCounter = ETHERNETCOUNT16) then DATA <= ETHERTYPE2;
         elsif(EthCounter = ETHERNETCOUNT17) then DATA <= IP_VER_IHL;
         elsif(EthCounter = ETHERNETCOUNT18) then DATA <= IP_SRVTP1;
         elsif(EthCounter = ETHERNETCOUNT19) then DATA <= IP_LENG1;
         elsif(EthCounter = ETHERNETCOUNT20) then DATA <= IP_LENG2;
         elsif(EthCounter = ETHERNETCOUNT21) then DATA <= IP_ID1;
         elsif(EthCounter = ETHERNETCOUNT22) then DATA <= IP_ID2;
         elsif(EthCounter = ETHERNETCOUNT23) then DATA <= IP_FLAGS_OFFSET1;
         elsif(EthCounter = ETHERNETCOUNT24) then DATA <= IP_OFFSET2;
         elsif(EthCounter = ETHERNETCOUNT25) then DATA <= IP_TTL1;
         elsif(EthCounter = ETHERNETCOUNT26) then DATA <= IP_PROTOCOL1;
         elsif(EthCounter = ETHERNETCOUNT27) then DATA <= IP_HDCHKSUM1;
         elsif(EthCounter = ETHERNETCOUNT28) then DATA <= IP_HDCHKSUM2;
         elsif(EthCounter = ETHERNETCOUNT29) then DATA <= IP_SRCIP1;
         elsif(EthCounter = ETHERNETCOUNT30) then DATA <= IP_SRCIP2;
         elsif(EthCounter = ETHERNETCOUNT31) then DATA <= IP_SRCIP3;
         elsif(EthCounter = ETHERNETCOUNT32) then DATA <= IP_SRCIP4;
         elsif(EthCounter = ETHERNETCOUNT33) then DATA <= IP_DSTIP1;
         elsif(EthCounter = ETHERNETCOUNT34) then DATA <= IP_DSTIP2;
         elsif(EthCounter = ETHERNETCOUNT35) then DATA <= IP_DSTIP3;
         elsif(EthCounter = ETHERNETCOUNT36) then DATA <= IP_DSTIP4;
         elsif(EthCounter = ETHERNETCOUNT37) then DATA <= UDP_SRCADR1;
         elsif(EthCounter = ETHERNETCOUNT38) then DATA <= UDP_SRCADR2;
         elsif(EthCounter = ETHERNETCOUNT39) then DATA <= UDP_DSTADR1;
         elsif(EthCounter = ETHERNETCOUNT40) then DATA <= UDP_DSTADR2;
         elsif(EthCounter = ETHERNETCOUNT41) then DATA <= UDP_LENG1;
         elsif(EthCounter = ETHERNETCOUNT42) then DATA <= UDP_LENG2;
         elsif(EthCounter = ETHERNETCOUNT43) then DATA <= UDP_CHKSUM1;
         elsif(EthCounter = ETHERNETCOUNT44) then DATA <= UDP_CHKSUM2;
         elsif(EthCounter = ETHERNETCOUNT45) then DATA <= UDP_DATA_N1;
         elsif(EthCounter = ETHERNETCOUNT46) then DATA <= UDP_DATA_N2;
         elsif(EthCounter = ETHERNETCOUNT47) then DATA <= UDP_DATA_N3;
         elsif(EthCounter = ETHERNETCOUNT48) then DATA <= UDP_DATA_N4;
         elsif(EthCounter = ETHERNETCOUNT49) then DATA <= UDP_DATA_N5;
         elsif(EthCounter = ETHERNETCOUNT50) then DATA <= UDP_DATA_N6;
         elsif(EthCounter = ETHERNETCOUNT51) then DATA <= UDP_DATA_N7;
         elsif(EthCounter = ETHERNETCOUNT52) then DATA <= UDP_DATA_N8;
         elsif(EthCounter = ETHERNETCOUNT53) then DATA <= UDP_DATA_N1;
         elsif(EthCounter = ETHERNETCOUNT54) then DATA <= UDP_DATA_N2;
         elsif(EthCounter = ETHERNETCOUNT55) then DATA <= UDP_DATA_N3;
         elsif(EthCounter = ETHERNETCOUNT56) then DATA <= UDP_DATA_N4;
         elsif(EthCounter = ETHERNETCOUNT57) then DATA <= UDP_DATA_N5;
         elsif(EthCounter = ETHERNETCOUNT58) then DATA <= UDP_DATA_N6;
         elsif(EthCounter = ETHERNETCOUNT59) then DATA <= UDP_DATA_N7;
         elsif(EthCounter = ETHERNETCOUNT60) then DATA <= UDP_DATA_N8;
         elsif(EthCounter = ETHERNETCOUNT61) then DATA <= UDP_DATA_N1;
         elsif(EthCounter = ETHERNETCOUNT62) then DATA <= UDP_DATA_N2;
         elsif(EthCounter = ETHERNETCOUNT63) then DATA <= UDP_DATA_N3;
         elsif(EthCounter = ETHERNETCOUNT64) then DATA <= UDP_DATA_N4;
         elsif(EthCounter = ETHERNETCOUNT65) then DATA <= UDP_DATA_N5;
         elsif(EthCounter = ETHERNETCOUNT66) then DATA <= UDP_DATA_N6;
         elsif(EthCounter = ETHERNETCOUNT67) then DATA <= UDP_DATA_N7;
         elsif(EthCounter = ETHERNETCOUNT68) then DATA <= UDP_DATA_N8;
         elsif(Ethcounter = ETHERNETCOUNT69) then 
            DATA <= X"00";
         else
            DATA <= X"00";
         end if;
         
		wait for CLOCK_period/2;
		CLOCK <= '1';
         if(EthCounter = ENDOFCOUNTER) then
            EthCounter := STARTOFCOUNTER;
         else
            EthCounter := EthCounter + 1;
         end if;
      end loop;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin
      RESET <= '1';
      wait for CLOCK_period;
      RESET <= '0';
      wait for CLOCK_period/2;
      LOAD_INIT <= '1';
      wait for CLOCK_period;
      LOAD_INIT <= '0';
      
      wait for CLOCK_period/2;
      CALC <= '0';
      wait for CLOCK_period/2;
      CALC <= '1';
      D_VALID <= '1';
      
      wait for (65*2+1)*CLOCK_period/2;
      CALC <= '0';
      
      wait for CLOCK_period*4;
      D_VALID <= '0';
      
      wait for 485 ns;
      wait for CLOCK_period/2;
      LOAD_INIT <= '1';
      wait for CLOCK_period;
      LOAD_INIT <= '0';
      
      wait for CLOCK_period/2;
      CALC <= '0';
      wait for CLOCK_period/2;
      CALC <= '1';
      D_VALID <= '1';
      wait for 660 ns;
      CALC <= '0';
      
      wait for CLOCK_period*4;
      D_VALID <= '0';
      
      wait for CLOCK_period*4;
      wait;
   end process;

END;

-- 