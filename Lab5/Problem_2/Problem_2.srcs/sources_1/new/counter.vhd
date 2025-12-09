----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/01/2025 01:59:15 AM
-- Design Name: 
-- Module Name: Controller - Behavioral
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

entity counter is
--  Port ( );
    port(Cen: in std_logic;
         clk: in std_logic;
         rst : in std_logic;
         B: out std_logic_vector(3 downto 0));
end counter;

architecture Behavioral of counter is
signal count : unsigned(3 downto 0);
begin
process (clk, rst)
    begin
    if rst='1' then
     count <= (others => '0');
    elsif rising_edge(clk) then
        if Cen='1' then 
        count<=count+1;
        end if;
  end if;
  end process;
  
  B<=std_logic_vector(count);   

end Behavioral;
