-- simple linear shiftregister
-- linear_shift.vhd

library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity linear_shift is 
	generic (
		G_M             : integer           := 7;
		G_POLY          : std_logic_vector  := "1100000" -- x^7+x^6+1 
	);
	port (
		i_clk           : in  std_logic;
		reset_n         : in  std_logic;
		i_sync_reset    : in  std_logic;
		i_seed          : in  std_logic_vector (G_M-1 downto 0);
		i_en            : in  std_logic;
		o_lsfr          : out std_logic_vector (G_M-1 downto 0)
	);
end linear_shift;

architecture rtl of linear_shift is  
	signal r_lfsr : std_logic_vector (G_M downto 1);
	signal w_mask : std_logic_vector (G_M downto 1);
	signal w_poly : std_logic_vector (G_M downto 1);
	signal counter : std_logic_vector (31 downto 0);
begin
	o_lsfr <= r_lfsr(G_M downto 1);
	w_poly <= G_POLY;
	g_mask : for k in G_M downto 1 generate
		w_mask(k) <= w_poly(k) and r_lfsr(1);
	end generate g_mask;
	
p_lfsr : process (i_clk,reset_n)
begin 
if (reset_n = '0') then 
	r_lfsr   <= (others => '1');
elsif rising_edge(i_clk) then 
	if (i_sync_reset='1') then
		r_lfsr   <= i_seed;
	--elsif (i_en = '1') then
	else
		r_lfsr   <= '0' & r_lfsr(G_M downto 2) xor w_mask;
	end if; 
end if;
end process p_lfsr; 

end architecture rtl;