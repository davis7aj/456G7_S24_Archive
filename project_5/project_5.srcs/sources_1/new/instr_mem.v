`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2024 01:25:33 PM
// Design Name: 
// Module Name: instr_mem
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

//The instruction memory block should have as input the instruction address, represented
//by the program counter (PC). The PC should come from the pc_compute.v block and it
//should output a 32-bit piece of data (instruction). The instruction memory can use ROM,
//and should have the programs in the final section below hard-coded in at the locations
//specified.

module instr_mem(
    input [7:0] instr_address,
    output reg [31:0] instruction
    );
    
    reg [31:0] memory [72:0];
    
    
    initial begin
        // initialize array to 0?
        memory[0] = 32'b00000010101000000000001010010011; // addi t0, zero, 42
        memory[1] = 32'b00000010000100000000001100010011; // addi t1, zero, 33
        memory[2] = 32'b00000000011000101000001110110011; // add t2, t0, t1
        
        memory[63] = 32'b00000000000000000000010100110011; // add a0, zero, zero
        memory[64] = 32'b00000000000001010010001010000011; // lw t0, 0(a0)
        memory[65] = 32'b00000000010001010010001100000011; // lw t1, 4(a0)
        memory[66] = 32'b00000000010100110000001110110011; // add t2, t1, t0
        memory[67] = 32'b00001111000000111111111000010011; // andi t3, t2, 0xF0
        memory[68] = 32'b00001111000000110110111010010011; // ori t4, t1, 0x0F0
        memory[69] = 32'b 00000000011000101000001110110011; // beq t2, t3, end?
        memory[70] = 32'b00000000010111101000111010110011; // add t4, t4, t0
        memory[71] = 32'b00000001110101010010010000100011; // end: sw t4, 8(a0)
        
    end
    
    always @(*) begin
        case (instr_address)
            8'h0: instruction = memory[0];
            8'h4: instruction = memory[1];
            8'h8: instruction = memory[2];
            
            8'h40: instruction = memory[63];
            8'h44: instruction = memory[64];
            8'h48: instruction = memory[65];
            8'h4C: instruction = memory[66];
            8'h50: instruction = memory[67];
            8'h54: instruction = memory[68];
            8'h58: instruction = memory[69];
            8'h5C: instruction = memory[70];
            8'h60: instruction = memory[71];
        endcase
    end
    // can
endmodule
