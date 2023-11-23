library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity mantissa_multiplier is
port (
	A: in std_logic_vector(22 downto 0);
	B: in std_logic_vector(22 downto 0);

	result: out std_logic_vector(22 downto 0);
	exp_norm: out std_logic);
end mantissa_multiplier;
									
architecture Structural of mantissa_multiplier is

component mux21 is
	generic (n : natural);
	port (A: in std_logic_vector(n-1 downto 0);
		  B: in std_logic_vector(n-1 downto 0);
		  s: in std_logic;
		  F: out std_logic_vector(n-1 downto 0)
	);
end component;

	signal A_numeric, B_numeric: unsigned(23 downto 0); -- multiplication vectors
	signal result_numeric: unsigned (47 downto 0);
	signal result_std: std_logic_vector(47 downto 0);
	
	begin

		A_numeric <= unsigned('1' & A);
		B_numeric <= unsigned('1' & B);
		result_std <= std_logic_vector(result_numeric(47 downto 0));

		result_numeric <= ( A_numeric) * ( B_numeric);


		mux21_1: mux21 generic map(n=>23)
		port map(A=>result_std(45 downto 23), B=>result_std(46 downto 24), s=>result_std(47), F=>result);
		exp_norm <= result_std(47);



end Structural;