library IEEE;
use IEEE.Std_Logic_1164.all;

entity test_bench is
end test_bench;

architecture test of test_bench is

	component mantissa_multiplier is
		port(
			A: in std_logic_vector(22 downto 0);
			B: in std_logic_vector(22 downto 0);

			result: out std_logic_vector(22 downto 0);
			exp_norm: out std_logic
		);
	end component;

signal A, B, result: std_logic_vector(22 downto 0);
signal exp_norm: std_logic;

begin

mantissa_multiplier_1: mantissa_multiplier 
	port map(A=>A, B=>B, result=>result, exp_norm=>exp_norm);

process begin
	-- 1.11
	A<= "11000000000000000000000";
	-- 1.01
	B<= "01000000000000000000000";
	-- 10.0011

	wait for 100 ns;

	-- 1.000
	A<= "00000000000000000000000";
	-- 1.1111
	B<= "11110000000000000000000";
	-- 1.1111

	wait for 100 ns;

	wait; 

end process;
end test;	