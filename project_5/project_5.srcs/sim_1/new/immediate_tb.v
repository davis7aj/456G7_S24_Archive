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
        #time_step;
        instruction = 32'h03C38463;
        #time_step;
        instruction = 32'h0005A303;
        #time_step;
    end
endmodule