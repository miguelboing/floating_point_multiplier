library IEEE;
use IEEE.Std_Logic_1164.all;

entity floating_point_multiplier is
port (
	A: in std_logic_vector(31 downto 0);
	B: in std_logic_vector(31 downto 0);

	result: out std_logic_vector(31 downto 0)); 
end floating_point_multiplier;

component unpack is
port (
		A: in std_logic_vector(31 downto 0);
		
		sign: out std_logic;
		mantissa: out std_logic_vector(22 downto 0);
		exponent: out std_logic_vector(7 downto 0));
end component;

architecture Structural of floating_point_multiplier is

signal A_signal, B_signal, C_signal: std_logic;
signal A_mantissa, B_mantissa, C_mantissa: std_logic_vector(22 downto 0); 
signal A_exponent, B_exponent, C_exponent: std_logic_vector(7 downto 0);

begin


end Structural;