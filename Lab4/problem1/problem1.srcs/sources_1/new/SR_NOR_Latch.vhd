----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/03/2025 01:36:19 PM
-- Design Name: 
-- Module Name: SR_NOR_Latch - Behavioral
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

entity SR_NOR_Latch is
--  Port ( );
    port (S, R : in std_logic;
          Q, QN : out std_logic);
end SR_NOR_Latch;

architecture structural of SR_NOR_Latch is
    component nor_gate is
        port (A : in std_logic;
          B : in std_logic ;
          C: out std_logic);
end component;
    signal q_int,qn_int : std_logic;
begin 
    U1 : nor_gate port map ( A => S,
                             B => q_int,
                             C => qn_int);
                             
    U2 : nor_gate port map ( A => R,
                             B => qn_int,
                             C => q_int);
     Q<=  q_int;
     QN <= qn_int;
                           

end structural;
