----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/04/2025 07:13:52 AM
-- Design Name: 
-- Module Name: ctrl_unit - Behavioral
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
entity ctrl_unit is
    Port (
        clk          : in  std_logic;
        btn_mode_raw : in  std_logic;  -- toggle shift/rotate
        btn_dir_raw  : in  std_logic;  -- toggle left/right
        mode         : out std_logic;
        dir          : out std_logic
    );
end ctrl_unit;

architecture Behavioral of ctrl_unit is
    signal mode_ff        : std_logic := '0';  -- default: SHIFT
    signal dir_ff         : std_logic := '0';  -- default: LEFT
    signal btn_mode_prev : std_logic := '0';
    signal btn_dir_prev  : std_logic := '0';
begin
    process(clk)
    begin
        if rising_edge(clk) then

            -- Toggle SHIFT / ROTATE
            if (btn_mode_raw = '1' and btn_mode_prev = '0') then
                mode_ff <= not mode_ff;
            end if;

            -- Toggle LEFT / RIGHT
            if (btn_dir_raw = '1' and btn_dir_prev = '0') then
                dir_ff <= not dir_ff;
            end if;

            -- Store previous button states
            btn_mode_prev <= btn_mode_raw;
            btn_dir_prev  <= btn_dir_raw;

        end if;
    end process;

    mode <= mode_ff;
    dir  <= dir_ff;
end Behavioral;

