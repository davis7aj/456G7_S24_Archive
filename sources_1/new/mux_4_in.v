`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2024 02:08:32 PM
// Design Name: 
// Module Name: mux_4_in
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


module mux_4_in(
    input d0,
    input d1,
    input d2,
    input d3,
    input s0,
    input s1,
    output out
    );
    
    wire and0, and1, and2, and3, not0, not1;
    not n0(not0, s0);
    not n1(not1, s1);
    and i0(and0, not1, not0, d0);
    and i1(and1, not1, s0, d1);
    and i2(and2, not0, s1, d2);
    and i3(and3, s0, s1, d3);
    or(out, and0, and1, and2, and3);
    
endmodule
