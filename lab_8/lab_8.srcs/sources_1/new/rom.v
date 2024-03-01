`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Alex Stone and Andrew Davis
// 
// Create Date: 03/01/2024 01:44:27 PM
// Design Name: Asynchronous Rom
// Module Name: rom
// Project Name: Lab 8
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


module rom (input [6:0] address, output reg [31:0] data); 
  always @(*) begin
    case(address)
        7'h00: data = 32'h02A00293;
        7'h04: data = 32'h02100313;
        7'h08: data = 32'h006283b3;
        7'h40: data = 32'h00000533;
        7'h44: data = 32'h00450593;
        7'h48: data = 32'h00052283;
        7'h4C: data = 32'h0005a303;
        7'h50: data = 32'h005303B3;
        7'h54: data = 32'h0F03FE13;
        7'h58: data = 32'h0F036E93;
        7'h5C: data = 32'h01C38463;
        7'h60: data = 32'h005E8EB3;
        7'h64: data = 32'h01d5a223;
        default: data = 32'h0;
   endcase 
  end
endmodule
