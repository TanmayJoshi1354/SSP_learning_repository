----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.08.2021 18:32:32
-- Design Name: 
-- Module Name: TrafficLights_tb - Behavioral
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

entity TrafficLights_tb is
--  Port ( );
end TrafficLights_tb;

architecture Behavioral of TrafficLights_tb is
    component Traffic_Lights is
        Port (  I0 : in STD_LOGIC;
                I1 : in STD_LOGIC;
                B0,B1 : buffer std_logic;
                O0 : out STD_LOGIC;
                O1 : out STD_LOGIC);
    end component;
    signal I0,I1: std_logic;
    signal O0,O1: std_logic ;
    signal b0,b1: std_logic;
    
begin
    uut: Traffic_Lights port map(I0=>I0,I1=>I1,B0=>B0,B1=>B1,O0=>O0,O1=>O1);
    traffic: process --(I0,I1,O0,O1)
    begin
        B0<='1';
        B1<='0';
        I0<='0';
        I1<='1';
        wait for 10ns;
        if b0='0' and b1='1' then
            wait for 50ns;
        elsif b0='1' and b1='0' then
            wait for 10ns;
        elsif b0='0' and b1='1' then
            wait for 50ns;
        elsif b0='1' and b1='1' then
            wait for 10ns; 
        end if;           
    end process traffic;    

end Behavioral;
