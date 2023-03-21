----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.03.2023 23:11:17
-- Design Name: 
-- Module Name: tb_top - Behavioral
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

entity tb_top is
--  Port ( );
end tb_top;

architecture testbench of tb_top is

  -- Number of bits for testbench counter
  constant c_CNT_WIDTH         : natural := 3;
  constant c_CLK_100MHZ_PERIOD : time    := 10 ns;

  -- Local signals
  signal sig_clk_100mhz : std_logic;
  signal sig_rst        : std_logic;
  signal sig_en         : std_logic;
  signal sig_cnt_up     : std_logic;
  signal sig_cnt        : std_logic_vector(c_CNT_WIDTH - 1 downto 0) := (others => '0');

begin

  -- Connecting testbench signals with cnt_up_down entity
  -- (Unit Under Test)
  uut_top : entity work.top
    generic map (
      g_CNT_WIDTH => c_CNT_WIDTH
    )
    port map (
      clk    => sig_clk_100mhz,
      rst    => sig_rst,
      en     => sig_en,
      cnt_up => sig_cnt_up,
      cnt    => sig_cnt
    );

  --------------------------------------------------------
  -- Clock generation process
  --------------------------------------------------------
  p_clk_gen : process is
  begin

    while now < 750 ns loop             -- 75 periods of 100MHz clock

      sig_clk_100mhz <= '0';
      wait for c_CLK_100MHZ_PERIOD / 2;
      sig_clk_100mhz <= '1';
      wait for c_CLK_100MHZ_PERIOD / 2;

    end loop;
    wait;                               -- Process is suspended forever

  end process p_clk_gen;

  --------------------------------------------------------
  -- Reset generation process
  --------------------------------------------------------
  p_reset_gen : process is
  begin

    sig_rst <= '0';
    wait for 12 ns;

    -- Reset activated
    sig_rst <= '1';
    wait for 70 ns;

    -- Reset deactivated
    sig_rst <= '0';

    wait;

  end process p_reset_gen;

  --------------------------------------------------------
  -- Data generation process
  --------------------------------------------------------
  p_stimulus : process is
  begin

    report "Stimulus process started";

    -- Enable counting
    sig_en <= '1';

    -- Change counter direction
    sig_cnt_up <= '1';
    wait for 380 ns;
    sig_cnt_up <= '0';
    wait for 186 ns;

    -- Disable counting
    sig_en <= '0';
    wait for 86 ns;
    -- Enable counting again
    sig_en <= '1';

    report "Stimulus process finished";
    wait;

  end process p_stimulus;

end architecture testbench;