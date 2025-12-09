----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/01/2025 09:53:03 AM
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

entity top is
--  Port ( );
    port ( CLK, rst : in std_logic;
            seg_out,AN : out std_logic_vector(7 downto 0));
end top;

architecture Behavioral of top is
component SLOW_CLOCK is
--  Port ( );
    port ( clk, reset : in std_logic;
            clk_out : out std_logic );
    end component;
    
 component counter is
--  Port ( );
    port( clk: in std_logic;
         rst : in std_logic;
         B: out std_logic_vector(3 downto 0));
end component;

component seg_disp is
--  Port ( );
    port( B : in std_logic_vector(3 downto 0);
          Anode : out std_logic_vector(7 downto 0);
          A : out std_logic_vector(7 downto 0));
 end component;
 signal B_in : std_logic_vector(3 downto 0);
 signal clk_out: std_logic;
begin
    final_clock: SLOW_CLOCK port map (clk => CLK,
                                       reset =>rst,
                                       clk_out=>clk_out);
                                       
   final_counter: counter port map ( clk=> clk_out,
                                     rst=>rst,
                                     B=> B_in);
   display : seg_disp port map (B => B_in,
                                A => seg_out,
                                Anode=>AN);

end Behavioral;
