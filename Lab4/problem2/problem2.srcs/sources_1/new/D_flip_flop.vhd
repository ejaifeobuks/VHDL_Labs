----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/03/2025 03:08:37 PM
-- Design Name: 
-- Module Name: D_flip_flop - Behavioral
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

entity D_flip_flop is
--  Port ( );
    port (D, clk, reset: in std_logic;
          Q, Qnot : out std_logic);
end D_flip_flop;

architecture Behavioral of D_flip_flop is
    signal q_int: std_logic;
begin
    process (reset,clk)
        begin
          q_int <= '0';
          if reset = '1' then
            q_int<= '0';
          elsif rising_edge(clk)then
                q_int<= D;
           end if;
           end process;
    Q<=q_int;
    Qnot <= not q_int;   
end Behavioral;
