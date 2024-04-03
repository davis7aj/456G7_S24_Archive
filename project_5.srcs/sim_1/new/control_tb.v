`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2024 02:51:47 PM
// Design Name: 
// Module Name: control_tb
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


module control_tb;
    wire [7:0] control_out;
    reg [6:0] I;
    
    control control1(I, control_out);
    
    localparam time_step = 20;

    initial begin
        I = 7'b0110011;
        #time_step;
        I = 7'b0110011;
        #time_step;
        I = 7'b0000011;
        #time_step;
        I = 7'b0100011;
        #time_step;
        I = 7'b1100011;
        #time_step;
        I = 7'b0010011;
        #time_step;
    end
endmodule
