library ieee;   
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity factorial is
  generic( n: integer := 3);
  port(clk: in std_logic;     
       reset: in std_logic;
       num: in unsigned(n downto 0);
       dout: out unsigned(2*n downto 0);
		 done: out std_logic
       );
end entity;
  
architecture behavioral of factorial is
  type state is (idle, init, count, get_result);
  signal p_state: state := idle;
  signal n_state: state := idle;
  signal n_counter, counter : integer := 0;
  signal temp : integer := 1;
  signal d : std_logic;
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

  process(p_state,num,counter) is
  begin
    case p_state is
      when idle =>
        if (d = '1') then
          n_state <= init;
          d <= '0';
        else
		    d <= '1';
          n_state <= idle;
        end if;
      when init =>
        n_counter <= to_integer(num) - 1;
        temp <= to_integer(num);
        n_state <= count;
      when count =>
        if(counter = 0) then
          n_state <= get_result;
        else
          temp <= temp * counter;
			 n_counter <= counter - 1;
        end if;
      when get_result =>
        dout <= to_unsigned(temp,2*n+1);
        n_state <= idle;
		  end case;
		  
  end process;
  done <= d;
end architecture;             