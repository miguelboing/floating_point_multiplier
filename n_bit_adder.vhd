library IEEE;
use IEEE.Std_Logic_1164.all;

entity n_bit_adder is
generic (n : natural);
port(A: in std_logic_vector(n-1 downto 0);
	 B: in std_logic_vector(n-1 downto 0);
	 Cin: in std_logic;

	 S: out std_logic_vector(n-1 downto 0);
	 Cout: out std_logic);
end entity n_bit_adder;

architecture Structural of n_bit_adder is

component fulladder is
port(A: in std_logic; 
B: in std_logic;
Cin: in std_logic; 
S: out std_logic; 
Cout: out std_logic);
end component;

signal Cout_int: std_logic_vector(n-2 downto 0);

begin

FA_1: fulladder port map(A=>A(0), B=>B(0), Cin=>Cin, S=>S(0), Cout=>Cout_int(0)); 

FA_f: for i in 1 to n-2 generate
	FA_i: fulladder port map(A=>A(i), B=>B(i), Cin=>Cout_int(i-1), S=>S(i), Cout=>Cout_int(i)); 
end generate;

FA_n: fulladder port map(A=>A(n-1), B=>B(n-1), Cin=>Cout_int(n-2), S=>S(n-1), Cout=>Cout); 

end Structural;

