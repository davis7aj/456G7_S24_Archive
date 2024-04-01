`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2024 01:23:47 PM
// Design Name: 
// Module Name: immediate
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


module immediate(
    input signed [31:0] instruction,
    output reg [31:0] immediate_val
    );
    
    always @(*) begin
        case(instruction[6:0])
            7'b0000011: immediate_val <= {{21{instruction[31]}} ,instruction[30:20]};// i type lw
            7'b0010011: immediate_val <= {{21{instruction[31]}} ,instruction[30:20]}; // i type andi/addi
            7'b0100011: immediate_val <= {{21{instruction[31]}}, instruction[30:25], instruction[11:7]}; // S type sw
            7'b1100011: immediate_val <= {{20{instruction[31]}}, instruction[30:25], instruction[11:7], 1'b0}; // SB type beq
            default: immediate_val <= 32'h0; // R type add/sub/and/or, else
        endcase
    end
endmodule
