entity unpack is
port (
		A: in std_logic_vector(31 downto 0);
		
		sign: out std_logic;
		mantissa: out std_logic_vector(22 downto 0);
		exponent: out std_logic_vector(7 downto 0));
end unpack;

architecture Structural of floating_point_multiplier is

begin
-- 31: Sign Bit
-- 30 - 23: Exponent
-- 22 - 0: Mantissa

sign <= A(31);
mantissa <= A(22 downto 0);
exponent <= A(7 downto 0);

end Structural;