----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/17/2025 02:26:46 PM
-- Design Name: 
-- Module Name: down_counter - Behavioral
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

entity down_counter is
--  Port ( );
   port( clk, rst: in std_logic;
         q : out std_logic_vector(1 downto 0));
   
end down_counter;

architecture Behavioral of down_counter is
 signal state : std_logic_vector(1 downto 0);
begin
process (clk, rst)
begin 
    if rst = '1' then
        state<= "11";
    elsif rising_edge(clk) then
        case state is
            when "00" => state<= "11";
            when "01" => state <= "00";
            when "10" => state<= "01";
            when "11" => state<= "10";
            when others => state<= "11";
        end case;
    end if;
end process;
q<=state;

 
end Behavioral;
