----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/03/2023 06:26:07 PM
-- Design Name: 
-- Module Name: adder - Structural
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

entity adder is
    Port ( sw1 : in STD_LOGIC_VECTOR (3 downto 0);
           sw2 : in STD_LOGIC_VECTOR (3 downto 0);
           sum : out STD_LOGIC_VECTOR (4 downto 0);
           carry_in : in STD_LOGIC);
end adder;

architecture Structural of adder is

--Component Declaration
component bit_full_adder is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           S : out STD_LOGIC;
           Cout : out STD_LOGIC);
      
end component bit_full_adder;

--Signal Declaration
signal s: STD_LOGIC_VECTOR (3 downto 0);
signal c: STD_LOGIC_VECTOR (3 downto 0);

begin
--Component Instantiation
bit_full_adder0: bit_full_adder
    port map(A => sw1(0),
    B => sw2(0),
    Cin => carry_in,
    S => sum(0),
    Cout => c(0)
    );
    
bit_full_adder1: bit_full_adder
    port map(A => sw1(1),
    B => sw2(1),
    Cin => c(0),
    S => sum(1),
    Cout => c(1)
    );
    
bit_full_adder2: bit_full_adder
    port map(A => sw1(2),
    B => sw2(2),
    Cin => c(1),
    S => sum(2),
    Cout => c(2)
    );
        
bit_full_adder3: bit_full_adder
    port map(A => sw1(3),
    B => sw2(3),
    Cin => c(2),
    S => sum(3),
    Cout => sum(4)
    --Cout => c(3)
    );

end Structural;
