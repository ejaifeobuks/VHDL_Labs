----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/26/2025 02:55:54 AM
-- Design Name: 
-- Module Name: testbench - Behavioral
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

entity testbench is
--  Port ( );
end testbench;

architecture Behavioral of testbench is
component multiplier is
--  Port ( );
    port ( a , b,c, d : in std_logic ;
           S_0,S_1,S_2,C_2 : out std_logic );
end component;
    -- Signals to connect to DUT
    signal a   : std_logic;
    signal b   : std_logic;
    signal c   : std_logic;
    signal d   : std_logic;
    signal S_0 : std_logic;
    signal S_1 : std_logic;
    signal S_2 : std_logic;
    signal C_2 : std_logic;
begin
DUT: multiplier port map ( a   => a,
                           b   => b,
                           c   => c,
                           d   => d,
                           S_0 => S_0,
                           S_1 => S_1,
                           S_2 => S_2,
                           C_2 => C_2);
                           
process
 begin
 --Loop through all input combinations (0 to 15)
        for i in 0 to 15 loop
            a <= std_logic(to_unsigned(i,4)(3));
            b <= std_logic(to_unsigned(i,4)(2));
            c <= std_logic(to_unsigned(i,4)(1));
            d <= std_logic(to_unsigned(i,4)(0));

            wait for 10 ns;
        end loop;

        wait;
    end process;

end Behavioral;
