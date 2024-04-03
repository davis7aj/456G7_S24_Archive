`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2024 01:24:03 PM
// Design Name: 
// Module Name: control
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


module control(
    input [6:0] I,
    output reg [7:0] out
    );
    
    // out key
    // out[7]   = ALUSrc
    // out[6]   = MemtoReg
    // out[5]   = RegWrite
    // out[4]   = MemRead
    // out[3]   = MemWrite
    // out[2]   = Branch
    // out[1:0] = ALUOp
    
    
    always @(*)
    case (I)
        7'b0110011: out <= 8'b00100010; // R-format
        7'b0000011: out <= 8'b11110000; // lw
        7'b0100011: out <= 8'b10001000; // sw
        7'b1100011: out <= 8'b00000101; // beq
        7'b0010011: out <= 8'b10100010; // addi/andi
        default:    out <= 8'h0;
    endcase
endmodule
