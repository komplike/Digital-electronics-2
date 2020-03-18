

------------------------------------------------------------------------
--
-- N-bit binary counter.
-- Xilinx XC2C256-TQ144 CPLD, ISE Design Suite 14.7
--
-- Copyright (c) 2019-2020 Tomas Fryza
-- Dept. of Radio Electronics, Brno University of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;    -- Provides unsigned numerical computation
use ieee.Numeric_std.all;

------------------------------------------------------------------------
-- Entity declaration for N-bit binary counter
------------------------------------------------------------------------
entity decimalCounter is
generic (
    pwm : positive := 9      
);
port (
    clk_i    : in  std_logic;
    srst_n_i : in  std_logic;   -- Synchronous reset (active low)
    en_i     : in  std_logic;
    cnt_o    : out std_logic_vector(3 downto 0);
    carry    : out std_logic := '0'
);
end entity decimalCounter;

------------------------------------------------------------------------
-- Architecture declaration for N-bit binary counter
------------------------------------------------------------------------
architecture Behavioral of decimalCounter is
    signal s_cnt : Unsigned(3 downto 0) := (others => '0');
begin

    --------------------------------------------------------------------
    -- p_binary_cnt:
    -- Sequential process with synchronous reset and clock enable,
    -- which implements a one-way binary counter.
    --------------------------------------------------------------------
    p_decimal_cnt : process(clk_i)
    begin
        if rising_edge(clk_i) then  -- Rising clock edge
          carry <= '0';
          if srst_n_i = '0' then  -- Synchronous reset (active low)
            s_cnt <= (others => '0');   -- Clear all bits
          elsif en_i = '1' then
          	s_cnt <= s_cnt + 1; -- Normal operation
            if s_cnt = pwm then
              s_cnt <= (others => '0');
      			carry <= '1';
			end if;
              end if;
        end if;
    end process p_decimal_cnt;

    cnt_o <= Std_logic_vector(s_cnt);

end architecture Behavioral;
