library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity T_Trigger is
    port (
        clk:    in  std_logic;
        reset:  in  std_logic;
        t:      in  std_logic;
        q:      out std_logic
    );
end entity;

architecture behaviour of T_Trigger is
    signal q_reg:   std_logic;
    signal q_next:  std_logic;
begin

counting: 
    process (clk, reset)
    begin
        if reset = '1' then
            q_reg <= '0'; 
        elsif rising_edge(clk)  then 
            q_reg <= q_next;
        end if;
    end process counting;

INPUT_MUX:    
    q_next <=     q_reg  when t = '0' else 
              not q_reg;
OUTPUT:
    q  <= q_reg;

end architecture;