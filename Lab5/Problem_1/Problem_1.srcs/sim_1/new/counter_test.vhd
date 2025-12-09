----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/17/2025 02:55:51 PM
-- Design Name: 
-- Module Name: counter_test - Behavioral
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

entity counter_test is
--  Port ( );
end counter_test;

architecture Behavioral of counter_test is
    component down_counter is
          port( clk, rst: in std_logic;
         q : out std_logic_vector(1 downto 0)
         );
    end component;
    
   signal clk,rst : std_logic;
   signal q: std_logic_vector(1 downto 0);
begin
    UUT : down_counter port map( clk => clk,
                                rst => rst,
                                q => q);
clk_process : process
begin
while true loop
    clk <='0';
    wait for 5ns;
    clk<='1';
    wait for 5ns;
  end loop;
  end process;

reset_process: process
begin
 rst<='1';
    wait for 10ns;
    rst<='0';
    wait for 10ns;
    rst<='1';
    wait for 10ns;
     rst<='0';
    wait;
    end process;
end Behavioral;
