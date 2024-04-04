`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2024 02:55:47 PM
// Design Name: 
// Module Name: instr_mem_tb
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


module instr_mem_tb;
    wire [31:0] instruction;
    wire HALT;
    reg [31:0] instr_address;
    
    localparam time_step = 20;
    
    instr_mem instr_mem1(instr_address, HALT, instruction);
    
    initial begin
        #time_step;
        instr_address = 32'h0;
        #time_step;
        instr_address = 32'h4;
        #time_step;
        instr_address = 32'h40;
        #time_step;
        instr_address = 32'h5C;
        #time_step;
    end
endmodule
