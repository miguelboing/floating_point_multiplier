library IEEE;
use IEEE.Std_Logic_1164.all;

entity exp_normalization is
port(
	exp_A: in std_logic_vector(7 downto 0);
	exp_B: in std_logic_vector(7 downto 0);
	exp_mant_norm: in std_logic;

	exp_C: in std_logic_vector(7 downto 0)
);
end exp_normalization;

component n_bit_adder is
generic (n : natural);
port(A: in std_logic_vector(n-1 downto 0);
	 B: in std_logic_vector(n-1 downto 0);
	 Cin: in std_logic;

	 S: out std_logic_vector(n-1 downto 0);
	 Cout: out std_logic);
end component;

architecture Structural of exp_normalization is

signal overflow_detec: std_logic;
signal norm_compensation: std_logic_vector(7 downto 0);

begin

n_bit_adder_1: n_bit_adder 
	generic map(n=>8)
	port map(A=>exp_A, B=>exp_B, Cin=>'0', );


end Structural;
