------------------------------------------------------------
--
-- Testbench for 7-segment display decoder.
-- Nexys A7-50T, xc7a50ticsg324-1L
-- TerosHDL, Vivado v2020.2
--
-- Copyright (c) 2020 Tomas Fryza
-- Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all; -- Definition of "to_unsigned"

------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------

entity tb_top is
-- Entity of testbench is always empty
end entity tb_top;

------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------

architecture testbench of tb_top is

  -- Testbench local signals
  signal SW   : STD_LOGIC_VECTOR (3 downto 0);
  signal LED  : STD_LOGIC_VECTOR (7 downto 0);
  signal CA   : STD_LOGIC;
  signal CB   : STD_LOGIC;
  signal CC   : STD_LOGIC;
  signal CD   : STD_LOGIC;
  signal CE   : STD_LOGIC;
  signal CF   : STD_LOGIC;
  signal CG   : STD_LOGIC;
  signal AN   : STD_LOGIC_VECTOR (7 downto 0);
  signal BTNC : STD_LOGIC;

begin

  -- Connecting testbench signals with decoder entity
  -- (Unit Under Test)
  uut_top : entity work.top
    port map (
      sw     => SW,
      led    => LED,
      ca     => CA,
      cb     => CB,
      cc     => CC,
      cd     => CD,
      ce     => CE,
      cf     => CF,
      cg     => CG,
      an     => AN,
      btnc   => BTNC
    );

  --------------------------------------------------------
  -- Data generation process
  --------------------------------------------------------
  p_stimulus : process is
  begin

    report "Stimulus process started";
    
    -- First test case --
    sw  <= "0000";
    wait for 100 ns;
    assert (
    
        (led = "00001000")
        
    )
    report "Input combination 0 FAILED"
    severity error;
    
    -- Secind test case --
    sw  <= "0001";
    wait for 100 ns;
    assert (
    
        (led = "00010011")
        
    )
    report "Input combination 1 FAILED"
    severity error;
    
    -- Third test case --
    sw  <= "0010";
    wait for 100 ns;
    assert (
    
        (led = "00100001")
        
    )
    report "Input combination 2 FAILED"
    severity error;
    
    -- Fourth test case --
    sw  <= "0011";
    wait for 100 ns;
    assert (
    
        (led = "00110010")
        
    )
    report "Input combination 3 FAILED"
    severity error;
    
    -- Fifth test case --
    sw  <= "0100";
    wait for 100 ns;
    assert (
    
        (led = "01000001")
        
    )
    report "Input combination 4 FAILED"
    severity error;
    
    -- Sixth test case --
    sw  <= "0101";
    wait for 100 ns;
    assert (
    
        (led = "01010010")
        
    )
    report "Input combination 5 FAILED"
    severity error;
    
    -- Seventh test case --
    sw  <= "0110";
    wait for 100 ns;
    assert (
    
        (led = "01100000")
        
    )
    report "Input combination 6 FAILED"
    severity error;
    
    -- Eighth test case --
    sw  <= "0111";
    wait for 100 ns;
    assert (
    
        (led = "01110010")
        
    )
    report "Input combination 7 FAILED"
    severity error;
    
    -- Ninth test case --
    sw  <= "1000";
    wait for 100 ns;
    assert (
    
        (led = "10000001")
        
    )
    report "Input combination 8 FAILED"
    severity error;
    
    -- Tenth test case --
    sw  <= "1001";
    wait for 100 ns;
    assert (
    
        (led = "10010010")
        
    )
    report "Input combination 9 FAILED"
    severity error;
    
    -- Eleventh test case --
    sw  <= "1010";
    wait for 100 ns;
    assert (
    
        (led = "10100100")
        
    )
    report "Input combination a FAILED"
    severity error;
    
    -- Twelth test case --
    sw  <= "1011";
    wait for 100 ns;
    assert (
    
        (led = "10110110")
        
    )
    report "Input combination b FAILED"
    severity error;
    
    -- Thirteenth test case --
    sw  <= "1100";
    wait for 100 ns;
    assert (
    
        (led = "11000100")
        
    )
    report "Input combination c FAILED"
    severity error;
    
    -- Fourteenth test case --
    sw  <= "1101";
    wait for 100 ns;
    assert (
    
        (led = "11010110")
        
    )
    report "Input combination d FAILED"
    severity error;
    
    -- Fifteenth test case --
    sw  <= "1110";
    wait for 100 ns;
    assert (
    
        (led = "11100100")
        
    )
    report "Input combination e FAILED"
    severity error;
    
    -- Sixteenth test case --
    sw  <= "1111";
    wait for 100 ns;
    assert (
    
        (led = "11110110")
        
    )
    report "Input combination f FAILED"
    severity error;
    
    report "Stimulus process finished";
    wait;

  end process p_stimulus;

end architecture testbench;
