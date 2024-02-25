`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2024 01:56:01 PM
// Design Name: 
// Module Name: simple_mux
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


module simple_mux(input [1:0] x, output reg y);
    always @(*) begin
        y = 2'd0;
        if(x == 2'b10) begin
            y = 2'd3;
        end else if(x == 2'b11) begin
            y = 2'd2;
        end
    end
endmodule
