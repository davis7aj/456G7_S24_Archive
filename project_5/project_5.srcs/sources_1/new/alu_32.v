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
    
    reg signed [32:0] temp_result;
    // Direct ALU control to operation
    always @(*) begin
        
    end
endmodule

module aluV_8(
    input signed [7:0] a,
    input signed [7:0] b,
    input [3:0] ALUctl,
    output reg signed [7:0] result,
    output reg zero,
    output reg overflow,
    output reg carryout
    );
    
    reg signed [8:0] temp_result;
    
    // Direct ALU control to operation
    always @(*) begin
        case (ALUctl)
            4'b0000: result <= a & b;
            4'b0001: result <= a | b;
            4'b0010: result <= a + b;
            4'b0110: result <= a - b;
            4'b0111: result <= (a < b) ? 8'b00000001 : 8'b0;
            4'b1100: result <=   ~(a | b);
        endcase
        
        // Handles Zero, and Carryout and Overflow for Addition and Subtraction operations.
        carryout = 0;
        overflow = 0;
        if (ALUctl == 4'b0010) begin // ADD
            overflow = ((~a[7] & ~b[7] & result[7]) | (a[7] & b[7] & ~result[7]));
            carryout = overflow;
        end
        else if (ALUctl == 4'b0110) begin // SUB
            overflow = ((a[7] & ~b[7] & ~result[7]) | (~a[7] & b[7] & result[7]));
        end
        zero = (result == 0);
    end
endmodule
