library IEEE;
use IEEE.Std_Logic_1164.all;

entity floating_point_multiplier is
port (
	A: in std_logic_vector(31 downto 0);
	B: in std_logic_vector(31 downto 0);

	result: out std_logic_vector(31 downto 0)); 
end floating_point_multiplier;

architecture Structural of floating_point_multiplier is

component unpack is
port (
		A: in std_logic_vector(31 downto 0);
		
		sign: out std_logic;
		mantissa: out std_logic_vector(22 downto 0);
		exponent: out std_logic_vector(7 downto 0));
end component;

component mantissa_multiplier is
port (
	A: in std_logic_vector(22 downto 0);
	B: in std_logic_vector(22 downto 0);

	result: out std_logic_vector(22 downto 0);
	exp_norm: out std_logic);
end component;

component pack is
port (
		sign: in std_logic;
		mantissa: in std_logic_vector(22 downto 0);
		exponent: in std_logic_vector(7 downto 0));

		A: out std_logic_vector(31 downto 0);
end component;

signal A_sign, B_sign, C_sign: std_logic;
signal A_mantissa, B_mantissa, C_mantissa: std_logic_vector(22 downto 0); 
signal A_exponent, B_exponent, C_exponent: std_logic_vector(7 downto 0);

signal mult_exp_norm: std_logic;

begin

-- Unpacking

unpack_A: unpack port map(A=>A, sign=>A_signal, mantissa=>A_mantissa, exponent=>A_exponent);

unpack_B: unpack port map(A=>B, sign=>B_signal, mantissa=>B_mantissa, exponent=>B_exponent);


-- Mantissa multiplication

mantissa_multiplier_1: mantissa_multiplier port_map(A=>A_mantissa, B=>B_mantissa, result=>C_mantissa, exp_norm=>mult_exp_norm);

-- Exponent normalization

-- Sign bit

C_sign <= A_sign xor B_sign;

-- Packing

pack_C: pack port map(sign=>C_signal, mantissa=>C_mantissa, exponent=>C_exponent, result);

end Structural;