
library ieee;
use ieee.std_logic_1164.all;

entity CounterTB is
end entity;

architecture count_arch_test of CounterTB is
    signal clk:     std_logic := '1';
    signal reset:   std_logic;
    signal en:      std_logic;
    signal q:       std_logic_vector (0 to 3);
begin
CLOCK:
    process
    begin
        wait for 5 ns;
        clk <= not clk;
        if now > 2600 ns then
            wait;
        end if;
    end process;
i_Counter:
    entity work.Counter(count_arch)
        port map (
            clk   => clk,
            reset => reset,
            en    => en,
            q     => q    
        );
STIMULUS:
    process
    begin
        
        reset <= '1';
        en <= '0';
        wait for 1 ns;
        reset <= '0';
        wait for 10 ns;
        en <= '1';
        wait for 10 ns;
        en <= '0';
        wait for 10 ns;
        en <= '1';
        wait;
    end process;
end;