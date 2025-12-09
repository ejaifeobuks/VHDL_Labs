----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/05/2025 08:23:59 PM
-- Design Name: 
-- Module Name: testbench - Behavioral
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

entity top_shifter_system_tb is
end top_shifter_system_tb;

architecture Behavioral of top_shifter_system_tb is

    -- DUT signals
    signal clk          : std_logic := '0';
    signal data_in      : std_logic_vector(11 downto 0);
    signal shift_amt    : std_logic_vector(1 downto 0);
    signal btn_mode_raw : std_logic;
    signal btn_dir_raw  : std_logic;
    signal data_out     : std_logic_vector(11 downto 0);

    -- Clock period
    constant CLK_PERIOD : time := 10 ns;

    -- DUT component
    component top_shifter_system
        Port (
            clk          : in  std_logic;
            data_in      : in  std_logic_vector(11 downto 0);
            shift_amt    : in  std_logic_vector(1 downto 0);
            btn_mode_raw : in  std_logic;
            btn_dir_raw  : in  std_logic;
            data_out     : out std_logic_vector(11 downto 0)
        );
    end component;

begin

    ------------------------------------------------------------------
    -- DUT INSTANTIATION
    ------------------------------------------------------------------
    UUT : top_shifter_system
        port map (
            clk          => clk,
            data_in      => data_in,
            shift_amt    => shift_amt,
            btn_mode_raw => btn_mode_raw,
            btn_dir_raw  => btn_dir_raw,
            data_out     => data_out
        );

    ------------------------------------------------------------------
    -- CLOCK GENERATOR
    ------------------------------------------------------------------
    clk_process : process
    begin
        while true loop
            clk <= '0';
            wait for CLK_PERIOD / 2;
            clk <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
    end process;

    ------------------------------------------------------------------
    -- STIMULUS PROCESS
    ------------------------------------------------------------------
    stim_process : process
    begin
        ------------------------------------------------------------------
        -- INITIAL VALUES
        ------------------------------------------------------------------
        data_in      <= "000000000001";  -- 1
        shift_amt    <= "00";            -- shift by 0
        btn_mode_raw <= '0';
        btn_dir_raw  <= '0';
        wait for 2 * CLK_PERIOD;

        ------------------------------------------------------------------
        -- TEST 1: LOGICAL SHIFT RIGHT BY 1
        ------------------------------------------------------------------
        shift_amt    <= "01";            -- shift by 1
        btn_dir_raw  <= '0';             -- RIGHT
        btn_mode_raw <= '0';             -- LOGICAL
        wait for 4 * CLK_PERIOD;

        ------------------------------------------------------------------
        -- TEST 2: LOGICAL SHIFT LEFT BY 2
        ------------------------------------------------------------------
        shift_amt    <= "10";            -- shift by 2
        btn_dir_raw  <= '1';             -- LEFT
        btn_mode_raw <= '0';             -- LOGICAL
        wait for 4 * CLK_PERIOD;

        ------------------------------------------------------------------
        -- TEST 3: ARITHMETIC SHIFT RIGHT BY 1 (NEG NUMBER TEST)
        ------------------------------------------------------------------
        data_in      <= "100000000000";  -- MSB = 1 (negative)
        shift_amt    <= "01";            -- shift by 1
        btn_dir_raw  <= '0';             -- RIGHT
        btn_mode_raw <= '1';             -- ARITHMETIC
        wait for 4 * CLK_PERIOD;

        ------------------------------------------------------------------
        -- TEST 4: ARITHMETIC SHIFT LEFT BY 3
        ------------------------------------------------------------------
        data_in      <= "000000001111";
        shift_amt    <= "11";            -- shift by 3
        btn_dir_raw  <= '1';             -- LEFT
        btn_mode_raw <= '1';             -- ARITHMETIC
        wait for 4 * CLK_PERIOD;

        ------------------------------------------------------------------
        -- TEST 5: RANDOM PATTERN, LOGICAL RIGHT SHIFT BY 2
        ------------------------------------------------------------------
        data_in      <= "101010101010";
        shift_amt    <= "10";            -- shift by 2
        btn_dir_raw  <= '0';             -- RIGHT
        btn_mode_raw <= '0';             -- LOGICAL
        wait for 4 * CLK_PERIOD;

        ------------------------------------------------------------------
        -- END SIMULATION
        ------------------------------------------------------------------
        wait;
    end process;

end Behavioral;

