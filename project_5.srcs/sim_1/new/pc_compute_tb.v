`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2024 04:35:28 PM
// Design Name: 
// Module Name: pc_compute_tb
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


module pc_compute_tb;
    parameter CLK_PERIOD = 10;
    
    reg clk = 0;
    reg [1:0] SWITCHES;
    reg branch, zero;
    reg [31:0] immediate;
    wire [7:0] pc_out;
    localparam time_step = 20;
    
    pc_compute pc1 (clk, SWITCHES[1:0], immediate, branch, zero, pc_out);
    
    always #((CLK_PERIOD / 2)) clk = ~clk;
    
    initial begin
        SWITCHES[0] = 0;
        immediate = 32'b0;
        branch = 0;
        zero = 0;
        #time_step;
        #time_step;
        
        SWITCHES[0] = 1;
        immediate = 2;
        #time_step;
        #time_step;
    end
endmodule
