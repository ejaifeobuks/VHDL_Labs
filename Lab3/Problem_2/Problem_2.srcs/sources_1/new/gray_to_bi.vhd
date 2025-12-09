----------------------------------------------------------------------------------
-- Company: Alabama A&M University
-- Engineer: Ogheneobukome Ejaife
-- 
-- Create Date: 10/20/2025 12:13:33 AM
-- Design Name: 
-- Module Name: gray_to_bi - Behavioral
-- Project Name: 
-- Target Devices: Nexys A7 Board
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

entity gray_to_bi is
--  Port ( );
    port ( A : in std_logic_vector(11 downto 0);
           B : out std_logic_vector(11 downto 0));
end gray_to_bi;   

architecture Behavioral of gray_to_bi is
begin
process(A)      
  variable temp: std_logic_vector(11 downto 0);
  begin
        temp(11) := A(11);
        for i in 10 downto 0 loop
            temp(i):= temp(i+1) xor A(i);
        end loop;
        B<=temp;
        end process;
end Behavioral;
