library ieee;   
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
entity gcd is
  generic( n: integer := 3);
  port(clk: in std_logic;     
       reset: in std_logic;
       num_1: in unsigned(n downto 0);
       num_2: in unsigned(n downto 0);
       dout: out unsigned(n downto 0);
		 done: out std_logic
       );
end entity;
  
architecture behavioral of gcd is
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
    variable temp_x: unsigned(n downto 0) := (others => '0');
    variable temp_y: unsigned(n downto 0) := (others => '0');
  begin
    case p_state is
      when idle =>
        if (d = '1') then
          n_state <= init;
          d <= '0';
        else
          n_state <= idle;
			 d <= '1';
        end if;
      when init =>
        temp_x := num_1;
        temp_y := num_2;
        n_state <= check;
      when check =>
        if(temp_x = temp_y) then
          n_state <= get_result;
        elsif (temp_x > temp_y) then
          n_state <= update_x;
        else
          n_state <= update_y;
        end if;
      when update_x =>
        temp_x := temp_x - temp_y;
        n_state <= check;
      when update_y =>
        temp_y := temp_y - temp_x;
        n_state <= check;
      when get_result =>
        dout <= temp_x;
        n_state <= idle;
        d <= '1';
		end case;
  end process;
  done <= d;
end architecture;             
