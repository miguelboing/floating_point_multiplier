library IEEE;
use IEEE.Std_Logic_1164.all;

entity pack is
port (
		sign: in std_logic;
		mantissa: in std_logic_vector(22 downto 0);
		exponent: in std_logic_vector(7 downto 0));

		A: out std_logic_vector(31 downto 0);
end pack;

architecture Structural of unpack is

begin

A <= sign & mantissa & exponent;

end Structural;