library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use UNISIM.VComponents.all;

entity lab1 is
    Port ( x : in  STD_LOGIC;
           y : in  STD_LOGIC;
           z : in  STD_LOGIC;
           CSOP : out  STD_LOGIC;
           CPOS : out  STD_LOGIC;
           RSOP : out  STD_LOGIC;
           RPOS : out  STD_LOGIC);
end lab1;

architecture structural of lab1 is

begin
	CSOP <= ((not x)and(not y)and (not z)) or((not x) and (not y) and z) or ((not x) and y and (not z))
				or (x and (not y) and (not z)) or (x and y and (not z));
	CPOS <= (x or (not y) or (not z)) and ((not x) or y or (not z)) and ((not x) or (not y) or (not z));
	
	RSOP <= ((not x) and (not y)) or (not z);
	
	RPOS <= ((not x)or (not z)) and ((not y) or (not z));

end structural;
