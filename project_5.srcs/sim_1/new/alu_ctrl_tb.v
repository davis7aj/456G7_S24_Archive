`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2024 01:28:32 PM
// Design Name: 
// Module Name: alu_ctrl_tb
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


module alu_ctrl_tb;
    wire [3:0] out;
    reg [1:0] ALUOp;
    reg [3:0] FuncCode;
    
    localparam time_step = 20;
    
    alu_ctrl ctrl(ALUOp, FuncCode, out);
    
    initial begin
        ALUOp = 2'b0;
        FuncCode = 4'b0;
        #time_step;
        ALUOp = 2'b1;
        FuncCode = 4'b0;
        #time_step;
        ALUOp = 2'd2;
        FuncCode = 4'b0;
        #time_step;
    end
endmodule
