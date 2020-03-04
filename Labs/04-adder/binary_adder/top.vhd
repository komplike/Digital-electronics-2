------------------------------------------------------------------------
--
-- Implementation of 4-bit adder.
-- Xilinx XC2C256-TQ144 CPLD, ISE Design Suite 14.7
--
-- Copyright (c) 2019-2020 Tomas Fryza
-- Dept. of Radio Electronics, Brno University of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------------------
-- Entity declaration for top level
------------------------------------------------------------------------
entity top is
    port (SW0_CPLD:   in  std_logic;        -- Input A
          SW1_CPLD:   in  std_logic;
          SW2_CPLD:   in  std_logic;
          SW3_CPLD:   in  std_logic;
          SW8_CPLD:   in  std_logic;        -- Input B
          SW9_CPLD:   in  std_logic;
          SW10_CPLD:  in  std_logic;
          SW11_CPLD:  in  std_logic;
          disp_seg_o: out std_logic_vector(7-1 downto 0);
          disp_dig_o: out std_logic_vector(4-1 downto 0);
				 LD15_CPLD: out   std_logic;
				 LD14_CPLD: out   std_logic; 
				 LD13_CPLD:  out   std_logic;
				 LD12_CPLD:  out   std_logic;
				 LD11_CPLD:  out   std_logic;
				 LD10_CPLD:  out   std_logic;
				 LD9_CPLD :  out   std_logic;
				 LD8_CPLD : out   std_logic;
				 LD7_CPLD   :out   std_logic;
				 LD6_CPLD   :out   std_logic;
				 LD5_CPLD   :out   std_logic;
				 LD4_CPLD   :out   std_logic;
				 LD3_CPLD   :out   std_logic;
				 LD2_CPLD  : out   std_logic;
				 LD1_CPLD :  out   std_logic;
				 LD0_CPLD:   out   std_logic
			 );
			 
end entity top;

------------------------------------------------------------------------
-- Architecture declaration for top level
------------------------------------------------------------------------
architecture Behavioral of top is
    signal s_dataA, s_dataB: std_logic_vector(4-1 downto 0);
    signal s_carry0, s_carry1, s_carry2: std_logic;
    signal s_result: std_logic_vector(4-1 downto 0);
    signal s_carryOut: std_logic;
begin

    -- Combine two 4-bit inputs to internal signals s_dataA and s_dataB
    -- WRITE YOUR CODE HERE


    --------------------------------------------------------------------
    -- Sub-blocks of four full_adders
    FULLADDER0: entity work.full_adder
        port map (
						carry_i => '0',
						b_i => SW0_CPLD, 
					   a_i => SW1_CPLD,   
					   carry_o => s_carry0,
					   sum_o => s_result(0)
                 );

    FULLADDER1: entity work.full_adder
        port map (
                  carry_i => s_carry0,
						b_i => SW2_CPLD, 
					   a_i => SW3_CPLD,  
					   carry_o => s_carry1,
					   sum_o => s_result(1)
                 );

    FULLADDER2: entity work.full_adder
        port map (
                  carry_i => s_carry1,
						b_i => SW8_CPLD,  
					   a_i => SW9_CPLD,   
					   carry_o => s_carry2,
					   sum_o => s_result(2)
                 );

    FULLADDER3: entity work.full_adder
        port map (
                  carry_i => s_carry2,
						b_i => SW10_CPLD,  
					   a_i => SW11_CPLD,   
					   carry_o => s_carryOut,
					   sum_o => s_result(3)
                 );


    --------------------------------------------------------------------
    -- Sub-block of hex_to_7seg entity
    HEX2SSEG: entity work.hex_to_7seg
        port map (
                  hex_i => s_result,
						seg_o => disp_seg_o
                  );

    -- Select display position
    disp_dig_o <= "1110";


    -- Show carry output bit on Coolrunner-II LED
    -- WRITE YOUR CODE HERE

    -- Show two 4-bit inputs on CPLD expansion LEDs
LD15_CPLD <= NOT SW11_CPLD;
LD7_CPLD <= SW11_CPLD;
LD14_CPLD <= NOT SW10_CPLD;
LD6_CPLD <= SW10_CPLD;
LD13_CPLD <= NOT SW9_CPLD;
LD5_CPLD <= SW9_CPLD;
LD12_CPLD  <= NOT SW8_CPLD;
LD4_CPLD  <= SW8_CPLD;
LD11_CPLD  <= NOT SW3_CPLD;
LD3_CPLD  <= SW3_CPLD;
LD10_CPLD  <= NOT SW2_CPLD;
LD2_CPLD  <= SW2_CPLD;
LD9_CPLD  <= NOT SW1_CPLD;
LD1_CPLD  <= SW1_CPLD;
LD8_CPLD  <= NOT SW0_CPLD;
LD0_CPLD  <= SW0_CPLD;

end architecture Behavioral;