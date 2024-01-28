`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.01.2024 10:20:16
// Design Name: 
// Module Name: siso_shl_buf
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


module siso_shl_buf(clk,rst,din,dout);
input clk,rst,din;
output reg dout;
// 4 bit register
parameter bits = 4;
// Internal counter for counting clock pulse
reg [bits-1:0] q;
reg [1:0] count;

always @(posedge clk or posedge rst)
  begin
    // initialize to zero when reset
    if (rst)
    begin
      q <= 0;
      dout <= 0;
      count <= 0;
    end
    // First two clocl cycles shift left
    else if (count < 2)
    begin
      q <= {q[bits-2:0], din};
      dout <= din;
      count <= count + 1'b1;
    end
    // When count is equ to 2 act as buffer 
    else if (count == 2)
    begin
      q <= q;
      dout <= dout;
      count <= count + 1'b1;
    end
    // When count is equ to 3 act as buffer 
    else if (count == 3)
    begin
      q <= q;
      dout <= dout;
      // When counter reaches max value reset to 0
      count <= 2'd0;
    end
  end
endmodule
