----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/03/2025 02:23:17 PM
-- Design Name: 
-- Module Name: Test_mux - Behavioral
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

--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Test_mux is
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--  Port ( );
end Test_mux;

architecture Behavioral of Test_mux is
    component SR_NOR_Latch is
--  Port ( );
    port (S, R : in std_logic;
          Q, QN : out std_logic);
end component;
signal S, R , Q , QN : std_logic;
begin
    UUT: SR_NOR_Latch port map ( S=> S,
                                 R => R,
                                 Q => Q,
                                 QN => QN);
   process
    begin 
     S<='0';
     R<='0';
     wait for 100 ns;
     S <= '1';
     wait for 100 ns;
     S <= '0';
     wait for 100 ns;
     R <= '1';
     wait for 100 ns;
     R <= '0';
     wait for 100 ns;
      S<='1';
      R<='1';
      wait for 100 ns;
       S<='0';
       R<='0';
     wait for 100 ns;
      S<='1';
      R<='1';
    end process;
end Behavioral;
