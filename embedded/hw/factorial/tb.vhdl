library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb is
end;


architecture beh of tb is
function fact(x: integer)
  return integer is
  variable temp : integer := 1;
begin
  for c in x downto 1 loop
    temp := temp * c;
  end loop;
end fact;
  
  component factorial
    generic (n:integer := 3);
    port (clk: in std_logic;     
       reset: in std_logic;
       num: in unsigned(n downto 0);
       dout: out unsigned(n downto 0);
		 done: out std_logic
		);
  end component;

  signal clk, reset, done: std_logic;
  signal dout, num: unsigned(3 downto 0);
  constant clk_period : time := 10 ns;
  constant n : integer := 3;
begin
	uut : factorial
    generic map(n => 3)
    port map(
      clk => clk,
      reset => reset,
      num => num,
      dout => dout,
		done => done
		);
  process
  begin
    clk <= '0';
    wait for clk_period/2;
    clk <= '1';
    wait for clk_period/2;
  end process;

  process
  begin
    reset <= '1';
    wait for 100 ns;
    reset <= '0';
    for c in 1 to (2**n-1) loop
      num <= to_unsigned(c,n+1);
      wait for 100 ns;
    end loop;
    end process;
end architecture;
