`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2024 03:14:56 PM
// Design Name: 
// Module Name: mux32_2
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


module mux32_2 (
    input [31:0] a,
    input [31:0] b,
    input select,
    output reg [31:0] out
);

always @(*) begin
    if (select)
        out <= a;
    else
        out <= b;
end

endmodule
