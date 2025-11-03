----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/01/2025 09:17:53 PM
-- Design Name: 
-- Module Name: top - Behavioral
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
-- any Xilinx leaf cells in this code.-
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
--  Port ( );
    port ( a , b,c, d : in std_logic ;
           S_0,S_1,S_2,C_2 : out std_logic );
end top;

architecture Behavioral of top is
    component full_add is    
     port (a : in std_logic;  
          b : in std_logic ;
          c : in std_logic ;
          S : out std_logic;
          c_out : out std_logic);

end component;

signal p ,q ,r ,s , C_0, C_1: std_logic;
begin
    process (a,b,c,d )
      begin 
        q <= b and d;
        p <= a and d;  
        s <= b and c ;
        r <= a and c;
    end process;
    U1: full_add port map ( a => q,
                            b => '0',
                            c => '0',
                            S =>  S_0,
                            c_out => C_0);
    U2: full_add port map( a => p,
                            b => s,
                            c => C_0,
                            S =>  S_1,
                            c_out => C_1);
   U3: full_add port map( a => '0',
                            b => r,
                            c => C_1,
                            S =>  S_2,
                            c_out => C_2);
             
    
end Behavioral;
