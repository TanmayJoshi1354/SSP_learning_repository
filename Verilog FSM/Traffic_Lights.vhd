----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.08.2021 17:37:25
-- Design Name: 
-- Module Name: Traffic_Lights - Behavioral
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

entity Traffic_Lights is
    Port ( I0 : in STD_LOGIC;
           I1 : in STD_LOGIC;
           b0,b1: buffer STD_LOGIC:='0';
           O0 : out STD_LOGIC;
           O1 : out STD_LOGIC);
end Traffic_Lights;

--PROJECT DESCRIPTION--
--There are 2 direcgtions of the traffic signals, namely North-South and East-West.
--These account for four states of the pair of signals. These are:
--1.NS Green, EW Red.
--2.NS Yellow, EW Red.
--3.NS Red, EW Green.
--4.NS Red, EW Yellow.
--The next state after transition depends on the current state and the current input, which
--represents the traccif in the given directions, as follows:
-- 00 => No traffic ; 01 => Traffic towards North ; 10 => Traffic towards East ; 11 => Both
--Now following general traffic rules, when switching from green in one direction to 
--green in the other, we shall pass yellow in the other.
--A table of the states to be transitioned to, corresponding to current inputs and current 
--state, can thus be formed as follows:
--  STATE     INPUTS
--         00 01 10 11
--   00    00 00 01 01
--   01    10 10 10 10
--   10    11 11 10 11 
--   11    00 00 00 00  

architecture trafficLightsfsm of Traffic_Lights is
    
begin
    traffic: process 
    --variable S0,S1: std_logic;
    begin   
        
        If i0='0' and i1='0' then
            if b0='0' and b1='0' then
                o0<='0';
                o1<='0';
                b0<='0';
                b1<='0';
            elsif b0='1' and b1='0' then
                o0<='0';
                o1<='0';
                b0<='0';
                b1<='0';
            elsif b0='0' and b1='1' then
               o0<='1';
               o1<='0';
               b0<='1';
               b1<='0';
            elsif b0='1' and b1='1' then
                o0<='1';
                o1<='0';
                b0<='1';
                b1<='0';
            end if;
        elsif i0='1' and i1='0' then
            if b0='0' and b1='0' then
                o0<='0';
                o1<='1';
                b0<='0';
                b1<='1';
            elsif b0='1' and b1='0' then
                o0<='0';
                o1<='1';
                b0<='0';
                b1<='1';
            elsif b0='0' and b1='1' then
                o0<='0';
                o1<='1';
                b0<='0';
                b1<='1';
            elsif b0='1' and b1='1' then
                o0<='0';
                o1<='1'; 
                b0<='0';
                b1<='1';                                     
            end if;
        elsif i0='0' and i1='1' then
            if b0='0' and b1='0' then
                o0<='1';
                o1<='1';
                b0<='1';
                b1<='1';
            elsif b0='1' and b1='0' then
                o0<='1';
                o1<='1';
                b0<='1';
                b1<='1';
            elsif b0='0' and b1='1' then
                o0<='0';
                o1<='1';
                b0<='0';
                b1<='1';
            elsif b0='1' and b1='1' then
                o0<='1';
                o1<='1';    
                b0<='1';
                b1<='1';                                  
            end if;
        elsif i0='1' and i1='1' then
            if b0='0' and b1='0' then
                o0<='0';
                o1<='0';
                b0<='0';
                b1<='0';
            elsif b0='1' and b1='0' then
                o0<='0';
                o1<='0';
                b0<='0';
                b1<='0';
            elsif b0='0' and b1='1' then
                o0<='0';
                o1<='0';
                b0<='0';
                b1<='0';
            elsif b0='1' and b1='1' then
                o0<='0';
                o1<='0'; 
                b0<='0';
                b1<='0';                                     
            end if;   
        end if;       
    wait for 1ps;                                   
    end process;   
end trafficLightsfsm;
