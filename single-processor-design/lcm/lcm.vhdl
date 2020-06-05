library ieee;   
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
entity lcm is
  generic( n: integer := 3);
  port(clk: in std_logic;     
       reset: in std_logic;
       num_1: in unsigned(n downto 0);
       num_2: in unsigned(n downto 0);
       dout: out unsigned(2*n downto 0);
		 done: out std_logic
       );
end entity;
  
architecture behavioral of lcm is
  type state is (idle, init, check, update_x, update_y, get_result);
  signal p_state: state := idle;
  signal n_state: state := idle;
  signal d : std_logic := '1';
begin
  process(clk,reset) is
  begin
    if (reset = '1') then
      p_state <= idle;
    elsif (clk'event and clk='1') then
      p_state <= n_state;
    end if;
  end process;

  process(p_state, num_1, num_2) is
    variable temp_x, mul_x: integer;
    variable temp_y, mul_y: integer;
    variable lcm: integer;
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
        temp_x := to_integer(num_1);
        temp_y := to_integer(num_2);
        mul_x := temp_x;
        mul_y := temp_y;
        n_state <= check;
      when check =>
        if(mul_x = mul_y) then
          n_state <= get_result;
        elsif ( mul_x > mul_y) then
          n_state <= update_y;
        else
          n_state <= update_x;
        end if;
      when update_x =>
        mul_x := mul_x + temp_x;
        n_state <= check;
      when update_y =>
        mul_y := mul_y + temp_y;
        n_state <= check;
      when get_result =>
        dout <= to_unsigned(mul_x,2*n+1);
        n_state <= idle;
    end case;
  end process;
  done <= d;
end architecture;             
