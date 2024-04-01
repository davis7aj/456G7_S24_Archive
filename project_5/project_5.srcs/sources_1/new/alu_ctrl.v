`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2024 01:24:19 PM
// Design Name: 
// Module Name: alu_ctrl
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

//This circuit should generate the alu control lines from the instruction input and output
//the ALUOp lines as appropriate in the diagram and tables above. The intention is to use
//a modification of the alu design from a previous project. The NOR functionality is not
//required for this project.

module alu_ctrl(
    input [1:0] ALUOp,
    input [9:0] FuncCode,
    output reg [3:0] out
    );
    
    // distinguishing andi addi?
    
    always @(*)
    case (ALUOp)
        2'd0: out <= 4'b0010; // lw sw
        2'd1: out <= 4'b0110; // beq
        2'd2:
            case (FuncCode)
                10'b0000000111: out <= 4'b0000; // AND
                10'b0000000110: out <= 4'b0001; // OR
                10'b0000000000: out <= 4'b0010; // ADD
                10'b0100000000: out <= 4'b0110; // SUBTRACT
                default:        out <= 4'b0000; // Default
            endcase
    endcase
endmodule
