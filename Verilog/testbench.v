`timescale 1ns / 1ps

module testbench;

wire[2:0] N;
wire[2:0] S;
wire[2:0] W;
wire[2:0] E;

reg clk,rst;

FSM DUT(clk,rst,N,S,W,E);
initial
begin
  //Start clock
  clk = 1'b1;
  forever #5 clk = ~clk;
end

initial
begin
rst=1'b1;
  #15;
  rst=1'b0;
  #1000;
  $stop;
 end
endmodule  