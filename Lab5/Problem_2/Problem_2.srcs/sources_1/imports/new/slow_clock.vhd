----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/03/2025 07:23:02 PM
-- Design Name: 
-- Module Name: slow_clock - Behavioral
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

entity SLOW_CLOCK is
--  Port ( );
    port ( clk, reset : in std_logic;
            clk_out : out std_logic );
end SLOW_CLOCK;

architecture Behavioral of SLOW_CLOCK is
    constant DIVISION_FACTOR : integer :=50000000;
    signal counter : unsigned(31 downto 0) := (others => '0');
    signal tmp_clock : std_logic :='0';
begin
    process(clk,reset)
     begin
        if reset='1' then
            counter <= (others => '0');
            tmp_clock<='0';
         elsif rising_edge(clk) then                    
            if counter = to_unsigned(DIVISION_FACTOR - 1, counter'length) then
                counter   <= (others => '0');
                tmp_clock<=not tmp_clock;
          else
            counter <= counter +1;
            end if;
         end if;
        end process;
  clk_out<=tmp_clock;
end Behavioral;
