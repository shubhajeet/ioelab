library ieee;   
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity fibonacis is
  generic( n: integer := 3);
  port(clk: in std_logic;     
       reset: in std_logic;
       num: in unsigned(n downto 0);
       dout: out unsigned(n downto 0);
		 done: out std_logic
       );
end entity;
  
architecture behavioral of fibonacis is
  type state is (idle, init, count, get_result);
  signal p_state: state := idle;
  signal n_state: state := idle;
  signal d: std_logic := '1';
  signal a,b,c: integer := 1;
  signal counter, n_counter: integer := 0;
    
begin
  process(clk,reset) is
  begin
    if (reset = '1') then
      p_state <= idle;
		counter <= 0;
    elsif (clk'event and clk='1') then
      p_state <= n_state;
		counter <= n_counter;
    end if;
  end process;

  process(num,counter,p_state) is
  begin
    case p_state is
      when idle =>
        if (d = '0') then
          n_state <= init;
          d <= '1';
        else
		    d <= '0';
          n_state <= idle;
        end if;
      when init =>
        n_counter <= to_integer(num);
		  a <= 1;
		  b <= 1;
		  c <= 1;
        n_state <= count;
      when count =>
		  if(counter = 0) then
          n_state <= get_result;
        else
		    c <= a + b;
          a <= b;
          b <= c;
          n_counter <= counter - 1;
			 n_state <= count;
        end if;
      when get_result =>
        dout <= to_unsigned(a,n+1);
        n_state <= idle;
		 end case;
  end process;
  done <= d ;
end architecture;             
