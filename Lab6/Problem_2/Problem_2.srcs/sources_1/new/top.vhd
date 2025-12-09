----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/01/2025 07:52:09 PM
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity four_bit_adder is
--  Port ( );
  port (A, B : in std_logic_vector(3 downto 0);
        SUM   : out std_logic_vector(3 downto 0);
        C_out: out std_logic;
        D, AN : out std_logic_vector(7 downto 0));   
end four_bit_adder;

architecture structural of four_bit_adder is
 component half_adder is
       port (a, b : in std_logic;
         C_out, sum : out std_logic);
end component;

component full_adder is
    port (a : in std_logic;  
          b : in std_logic ;
          carry : in std_logic ;
          S : out std_logic;
          c_out : out std_logic);

end component;

component seg_dec is
--  Port ( );
    port( B : in std_logic_vector(3 downto 0);
          Anode : out std_logic_vector(7 downto 0);
          A : out std_logic_vector(7 downto 0));
end component;
signal S: std_logic_vector(3 downto 0);
signal C0,C1,C2,C3 : std_logic;
begin

B0: half_adder port map ( a=> A(0),
                          b => B(0),
                          c_out => C0,
                          sum => S(0));
B1: full_adder port map ( a=> A(1),
                          b => B(1),
                          carry => C0,
                          S => S(1),                      
                          c_out=> C1);
B2: full_adder port map ( a=> A(2),
                          b => B(2),
                          carry => C1,
                          S => S(2),                      
                          c_out=> C2);
                          
B3: full_adder port map ( a=> A(3),
                          b => B(3),
                          carry => C2,
                          S => S(3),                      
                          c_out=> C_out);
display : seg_dec port map (B => S,
                            Anode => AN,
                            A=> D);
SUM <= S;
                            
end structural;
