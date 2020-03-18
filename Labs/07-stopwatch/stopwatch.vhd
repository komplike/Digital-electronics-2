library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity stopwatch is
port(

	clk_i : in std_logic := '0';
    srst_n_i : in std_logic:= '1';
	ce_100Hz_i : in std_logic := '0';
    cnt_en_i : in std_logic := '0';
    sec_h_o : out std_logic_vector(3 downto 0) := (others => '0');
	sec_l_o : out std_logic_vector(3 downto 0) := (others => '0');
	hth_h_o : out std_logic_vector(3 downto 0) := (others => '0');
	hth_l_o : out std_logic_vector(3 downto 0) := (others => '0'));

end entity stopwatch;

architecture Behavioral of stopwatch is
signal en_dc0_s, en_dc1_s,en_dc2_s, en_dc3_s, en_dc4_s, en_100Hz :std_logic := '0';
    
begin

decimalCounter0 : entity work.decimalCounter
	generic map (
    				pwm => 9
							)
	port map (
		 clk_i => clk_i,
    srst_n_i => srst_n_i,
    en_i => en_dc0_s,
    cnt_o => sec_l_o,
    carry => en_dc1_s
	);
    
decimalCounter1 : entity work.decimalCounter
    generic map (
                        pwm => 5
                                )
	port map (
		 clk_i => clk_i,
    srst_n_i => srst_n_i,
    en_i => en_dc1_s,
    cnt_o => sec_h_o,
    carry => en_dc2_s
	);
    
decimalCounter2 : entity work.decimalCounter
	generic map (
    				pwm => 9
							)
	port map (
		 clk_i => clk_i,
    srst_n_i => srst_n_i,
    en_i => en_dc2_s,
    cnt_o => hth_l_o,
    carry => en_dc3_s
	);
    
decimalCounter3 : entity work.decimalCounter
	generic map (
    				pwm => 5
							)
	port map (
		 clk_i => clk_i,
    srst_n_i => srst_n_i,
    en_i => en_dc3_s,
    cnt_o => hth_h_o,
    carry => en_dc4_s
	);
   
  A : process(clk_i)
   begin
   
   if rising_edge(clk_i) then  -- Rising clock edge
     if srst_n_i = '0' then  -- Synchronous reset (active low)
     en_dc0_s <= '0';  
     elsif ce_100Hz_i and cnt_en_i then
     	en_dc0_s <= '1';
     else
     	en_dc0_s <= '0';     
     end if;
   end if;
  
   
   end process A;

end architecture Behavioral;
