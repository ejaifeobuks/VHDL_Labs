library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
----------------------------------------
entity lab2 is 
    port(x : in std_logic;
          y: in std_logic;
          z: in std_logic;  
          f_nand, f_nor, f_mux, f_dec : out std_logic);
end lab2;
 
architecture behav of lab2 is
    signal dec_in : std_logic_vector(2 downto 0);
    signal dec_out : std_logic_vector(7 downto 0);
    signal mux_in: std_logic_vector(3 downto 0);
    signal mux_sel : std_logic_vector(1 downto 0);
    signal mux_out : std_logic;
    begin
        f_nand<=not(not(x and z) and not(y and z));
        f_nor <= not (not(x or y) or not (z or z));
    
        process(dec_in)
        begin
            case dec_in is
                when "000" => dec_out <= "00000001";
                when "001" => dec_out <= "00000010";
                when "010" => dec_out <= "00000100";
                when "011" => dec_out <= "00001000";
                when "100" => dec_out <= "00010000";
                when "101" => dec_out <= "00100000";
                when "110" => dec_out <= "01000000";
                when "111" => dec_out <= "10000000";
                when others => null;  
          end case;         
        end process;
        
        dec_in(2)<=x;
        dec_in(1)<=y;
        dec_in(0)<=z;
        
        f_dec<= dec_out(3) or dec_out(5) or  dec_out(7);
        
        process(mux_sel,mux_in)
            begin
                mux_out <='0';
                if mux_sel="00" then
                    mux_out<=mux_in(0);
                 elsif mux_sel="01" then
                     mux_out<=mux_in(1);
                elsif mux_sel="10" then
                     mux_out<=mux_in(2);
                elsif mux_sel="11" then
                    mux_out<=mux_in(3);
              end if;
             end process; 
             
       mux_sel(0)<=y;
       mux_sel(1)<=x;
       mux_in(0)<='0';
       mux_in(1)<= z;
       mux_in(2)<= z;
       mux_in(3)<=z;
       
       f_mux<=mux_out;
       
    end behav;
             
-----------------------------------