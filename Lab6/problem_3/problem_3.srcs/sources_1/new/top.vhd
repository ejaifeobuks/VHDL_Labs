----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/04/2025 07:22:15 AM
-- Design Name: 
-- Module Name: top - structural
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

entity top_shifter_system is
    Port (
        clk          : in  std_logic;

        -- 12 slide switches
        data_in      : in  std_logic_vector(11 downto 0);

        -- 2 switches for shift amount (0–3)
        shift_amt    : in  std_logic_vector(1 downto 0);

        -- Pushbuttons
        btn_mode_raw : in  std_logic;
        btn_dir_raw  : in  std_logic;

        -- 12 LEDs
        data_out     : out std_logic_vector(11 downto 0)
    );
end top_shifter_system;

architecture Structural of top_shifter_system is

    signal mode_sig : std_logic;
    signal dir_sig  : std_logic;

    component ctrl_unit
        Port (
            clk          : in  std_logic;
            btn_mode_raw : in  std_logic;
            btn_dir_raw  : in  std_logic;
            mode         : out std_logic;
            dir          : out std_logic
        );
    end component;

    component shifter_12bit
        Port (
            A         : in  std_logic_vector(11 downto 0);
            shift_amt : in  std_logic_vector(1 downto 0);
            dir       : in  std_logic;
            mode      : in  std_logic;
            Y         : out std_logic_vector(11 downto 0)
        );
    end component;

begin
    ------------------------------------------------------------
    -- CONTROL UNIT INSTANCE
    ------------------------------------------------------------
    U_CTRL : ctrl_unit
        port map (
            clk          => clk,
            btn_mode_raw => btn_mode_raw,
            btn_dir_raw  => btn_dir_raw,
            mode         => mode_sig,
            dir          => dir_sig
        );

    ------------------------------------------------------------
    -- SHIFTER CORE INSTANCE
    ------------------------------------------------------------
    U_SHIFTER : shifter_12bit
        port map (
            A         => data_in,
            shift_amt => shift_amt,
            dir       => dir_sig,
            mode      => mode_sig,
            Y         => data_out
        );

end Structural;

