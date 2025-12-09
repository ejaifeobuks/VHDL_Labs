----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/01/2025 03:40:36 AM
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
      port ( BTN1, BTN2, BTN3, BTN4, Clk : in std_logic;
               seg_out: out std_logic_vector( 7 downto 0);
               AN : out std_logic_vector(7 downto 0));
end top;

architecture structural of top is
 component SLOW_CLOCK is
--  Port ( );
    port ( clk, reset : in std_logic;
            clk_out : out std_logic );
end component;

component controller is
    port(
        clk        : in  std_logic;   -- slow clock from divider
        rst        : in  std_logic;   -- BTN4
        start_btn  : in  std_logic;   -- BTN1
        stop_btn   : in  std_logic;   -- BTN2
        inc_btn    : in  std_logic;   -- BTN3
        run        : out std_logic    -- counter enable
    );
end component;

component counter is
--  Port ( );
    port(Cen: in std_logic;
         clk: in std_logic;
         rst : in std_logic;
         B: out std_logic_vector(3 downto 0));
end component;

component seg_dec is
port( B : in std_logic_vector(3 downto 0);
          Anode : out std_logic_vector(7 downto 0);
          A : out std_logic_vector(7 downto 0));
 end component;
 signal clk_out,run : std_logic;
 signal counter_out: std_logic_vector(3 downto 0);
begin
clk_divider : SLOW_CLOCK port map (clk => Clk,
                                   reset => BTN4,
                                   clk_out =>clk_out);
                                   
control : controller port map ( clk=> clk_out, 
                                rst=> BTN4,
                                start_btn => BTN1,
                                stop_btn => BTN2,
                                inc_btn => BTN3,
                                run => run);
count_decoder : counter port map ( Cen => run,
                                   clk => clk_out,
                                   rst => BTN4,
                                   B => counter_out);
seven_seg_display : seg_dec port map( B => counter_out,
                                  A => seg_out,
                                  Anode => AN);     -- ✅ passes to FPGA pin
                                   

end structural;
