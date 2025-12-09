----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/05/2025 07:27:01 PM
-- Design Name: 
-- Module Name: RCA_Testbench - Behavioral
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

entity RCA_Testbench is
--  Port ( );
end RCA_Testbench;

architecture Behavioral of RCA_Testbench is
component four_bit_adder is
--  Port ( );
  port (A, B : in std_logic_vector(3 downto 0);
        SUM  : out std_logic_vector(3 downto 0);
        C_out: out std_logic;
        D, AN : out std_logic_vector(7 downto 0));   
end component;
signal A, B : std_logic_vector(3 downto 0);
signal SUM  : std_logic_vector(3 downto 0);
signal C_out : std_logic;
signal D, AN :  std_logic_vector(7 downto 0);

 
begin
    UUT: four_bit_adder port map ( A=> A,
                                   B=> B,
                                   SUM => SUM,      
                                   C_out => C_out,
                                   D=>D,
                                   AN => AN);
process
begin
    -- Test 1: 0 + 0 = 0
    A <= "0000";
    B <= "0000";
    wait for 10 ns;

    -- Test 2: 3 + 2 = 5 (no carry)
    A <= "0011";
    B <= "0010";
    wait for 10 ns;

    -- Test 3: 1 + 1 = 2 (LSB carry)
    A <= "0001";
    B <= "0001";
    wait for 10 ns;

    -- Test 4: 7 + 1 = 8 (carry ripple)
    A <= "0111";
    B <= "0001";
    wait for 10 ns;

    -- Test 5: 15 + 1 = 0 with carry
    A <= "1111";
    B <= "0001";
    wait for 10 ns;

    -- Test 6: 15 + 15 = 30 (overflow)
    A <= "1111";
    B <= "1111";
    wait for 10 ns;

    -- Test 7: 10 + 5 = 15
    A <= "1010";
    B <= "0101";
    wait for 10 ns;

    wait;
end process;

end Behavioral;
