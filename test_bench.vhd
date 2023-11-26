library IEEE;
use IEEE.Std_Logic_1164.all;

entity test_bench is
end test_bench;

architecture test of test_bench is

component n_bit_adder is
generic (n : natural);
port(A: in std_logic_vector(n-1 downto 0);
	 B: in std_logic_vector(n-1 downto 0);
	 Cin: in std_logic;

	 S: out std_logic_vector(n-1 downto 0);
	 Cout: out std_logic);
end component;



signal A, B, result: std_logic_vector(22 downto 0);
signal Cout, Cin: std_logic;

begin

n_bit_adder_1: n_bit_adder
	generic map(n=>23) 
	port map(A=>A, B=>B, S=>result, Cin=>Cin, Cout=>Cout);

process begin
	-- 1.11
	--A<= "11000000000000000000000";
	-- 1.01
	--B<= "01000000000000000000000";
	-- 10.0011

	A <= "00000000000000000000011";
	B <= "00000000000000000000001";
	Cin <= '0';

	wait for 100 ns;

	-- 1.000
	--A<= "00000000000000000000000";
	-- 1.1111
	--B<= "11110000000000000000000";
	-- 1.1111

	A <= "00000000000000000010101";
	B <= "00000000000000000101010";

	wait for 100 ns;


	A <= "10000000000000000010101";
	B <= "10000000000000000101010";

	wait for 100 ns;


	A <= "00000000000000000010101";
	B <= "00000000000000000101010";
	Cin <= '1';
	wait for 100 ns;

	wait; 

end process;
end test;	