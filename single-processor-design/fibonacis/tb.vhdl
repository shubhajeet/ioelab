library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb is
end;

architecture beh of tb is
 constant n: integer := 3;

	component fibonacis is
		generic (n : integer := n);
		port (
			clk, reset: in std_logic;
			done: out std_logic;
			num: in unsigned(n downto 0);
			dout: out unsigned(2*n downto 0)
		);
	end component;
  
  signal clk, reset, done: std_logic;
  signal num: unsigned(n downto 0);  
  signal dout: unsigned(2*n downto 0);

  constant clk_period : time := 10 ns;
  
begin
	uut : fibonacis
	generic map( n => n)
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
	 wait for clk_period;
    for c in  0 to 15 loop
      num <= to_unsigned(c,n+1);
		wait until done = '1';
		wait for clk_period;
    end loop;
  end process;
end beh;
