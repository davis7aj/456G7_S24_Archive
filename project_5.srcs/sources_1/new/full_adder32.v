`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2024 04:03:30 PM
// Design Name: 
// Module Name: full_adder32
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


module full_adder32(
    input [31:0] A, // 32-bit input A
    input [31:0] B, // 32-bit input B
    output reg [31:0] sum, // 32-bit output sum
    output reg carry_out // Carry out
    );
    
    reg carry = 0;
    always @ (A or B) begin
        sum[0] = A[0] ^ B[0] ^ carry;
        carry = (A[0] & B[0]) | (A[0] & carry) | (B[0] & carry);
    
        for (integer i = 1; i < 32; i = i + 1) begin
            sum[i] = A[i] ^ B[i] ^ carry;
            carry = (A[i] & B[i]) | (A[i] & carry) | (B[i] & carry);
        end
        carry_out = carry;
    end
endmodule