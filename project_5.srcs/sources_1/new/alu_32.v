`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2024 01:24:39 PM
// Design Name: 
// Module Name: alu_32
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



module alu_32(
    input signed [31:0] a,
    input signed [31:0] b,
    input [3:0] ALUctl,
    output reg signed [31:0] result,
    output reg zero,
    output reg overflow,
    output reg carryout
    );
    
    // Direct ALU control to operation
    always @(*) begin
        case (ALUctl)
            4'b0000: result <= a & b;
            4'b0001: result <= a | b;
            4'b0010: result <= a + b;
            4'b0110: result <= a - b;
            default: result <= a & b;
        endcase
        
        // Handles Zero, and Carryout and Overflow for Addition and Subtraction operations.
        carryout <= 0;
        overflow <= 0;
        if (ALUctl == 4'b0010) begin // ADD
            overflow <= ((~a[31] & ~b[31] & result[31]) | (a[31] & b[31] & ~result[31]));
            carryout <= overflow;
        end
        else if (ALUctl == 4'b0110) begin // SUB
            overflow <= ((a[31] & ~b[31] & ~result[31]) | (~a[31] & b[31] & result[31]));
        end
        zero <= (result == 0);
    end
endmodule