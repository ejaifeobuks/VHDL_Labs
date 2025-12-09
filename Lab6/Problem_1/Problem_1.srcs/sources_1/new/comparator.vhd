----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/01/2025 02:02:12 PM
-- Design Name: 
-- Module Name: comparator - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity comparator is
--  Port ( );
  port ( A,B : in std_logic_vector(5 downto 0);
         A_GT_B, A_EQ_B, A_LT_B : out std_logic);
end comparator;

architecture Behavioral of comparator is

begin

 process (A, B)
    begin
        A_GT_B <= '0';
        A_LT_B <= '0';
        A_EQ_B <= '0';
     if unsigned(A)>unsigned(B) then
            A_GT_B <= '1';
     elsif unsigned(A)< unsigned (B) then
            A_LT_B <= '1';
      else 
            A_EQ_B <= '1';
      end if;
      end process;
end Behavioral;
