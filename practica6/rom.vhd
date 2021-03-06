library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.ALL;

ENTITY practica6 IS
	PORT(
		addr : IN std_logic_vector(3 DOWNTO 0); --estado presente
		prueba : OUT std_logic_vector(1 DOWNTO 0); --va a multiplexorEntradas
		VF : OUT std_logic; --va a un XNOR
		liga : OUT std_logic_vector(3 DOWNTO 0); --va a MUX
		instruccion : OUT std_logic_vector(1 DOWNTO 0); --va a logica interna
		salidaincrementa : OUT std_logic_vector(5 DOWNTO 0); --va a multiplexorSalidas
		salidacarga : OUT std_logic_vector(5 DOWNTO 0) --va a multiplexorSalidas
	);
END practica6;

ARCHITECTURE behavioral OF practica6 IS
	TYPE mem_rom IS ARRAY(0 TO 14) OF std_logic_vector(20 DOWNTO 0); --memoria/matriz/ROM 
	SIGNAL data_out : mem_rom; --declara data_out del tipo memoria rom
	--SIGNAL prueba : std_logic_vector(1 DOWNTO 0); 
BEGIN
	data_out(0) <= "000000000000000100000";
	data_out(1) <= "001011101111100111100";
	data_out(2) <= "000000000000000110000";
	data_out(3) <= "000000000000000010100";
	data_out(4) <= "000000010000010000000";
	data_out(5) <= "011101001010100010101";
	data_out(6) <= "111001001100100000000";
	data_out(7) <= "101011111000010100010";
	data_out(8) <= "111000101000001000000";
	data_out(9) <= "101100111010100110101";
	data_out(10) <= "111000001000000000000";
	data_out(11) <= "000000010001000000000";
	data_out(12) <= "111000001001000000000";
	data_out(13) <= "111000001001000000000";
	data_out(14) <= "111000001001000000000";
	
	PROCESS(addr) BEGIN
		prueba <= data_out(conv_integer(addr))(20 DOWNTO 19);
		VF <= data_out(conv_integer(addr))(18);
		liga <= data_out(conv_integer(addr))(17 DOWNTO 14);
		instruccion <= data_out(conv_integer(addr))(13 DOWNTO 12);
		salidaincrementa <= data_out(conv_integer(addr))(11 DOWNTO 6);
		salidacarga <= data_out(conv_integer(addr))(5 DOWNTO 0);
	END PROCESS;
END ARCHITECTURE behavioral;
	