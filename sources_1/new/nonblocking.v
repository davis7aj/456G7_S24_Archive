`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2024 01:54:30 PM
// Design Name: 
// Module Name: nonblocking
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


module nonblocking (
    input in,
    output reg out
    );
          
    reg q1, q2;
    
    
    always @(in) begin
      q1 = in;
      q2 = q1;
      out = q2;
    end
endmodule

