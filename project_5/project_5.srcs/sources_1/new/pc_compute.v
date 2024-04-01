`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2024 01:25:17 PM
// Design Name: 
// Module Name: pc_compute
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


// The pc_compute.v block should have the two alu's needed to compute the program
// counter (PC) change including the branch along with the program counter. It should have
// an input of the clock, a way to reset the program counter to a known address based on
// the switch, and an output of the program counter value. The PC should be initialized as
// all zeros except for the bit indicating the difference in the addresses between the two
// programs below, Instruction Address[6]. This single address bit should come from the
// SWITCHES[0] so that it can choose which program will run. The address bits above a6
// will be zero if the computation works correctly.

module pc_compute(
    input sysclk,
    input SWITCHES[1:0],
    input reset,
    output reg [7:0] address
    );
    
    reg [7:0] p1;
    reg [7:0] p2;
    
    initial begin
        p1 = 0;
        p2 = 0;
    end
    
    localparam p1_address_diff = 1 <<6;
    localparam p2_address_diff = 0;
    
//    always @(*) begin
//        if (SWITCHES[0] == 1'b1)
//        end
//        else 
//        end
        
//        if (SWITCHES[0] == 1'b0)
//        end
//        else 
//        end
//    end
    
//    always @(posedge sysclk or posedge reset) begin
//        if (reset)
//            address <= 
//        end
//        else begin
//            if (SWITCHES[0] == 1'b1)
//            end
//            else
//            end
//        end
//    end
endmodule
