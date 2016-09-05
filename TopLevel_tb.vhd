library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;

-- #spinalBegin userLibrary
-- #spinalEnd userLibrary


entity TopLevel_tb is
end TopLevel_tb;

architecture arch of TopLevel_tb is
  signal io_a : unsigned(3 downto 0);
  signal io_b : unsigned(3 downto 0);
  signal io_result : unsigned(3 downto 0);
  signal clk : std_logic;
  -- #spinalBegin userDeclarations
  -- #spinalEnd userDeclarations
begin
  -- #spinalBegin userLogics
  -- #spinalEnd userLogics
  uut : entity work.TopLevel
    port map (
      io_a =>  io_a,
      io_b =>  io_b,
      io_result =>  io_result,
      clk =>  clk 
    );
end arch;
