----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/13/2025 02:09:27 PM
-- Design Name: 
-- Module Name: Bi_gray - Behavioral
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

entity Bi_gray is
--  Port ( );
    Port( A : in std_logic_vector(11 downto 0);
          B: out std_logic_vector(11 downto 0));
end Bi_gray;

architecture Behavioral of Bi_gray is

begin
    process(A)
    begin
        B <= (11=> A(11), others=>'0');
        for I in 10 downto 0 loop
          B(I)<= A(I) xor A(I+1);
        end loop;
     end process;
end Behavioral;
