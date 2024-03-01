`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/01/2024 02:17:53 PM
// Design Name: 
// Module Name: rom_tb
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


module rom_tb();
    wire [31:0] address;
    reg  [6:0] in;
    
    rom rom_tb(in, address);
    
    localparam time_step = 10;

    initial begin
        in = 7'h00;
        #time_step;
        in = 7'h04;
        #time_step;
        in = 7'h08;
        #time_step;
        in = 7'h40;
        #time_step;
        in = 7'h44;
        #time_step;
        in = 7'h48;
        #time_step;
        in = 7'h4C;
        #time_step;
        in = 7'h50;
        #time_step;
        in = 7'h54;
        #time_step;
        in = 7'h58;
        #time_step;
        in = 7'h5C;
        #time_step;
        in = 7'h60;
        #time_step;
        in = 7'h64;
    end
endmodule
