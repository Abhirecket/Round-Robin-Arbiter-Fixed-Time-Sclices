`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.11.2023 12:34:57
// Design Name: 
// Module Name: tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb;
  reg clk;
  reg rst_n;
  reg [3:0] REQ;
  wire [3:0] GNT;
  

  
  top dut(.clk(clk), .rst_n(rst_n), .REQ(REQ), .GNT(GNT));
  
 
  always #5 clk = ~clk;
  

  
  initial begin
    clk = 0;
    rst_n = 1;
    REQ = 4'b0;

    #10 rst_n = 0;
 
    #5 rst_n = 1;
    
    @(negedge clk) REQ = 4'b0010;    
    
    @(negedge clk) REQ = 4'b1011;
    
    @(negedge clk) REQ = 4'b1010;
    
    @(negedge clk) REQ = 4'b0010;
    @(negedge clk) REQ = 4'b0010;
    @(negedge clk) REQ = 4'b0010;
    @(negedge clk) REQ = 4'b0010;
    
    @(negedge clk) REQ = 4'b1110;
    
    @(negedge clk) REQ = 4'b1011;
    
    @(negedge clk) REQ = 4'b1111;
    
    @(negedge clk) REQ = 4'b0100;
    
    #5 rst_n = 0;
    
    #100 $finish;
  end
    
endmodule
    
    
  
