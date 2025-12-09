----------------------------------------------------------------------------------
-- Company: Alabama A&M University
-- Engineer: Ogheneobukome Ejaife
-- 
-- Create Date: 10/20/2025 01:26:13 PM
-- Design Name: 
-- Module Name: SEQ_MUX - Behavioral
-- Project Name: 
-- Target Devices: Nexys A7 FPGA
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

entity SEQ_MUX is
--  Port ( );
    port( B : in std_logic_vector(3 downto 0);
          AN : out std_logic_vector(7 downto 0);
          A : out std_logic_vector(7 downto 0));
end SEQ_MUX;

architecture Behavioral of SEQ_MUX is
begin
    AN<="01111111";
    process(B)
        begin
            case B is
                when "0000" => A <= "00000011"; --0
                when "0001" => A <= "10011111"; --1
                when "0010" => A <= "00100101"; -- 2
                when "0011" => A <= "00001101"; -- 3
                when "0100" => A <= "10011001";-- 4
                when "0101" => A <= "01001001";-- 5
                when "0110" => A <= "01000001";-- 6
                when "0111" => A <= "00011111";-- 7
                when "1000" => A <= "00000001";-- 8
                when "1001" => A <= "00001001";-- 9
                when "1010" => A <= "00010001";-- A
                when "1011" => A <= "11000001";-- B
                when "1100"=> A <=  "01100011";-- C
                when "1101" => A <= "10000101";-- D
                when "1110" => A <= "01100001";-- E
                when "1111" => A <= "01110001";-- F
             end case;
             end process;
end Behavioral;
