`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2024 02:36:05 PM
// Design Name: 
// Module Name: immediate_tb
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


module immediate_tb(
    output [31:0] immediate_val,
    reg signed [31:0] instruction
    );
    immediate imm1(instruction, immediate_val);
    localparam time_step = 10;
    
    initial begin
        // 0000000111000011100000010 110 0011
        instruction = 32'h01c38163;
        #time_step;
        
    end
endmodule