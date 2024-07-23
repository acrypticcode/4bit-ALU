----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/03/2023 08:32:08 PM
-- Design Name: 
-- Module Name: toplevel - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity toplevel is
    Port ( sw1 : in STD_LOGIC_VECTOR (3 downto 0);
           sw2 : in STD_LOGIC_VECTOR (3 downto 0);
           carry_in : in STD_LOGIC;
           control : in STD_LOGIC_VECTOR (1 downto 0);
           segments : out STD_LOGIC_VECTOR (6 downto 0);
           anodes : out STD_LOGIC_VECTOR (3 downto 0);
           clk : in STD_LOGIC);
end toplevel;

architecture Structural of toplevel is

--Component Declaration
component adder is
    Port ( sw1 : in STD_LOGIC_VECTOR (3 downto 0);
           sw2 : in STD_LOGIC_VECTOR (3 downto 0);
           sum : out STD_LOGIC_VECTOR (4 downto 0);
           carry_in : in STD_LOGIC);
end component adder;

component ANDer is
    Port ( sw1 : in STD_LOGIC_VECTOR (3 downto 0);
           sw2 : in STD_LOGIC_VECTOR (3 downto 0);
           s : out STD_LOGIC_VECTOR (3 downto 0));
end component ANDer;

component ORer is
    Port ( sw1 : in STD_LOGIC_VECTOR (3 downto 0);
           sw2 : in STD_LOGIC_VECTOR (3 downto 0);
           s : out STD_LOGIC_VECTOR (3 downto 0));
end component ORer;

component XORer is
    Port ( sw1 : in STD_LOGIC_VECTOR (3 downto 0);
           sw2 : in STD_LOGIC_VECTOR (3 downto 0);
           s : out STD_LOGIC_VECTOR (3 downto 0));
end component XORer;

component display_driver is
    Port ( inputs : in  STD_LOGIC_VECTOR (3 downto 0);
           seg_out : out  STD_LOGIC_VECTOR (6 downto 0));
end component display_driver;

component LEDdisplay IS
	PORT (
		  clk					: IN  STD_LOGIC;
		  seg0,seg1,seg2,seg3		: IN  STD_LOGIC_VECTOR(6 downto 0);
        seg       		: OUT  STD_LOGIC_VECTOR(6  downto 0);
		  an					: OUT STD_LOGIC_VECTOR(3 downto 0));		  
END component LEDdisplay;

component function_select is
    Port ( Input0 : in  STD_LOGIC_VECTOR (3 downto 0);
           Input1 : in  STD_LOGIC_VECTOR (3 downto 0);
			  Input2 : in  STD_LOGIC_VECTOR (3 downto 0);
           Input3 : in  STD_LOGIC_VECTOR (4 downto 0);
           control : in  STD_LOGIC_VECTOR (1 downto 0);
           Output : out  STD_LOGIC_VECTOR (4 downto 0));
end component function_select;

--Signal Declaration
signal sAND: STD_LOGIC_VECTOR (3 downto 0);
signal sOR: STD_LOGIC_VECTOR (3 downto 0);
signal sXOR: STD_LOGIC_VECTOR (3 downto 0);
signal sADD: STD_LOGIC_VECTOR (4 downto 0);
signal s: STD_LOGIC_VECTOR(4 downto 0);
--signal s: STD_LOGIC_VECTOR(3 downto 0);
signal sig_segments1: STD_LOGIC_VECTOR (6 downto 0);
signal sig_segments2: STD_LOGIC_VECTOR (6 downto 0);

begin

--Component Instantiation
add: adder
    port map(sw1 => sw1,
    sw2 => sw2,
    carry_in => carry_in,
    sum => sADD);

or4bit: ORer
    port map(sw1 => sw1,
    sw2 => sw2,
    s => sOR);
    
and4bit: ANDer
        port map(sw1 => sw1,
        sw2 => sw2,
        s => sAND);
        
xor4bit: XORer
        port map(sw1 => sw1,
        sw2 => sw2,
        s => sXOR);
    
fselect: function_select
    port map(control => control,
    Input0 => sAND,
    Input1 => sOR,
    Input2 => sXOR,
    Input3 => sADD,
    Output => s);
    
dd1: display_driver
    port map(inputs => s(3 downto 0),
    seg_out => sig_segments1);
    
dd2: display_driver
    port map(inputs(0) => s(4),
    inputs(3 downto 1) => "000",
    seg_out => sig_segments2);

LED: LEDdisplay
    port map(clk => clk,
    seg0 => sig_segments1,
    seg1 => sig_segments2,
    seg2 => "1111111",
    seg3 => "1111111",
    seg => segments,
    an => anodes);

end Structural;
