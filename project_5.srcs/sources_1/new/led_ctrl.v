`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2024 07:55:05 PM
// Design Name: 
// Module Name: led_ctrl
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


module led_ctrl(
    input clk,
    input [5:0] in,
    output reg [5:0] out
    );
    
    always @(posedge clk) begin
        out <= in;
    end
endmodule
