`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.12.2023 13:41:55
// Design Name: 
// Module Name: siso_tb
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


module siso_tb();
reg clk,rst,si;
wire so;
siso uut(.clk(clk),.rst(rst),.si(si),.so(so));
initial begin
    clk =1'b0;
    forever #5 clk = ~clk;
end

task initialize;
    {rst,si} = 2'b10;
endtask

task reset;
    begin
        @(negedge clk)
        rst = 1'b1;
        @(negedge clk)
        rst = 1'b0;
    end
endtask

task inputs (input x);
begin
    @(negedge clk)
    si = x;
    //@(negedge clk)
    //si = 1'b0;
end
endtask

initial begin
    initialize;
    reset;
    inputs(1'b1);
    #10;
    inputs(1'b0);
    #10;
    inputs(1'b1);
    #10;
    inputs(1'b0);
    #200 $finish;
end
endmodule
