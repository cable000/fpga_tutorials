library ieee;
use ieee.std_logic_1164.all;

-- Interface
entity mux_4x4 is
    port(a,b,c,d: in std_logic_vector(3 downto 0);
    sel: in std_logic_vector(1 downto 0);
    clk: in std_logic;
    x, y: out std_logic_vector(3 downto 0)
    );
end entity;

-- Behavior
architecture mux_4x4 of mux_4x4 is

    signal mux: std_logic_vector(3 downto 0);
    
begin

    mux <= a when sel = "00" else
           b when sel = "01" else
           c when sel = "10" else
           d;
    x <= mux;
    
    process(clk)
    begin
        if (clk'event and clk='1') then
            y <= mux;
        end if;
    end process;

end architecture;
