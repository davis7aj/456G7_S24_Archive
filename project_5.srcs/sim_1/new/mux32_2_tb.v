`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2024 03:17:15 PM
// Design Name: 
// Module Name: mux32_2_tb
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


module mux32_2_tb;
    wire [31:0] out;
    reg [31:0] a;
    reg [31:0] b;
    reg select;
    
    localparam time_step = 20;
    
    mux32_2 mux1(a, b, select, out);
    
    initial begin 
        a = 32'h1;
        b = 32'h0;
        select = 0;
        #time_step;
        select = 1;
        #time_step;
    end
endmodule
