`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Alex Stone and Andrew Davis
// 
// Create Date: 02/08/2024 12:46:30 PM
// Design Name: 
// Module Name: full_adder
// Project Name: Project 1
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

// 1 bit adder
module full_adder(
    input a,
    input b,
    input c_in,
    output c_out, 
    output sum
    );
    
    wire xor1, and1, and2;
    
    xor(xor1, a, b);
    xor(sum, xor1, c_in);
    and(and1, xor1, c_in);
    and(and2, a, b);
    or(c_out, and1, and2);
endmodule