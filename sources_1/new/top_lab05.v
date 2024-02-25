`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2024 01:49:59 PM
// Design Name: 
// Module Name: top_lab05
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


module top_lab05(
    input [1:0] SWITCHES,
    input [2:0] BUTTONS,
    output [1:0] LEDS
    );
    // a: switch 0
    // b: switch 1
    //cin buttons 0
    //select buttons 21
    // oput leds 0
    // cout leds 1
    
    
    wire and1, or1, adder1;
    
    and(and1, SWITCHES[0], SWITCHES[1]);
    or(or1, SWITCHES[0], SWITCHES[1]);
    full_adder f1(SWITCHES[0], SWITCHES[1], BUTTONS[0], LEDS[1], adder1);
    mux_4_in m1(and1, or1, adder1, 1'b0, BUTTONS[2], BUTTONS[1], LEDS[0]);
    
endmodule
