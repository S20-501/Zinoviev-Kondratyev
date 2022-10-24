library ieee;
use ieee.std_logic_1164.all;

entity Counter  is
    port (
        clk:    in  std_logic;
        reset:  in  std_logic;
        en:     in  std_logic;
        q:      out std_logic_vector( 0 to 3)
    );
end entity;

architecture count_arch of Counter is
    component T_Trigger is
        port (
            clk:    in  std_logic;
            reset:  in  std_logic;
            t:      in  std_logic;
            q:      out std_logic 
        );
    end component;

    signal cnt:         std_logic_vector (0 to 3);
    signal t:           std_logic_vector (0 to 3); 
begin

    -- The seven AND gates:
    t <=  (              en,   en and cnt(0), t(1) and cnt(1), t(2) and cnt(2)
         --   t(3) and cnt(3), t(4) and cnt(4), t(5) and cnt(5), t(6) and cnt(6)
          );

--  The eight TFFs:
u1:
    	T_Trigger
        port map (
            clk => clk,
            reset => reset,
            t => t(0),
            q => cnt(0)
        ); 

u2:
  	T_Trigger
        port map (
            clk => clk,
            reset => reset,
            t => t(1),
            q => cnt(1)
        ); 

u3:
    	T_Trigger
        port map (
            clk => clk,
            reset => reset,
            t => t(2),
            q => cnt(2)
        ); 

u4:
    	T_Trigger
        port map (
            clk => clk,
            reset => reset,
            t => t(3),
            q => cnt(3)
        );       




    q <= cnt;

end architecture;