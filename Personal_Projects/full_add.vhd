----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/01/2025 09:05:48 PM
-- Design Name: 
-- Module Name: full_add - Behavioral
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

entity full_add is
--  Port ( );
    port (a : in std_logic;  
          b : in std_logic ;
          c : in std_logic ;
          S : out std_logic;
          c_out : out std_logic);

end full_add;

architecture Behavioral of full_add is

begin 
   process (a,b,c)
   begin 
      S <= (a xor b) xor c; 
      c_out <=(a and b) or (c and (a xor b));
   end process;
end Behavioral;
