----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/04/2025 07:08:26 AM
-- Design Name: 
-- Module Name: shifter - Behavioral
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
entity shifter_12bit is
    Port (
        A         : in  std_logic_vector(11 downto 0);
        shift_amt : in  std_logic_vector(1 downto 0);  -- 0..3
        dir       : in  std_logic;                     -- 0 = left, 1 = right
        mode      : in  std_logic;                     -- 0 = shift, 1 = rotate
        Y         : out std_logic_vector(11 downto 0)
    );
end shifter_12bit;

architecture Behavioral of shifter_12bit is
begin
    process(A, shift_amt, dir, mode)
        variable temp : std_logic_vector(11 downto 0);
        variable s    : integer range 0 to 3;
    begin
        s := to_integer(unsigned(shift_amt));
        temp := A;

        if mode = '0' then
            -------------------------
            -- SHIFT MODE
            -------------------------
            if dir = '0' then
                -- SHIFT LEFT
                temp := std_logic_vector(shift_left(unsigned(A), s));
            else
                -- SHIFT RIGHT
                temp := std_logic_vector(shift_right(unsigned(A), s));
            end if;

        else
            -------------------------
            -- ROTATE MODE
            -------------------------
            if s = 0 then
                temp := A;
            else
                if dir = '0' then
                    -- ROTATE LEFT
                    temp := A(11-s downto 0) & A(11 downto 12-s);
                else
                    -- ROTATE RIGHT
                    temp := A(s-1 downto 0) & A(11 downto s);
                end if;
            end if;
        end if;

        Y <= temp;
    end process;
end Behavioral;

