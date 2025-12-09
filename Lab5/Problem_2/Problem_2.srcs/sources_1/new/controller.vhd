library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity controller is
    port(
        clk        : in  std_logic;   -- slow clock from divider
        rst        : in  std_logic;   -- BTN4
        start_btn  : in  std_logic;   -- BTN1
        stop_btn   : in  std_logic;   -- BTN2
        inc_btn    : in  std_logic;   -- BTN3
        run        : out std_logic    -- counter enable
    );
end controller;

architecture Behavioral of controller is

    type state_type is (STOPPED, RUNNING);
    signal state, next_state : state_type;

begin

    ------------------------------------------------------------------
    -- STATE REGISTER
    ------------------------------------------------------------------
    process(clk, rst)
    begin
        if rst = '1' then
            state <= STOPPED;
        elsif rising_edge(clk) then
            state <= next_state;
        end if;
    end process;

    ------------------------------------------------------------------
    -- NEXT STATE LOGIC
    ------------------------------------------------------------------
    process(state, start_btn, stop_btn)
    begin
        next_state <= state;

        case state is
            when STOPPED =>
                if start_btn = '1' then
                    next_state <= RUNNING;
                end if;

            when RUNNING =>
                if stop_btn = '1' then
                    next_state <= STOPPED;
                end if;
        end case;
    end process;

    ------------------------------------------------------------------
    -- OUTPUT: COUNTER ENABLE
    -- RUNNING → count on every slow clock edge
    -- inc_btn → count once on next slow clock edge
    ------------------------------------------------------------------
    run <= '1' when (state = RUNNING) or (inc_btn = '1')
           else '0';

end Behavioral;
