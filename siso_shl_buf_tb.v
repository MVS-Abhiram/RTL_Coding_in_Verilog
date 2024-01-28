`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.01.2024 10:33:51
// Design Name: 
// Module Name: siso_shl_buf_tb
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


module siso_shl_buf_tb();
reg clk,rst,din;
wire dout;
// Instantiating the module
siso_shl_buf uut (clk,rst,din,dout);
// Clock generation
initial begin
    clk= 1'b0;
    while(1)
    #10 clk = ~clk;
end
// Initialize Task
task initialize();
begin
    {rst,din} = 2'b10;
end
endtask

//Task for reset
task reset();
begin
    @(negedge clk)
    rst = 1'b1;
    @(negedge clk)
    rst = 1'b0;
end
endtask
// Task Inputs
task inputs ();
begin
    @(negedge clk)
    din = 1'b1;
    @(negedge clk)
    din = 1'b1;
    @(negedge clk)
    din = 1'b1;
    @(negedge clk)
    din = 1'b1;
end
endtask
// Calling the Tasks
initial begin
    initialize();
    reset();
    inputs();
end
endmodule
