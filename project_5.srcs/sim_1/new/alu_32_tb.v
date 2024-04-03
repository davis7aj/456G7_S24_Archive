`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2024 05:05:38 PM
// Design Name: 
// Module Name: alu_32_tb
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


module alu_32_tb;
    wire [31:0] result;
    wire zero;
    wire overflow;
    wire carryout;
    reg signed [31:0] a;
    reg signed [31:0] b;
    reg [3:0] ALUctl;
    
    alu_32 alu32(a, b, ALUctl, result, zero, overflow, carryout);
    localparam time_step = 20;
    
    initial begin
        a = 32'b0;
        b = 32'b1;
        ALUctl = 4'b0;
        #time_step;
        a = 32'b1;
        b = 32'b1;
        ALUctl = 4'b0;
        #time_step;
        a = 32'b0;
        b = 32'b1;
        ALUctl = 4'b0001;
        #time_step;
        a = 32'b1;
        b = 32'b1;
        ALUctl = 4'b0010;
        #time_step;
        a = 32'b1;
        b = 32'b1;
        ALUctl = 4'b0010;
        #time_step;
    end
    
endmodule
