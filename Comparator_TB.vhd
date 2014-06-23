--------------------------------------------------------------------------------
library ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
--use ieee.numeric_std.ALL;

entity Comparator_TB is
   end Comparator_TB;

architecture behavior of Comparator_TB is 
   constant EQUALTO_c : std_logic_vector(5 downto 0) := "100101";
   constant LESSTHAN_c : std_logic_vector(5 downto 0) := "011100";
   constant GREATERTHAN_c : std_logic_vector(5 downto 0) := "010011";

   -- Component Declaration for the Unit Under Test (UUT)
   component Comparator
      port(
             A_in : in  std_logic_vector(7 downto 0);
             B_in : in  std_logic_vector(7 downto 0);
             EQ : out  std_logic;
             NEQ : out  std_logic;
             LT : out  std_logic;
             LTE : out  std_logic;
             GT : out  std_logic;
             GTE : out  std_logic
          );
   end component;


   --Inputs
   signal A_in : std_logic_vector(7 downto 0) := (others => '0');
   signal B_in : std_logic_vector(7 downto 0) := (others => '0');

   --Outputs
   signal EQ_t : std_logic := '0';
   signal NEQ_t : std_logic := '0';
   signal LT_t : std_logic := '0';
   signal LTE_t : std_logic := '0';
   signal GT_t : std_logic := '0';
   signal GTE_t : std_logic := '0';

   signal expected : std_logic_vector(5 downto 0);

-- No clocks detected in port list. Replace <clock> below with 
-- appropriate port name 

begin
   expected(5) <= EQ_t;
   expected(4) <= NEQ_t;
   expected(3) <= LT_t;
   expected(2) <= LTE_t;
   expected(1) <= GT_t;
   expected(0) <= GTE_t;

   -- Instantiate the Unit Under Test (UUT)
   uut: Comparator
   port map (
               A_in => A_in,
               B_in => B_in,
               EQ => EQ_t,
               NEQ => NEQ_t,
               LT => LT_t,
               LTE => LTE_t,
               GT => GT_t,
               GTE => GTE_t
            );

   -- Stimulus process
   stim_proc: process
   begin
      A_in <= (others => '0'); B_in <= (others => '0'); wait for 10 ns;
      assert expected = EQUALTO_c report "unexpected results on equal to" severity failure;
      wait for 10 ns;

      -- Set A less than B
      A_in <= (others => '1'); B_in <= (others => '0'); wait for 10 ns;
      assert true report "Expected: " & integer'image(conv_integer(EQUALTO_c)) severity note;
      assert true report "Received: " & integer'image(conv_integer(expected)) severity note;
      assert (expected = GREATERTHAN_c) report "unexpected results on greater than" severity failure;

      -- Set A greater than B
      A_in <= (others => '0'); B_in <= (others => '1'); wait for 10 ns;
      assert expected = LESSTHAN_c report "unexpected results on less than" severity failure;

      -- Set A equal to B
      A_in <= (others => '1'); B_in <= (others => '1'); wait for 10 ns;
      assert expected = EQUALTO_c report "unexpected results on equal to" severity failure;

      assert false report "end of test" severity failure;
   end process;

end;





