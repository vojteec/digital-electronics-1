------------------------------------------------------------
--
-- Testbench for 4-bit binary comparator.
-- Nexys A7-50T, xc7a50ticsg324-1L
-- TerosHDL, Vivado 2020.2
--
-- Copyright (c) 2020 Tomas Fryza
-- Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------

entity tb_mux_3bit_4to1 is
  -- Entity of testbench is always empty
end entity tb_mux_3bit_4to1;

------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------

architecture testbench of tb_mux_3bit_4to1 is

  -- Testbench local signals
  signal sig_a           : std_logic_vector(2 downto 0);
  signal sig_b           : std_logic_vector(2 downto 0);
  signal sig_c           : std_logic_vector(2 downto 0);
  signal sig_d           : std_logic_vector(2 downto 0);
  signal sig_sel         : std_logic_vector(1 downto 0);
  signal sig_y           : std_logic_vector(2 downto 0);

begin

  -- Connecting testbench signals with comparator_4bit
  -- entity (Unit Under Test)
  uut_comparator_4bit : entity work.mux_3bit_4to1
    port map (
     a_i => sig_a;
     b_i => sig_b;
     c_i => sig_c;
     d_i => sig_d;
     sel => sig_sel;
     y_o => sig_y;
    );

  --------------------------------------------------------
  -- Data generation process
  --------------------------------------------------------
  p_stimulus : process is
  begin

    -- Report a note at the beginning of stimulus process
    report "Stimulus process started";

    -- First test case ...
    sig_b <= "0000";
    sig_a <= "0000";
    wait for 100 ns;
    -- ... and its expected outputs
    assert (
            (sig_b_greater_a = '0') and
            (sig_b_equals_a  = '1') and
            (sig_b_less_a    = '0')
        )
      -- If false, then report an error
      -- If true, then do not report anything
      report "Input combination b=0, a=0 FAILED"
      severity error;

    ------------------------------
    -- WRITE OTHER TEST CASES HERE
    sig_b <= "0001";
    sig_a <= "0001";
    wait for 100 ns;
    assert (
            (sig_b_greater_a = '0') and
            (sig_b_equals_a  = '1') and
            (sig_b_less_a    = '0')
        )
      report "Input combination b=1, a=1 FAILED"
      severity error;

    ------------------------------
    sig_b <= "0011";
    sig_a <= "1100";
    wait for 100 ns;
    assert (
            (sig_b_greater_a = '0') and
            (sig_b_equals_a  = '0') and
            (sig_b_less_a    = '1')
        )
      report "Input combination b=3, a=12 FAILED"
      severity error;

    ------------------------------
    sig_b <= "1000";
    sig_a <= "1001";
    wait for 100 ns;
    assert (
            (sig_b_greater_a = '0') and
            (sig_b_equals_a  = '0') and
            (sig_b_less_a    = '1')
        )
      report "Input combination b=8, a=9 FAILED"
      severity error;

    ------------------------------
    sig_b <= "1001";
    sig_a <= "1000";
    wait for 100 ns;
    assert (
            (sig_b_greater_a = '1') and
            (sig_b_equals_a  = '0') and
            (sig_b_less_a    = '0')
        )
      report "Input combination b=9, a=8 FAILED"
      severity error;

    -- Report a note at the end of stimulus process
    report "Stimulus process finished";

    wait; -- Data generation process is suspended forever

  end process p_stimulus;

end architecture testbench;