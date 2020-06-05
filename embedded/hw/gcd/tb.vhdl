library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
entity tb is
end;

architecture beh of tb is
  
	component gcd is
	generic (N : integer := 3);
	port (clk: in std_logic;     
       reset: in std_logic;
       num_1: in unsigned(n downto 0);
       num_2: in unsigned(n downto 0);
       dout: out unsigned(n downto 0);
		 done: out std_logic
			);
	end component;

  signal clk, reset, done: std_logic;
  signal dout, num_1, num_2: unsigned(3 downto 0);
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
    num_1 <= "1010";
    num_2 <= "1010";
    wait for 200 ns;
    num_1 <= "1100";
    num_2 <= "1001";
    wait for 200 ns;
    num_1 <= "1111";
    num_2 <= "1001";
    wait for 200 ns;
    num_1 <= "1011";
    num_2 <= "0010";
    wait for 200 ns;
    num_1 <= "1110";
    num_2 <= "0010";
    wait for 200 ns;
	end process;
end architecture;
