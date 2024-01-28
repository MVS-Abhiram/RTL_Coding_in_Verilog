`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.12.2023 13:37:18
// Design Name: 
// Module Name: siso
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


module siso(clk,rst,si,so);
input clk,rst,si;
output reg so;
reg [3:0]temp;
always @(posedge clk)
begin
    if (rst)
    begin
        temp <= 4'b0000;
        so <= 0;
        end
    else begin
        temp <= {si,temp[3:1]};
        so <= temp[0];
        end   
end
endmodule
