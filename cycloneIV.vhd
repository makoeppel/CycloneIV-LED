library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity cycloneIV is
	port (
		clk : in std_logic;
		led1 : out std_logic;
		led2 : out std_logic;
		led3 : out std_logic;
		led4 : out std_logic;
		seg0 : out std_logic;
		seg1 : out std_logic;
		seg2 : out std_logic;
		seg3 : out std_logic;
		seg4 : out std_logic;
		seg5 : out std_logic;
		seg6 : out std_logic;
		seg7 : out std_logic;
		DIG1 : out std_logic;
		DIG2 : out std_logic;
		DIG3 : out std_logic;
		DIG4 : out std_logic
);
end entity cycloneIV;

architecture rtl of cycloneIV is

	signal s_cnt : std_logic_vector(31 downto 0) := (others => '0');
	signal hex_cnt : std_logic_vector(31 downto 0) := (others => '0');

begin

led_blinky : process (clk) is
begin
if rising_edge(clk) then
--	if(button0 = '0') then
		s_cnt   <= s_cnt + 1;
		led1 <= s_cnt(23);
		led2 <= s_cnt(22);
		led3 <= s_cnt(21);
		led4 <= s_cnt(20);
--	end if;
 end if;
end process led_blinky;

process(clk)
variable state: integer range 1 to 16 := 1;
begin
	if rising_edge(clk) then
		hex_cnt <= hex_cnt + 1;
--		seg0 <= '1';
--		seg1 <= '1';
--		seg2 <= '1';
--		seg3 <= '1';
--		seg4 <= '1';
--		seg5 <= '1';
--		seg6 <= '1';
		seg7 <= '0';
		if (hex_cnt(23) = '1') then
			case state is
			when 1 => 
				seg1 <= '0';
				seg2 <= '0';
				state := 2;
			when 2 =>
				seg0 <= '0';
				seg1 <= '0';
				seg6 <= '0'; 
				seg4 <= '0';
				seg3 <= '0';
				state := 3;
			when 3 =>
				seg0 <= '0';
				seg1 <= '0';
				seg2 <= '0';
				seg3 <= '0';
				seg6 <= '0'; 
				state := 4;
			when 4 =>
				seg0 <= '0';
				seg5 <= '0';
				seg6 <= '0'; 
				seg2 <= '0';
				state := 5;
			when 5 =>
				seg0 <= '0';
				seg5 <= '0';
				seg6 <= '0'; 
				seg3 <= '0';
				seg3 <= '0';
				state := 6;
			when 6 =>
				seg0 <= '0';
				seg5 <= '0';
				seg6 <= '0'; 
				seg2 <= '0';
				seg4 <= '0';
				seg3 <= '0';
				state := 7;
			when 7 =>
				seg0 <= '0';
				seg1 <= '0';
				seg2 <= '0'; 
				state := 8; 
			when 8 =>
				seg0 <= '0';
				seg1 <= '0';
				seg2 <= '0';
				seg3 <= '0';
				seg4 <= '0';
				seg5 <= '0';
				seg6 <= '0';
				state := 9;
			when 9 =>
				seg0 <= '0';
				seg1 <= '0';
				seg2 <= '0';
				seg3 <= '0';
				seg5 <= '0';
				seg6 <= '0';
				state := 10;  
			when 10 =>
				seg0 <= '0';
				seg1 <= '0';
				seg2 <= '0';
				seg5 <= '0';
				seg6 <= '0';
				state := 11;
			when 11 =>
				seg0 <= '0';
				seg1 <= '0';
				seg2 <= '0';
				seg3 <= '0';
				seg4 <= '0';
				seg5 <= '0';
				seg6 <= '0';
				state := 12;
			when 12 =>
				seg0 <= '0';
				seg3 <= '0';
				seg4 <= '0';
				seg5 <= '0';
				state := 13;
			when 13 =>
				seg0 <= '0';
				seg1 <= '0';
				seg2 <= '0';
				seg3 <= '0';
				seg4 <= '0';
				seg5 <= '0';
				state := 14;
			when 14 => 
				seg0 <= '0';
				seg3 <= '0';
				seg4 <= '0';
				seg5 <= '0';
				seg6 <= '0';
				state := 15;
			when 15 => 
				seg0 <= '0';
				seg4 <= '0';
				seg5 <= '0';
				seg6 <= '0';
				state := 16;
			when 16 => 
				seg0 <= '0';
				seg1 <= '0';
				seg2 <= '0';
				seg3 <= '0';
				seg4 <= '0';
				seg5 <= '0';
				state := 1;
			end case;
		end if;
	end if;
end process;

--	seg0 <= '1';
--	seg1 <= '0';
--	seg2 <= '1';
--	seg3 <= '0';
--	seg4 <= '1';
--	seg5 <= '0';
--	seg6 <= '1';
--	seg7 <= '0';
	DIG1 <= '1';
	DIG2 <= '0';
	DIG3 <= '1';
	DIG4 <= '0';
end;