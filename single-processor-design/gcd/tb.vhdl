library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

library STD;
use STD.textio.all;

entity tb is
end;


architecture beh of tb is
		
   constant n: integer := 3;
	component gcd is
	generic (N : integer := n);
	port (clk: in std_logic;     
       reset: in std_logic;
       num_1: in unsigned(n downto 0);
       num_2: in unsigned(n downto 0);
       dout: out unsigned(n downto 0);
		 done: out std_logic
			);
	end component;

  signal clk, reset, done: std_logic;
  signal dout, num_1, num_2: unsigned(n downto 0);
  constant clk_period : time := 10 ns;
begin
	uut :  gcd
    generic map (n => 3)
    port map(
      clk => clk,
      reset => reset,
      num_1 => num_1,
      num_2 => num_2,
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
	 for num1 in 15 downto 1 
	loop
		for num2 in 15 downto 1
		loop
			num_1 <= to_unsigned(num1,N+1);
			num_2 <= to_unsigned(num2,N+1);
			-- wait for clk_period;
			wait until done = '1';

		end loop;
	end loop;
	end process;
end architecture;
