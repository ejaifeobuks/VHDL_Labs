----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/05/2025 06:16:24 PM
-- Design Name: 
-- Module Name: comparator_testbench - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity comparator_testbench is
--  Port ( );
end comparator_testbench;

architecture Behavioral of comparator_testbench is
component comparator is  
    port ( A,B : in std_logic_vector(5 downto 0);
         A_GT_B, A_EQ_B, A_LT_B : out std_logic);
end component;

signal A, B: std_logic_vector(5 downto 0);
signal A_GT_B, A_EQ_B, A_LT_B: std_logic;

begin
UUT: comparator port map ( A=> A,
                           B => B,
                           A_GT_B=> A_GT_B,
                           A_EQ_B=> A_EQ_B,
                           A_LT_B=> A_LT_B);
    process
     begin
      A<="101110";
      B <= "101110";
      wait for 10ns;
      A<= "100100";
      wait for 10ns;
      B<="011001";
      wait for 10ns;
      A <= "000000";
      B <= "111111";
     wait for 10 ns;
       A <= "111111";
        B <= "000000";
      wait for 10 ns;
        A <= "010101";
        B <= "010101";
wait for 10 ns;

      wait;
      end process;
end Behavioral;
