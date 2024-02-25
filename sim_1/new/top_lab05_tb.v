`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2024 02:25:34 PM
// Design Name: 
// Module Name: top_lab05_tb
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


module top_lab05_tb;
    reg [1:0] switches;
    reg [2:0] buttons;
    wire [1:0] leds;
    
          
    localparam time_step = 10;

    top_lab05 top_lab05_tb(switches[1:0], buttons[2:0], leds[1:0]);
    
    initial
        begin
        //and
        switches[1:0] = 2'b00; //input
        buttons[2:1] = 2'b00;
        buttons[0] = 1'b0;
        #time_step;
        switches[1:0] = 2'b01; //input
        buttons[2:1] = 2'b00;
        buttons[0] = 1'b0;
        #time_step;
        switches[1:0] = 2'b10; //input
        buttons[2:1] = 2'b00;
        buttons[0] = 1'b0;
        #time_step;
        switches[1:0] = 2'b11; //input
        buttons[2:1] = 2'b00;
        buttons[0] = 1'b0;
        #time_step;
        
        //or
        switches[1:0] = 2'b00;
        buttons[2:1] = 2'b01;
        buttons[0] = 1'b0;
        #time_step;
        switches[1:0] = 2'b01;
        buttons[2:1] = 2'b01;
        buttons[0] = 1'b0;
        #time_step;
        switches[1:0] = 2'b10;
        buttons[2:1] = 2'b01;
        buttons[0] = 1'b0;
        #time_step;
        switches[1:0] = 2'b11;
        buttons[2:1] = 2'b01;
        buttons[0] = 1'b0;
        #time_step;
        
        //add
        switches[1:0] = 2'b00;
        buttons[2:1] = 2'b10;
        buttons[0] = 1'b0;
        #time_step;
        switches[1:0] = 2'b01;
        buttons[2:1] = 2'b10;
        buttons[0] = 1'b0;
        #time_step;
        switches[1:0] = 2'b10;
        buttons[2:1] = 2'b10;
        buttons[0] = 1'b0;
        #time_step;
        switches[1:0] = 2'b11;
        buttons[2:1] = 2'b10;
        buttons[0] = 1'b0;
        #time_step;
        
        
        end
endmodule
