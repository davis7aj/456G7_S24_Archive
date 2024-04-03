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
    input clk,
    input [1:0] SWITCHES,
    input [32:0] immediate,
    input branch,
    input zero,
    output reg [7:0] pc
    );
    
    reg reset; // reset is a register holding the last known switch value, if a switch changes, a reset has been triggered
    
    initial begin
        pc = -4; // intializes pc to -4 for the first run as, it should just increment by 4 if starting from the switch[0] = 0 program
        reset = SWITCHES[0];
    end
    
    always @ (posedge clk) begin
        // Determines switch between programs
        if (SWITCHES[0] != reset) begin
            if (SWITCHES[0] == 1'b0) begin
                pc <= 8'h0; // Program 1
            end
            else begin
                pc <= 8'h40; // Program 2
            end
        end
        else begin
            case (branch & zero)
                1'b0: pc <= pc + 4;
                1'b1: pc <= pc + (4 * immediate); // beq
            endcase
        end
        reset <= SWITCHES[0]; // Store switch
     end
endmodule
