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
    input [31:0] instr_address,
    output reg HALT,
    output reg [31:0] instruction
    );
    
    reg [31:0] memory [72:0];
    
    
    initial begin
        // initialize array to 0?
        memory[0] = 32'b00000010101000000000001010010011; // addi t0, zero, 42 0x00000533
        memory[1] = 32'b00000010000100000000001100010011; // addi t1, zero, 33 
        memory[2] = 32'b00000000011000101000001110110011; // add t2, t0, t1
        
        memory[63] = 32'b00000000000000000000010100110011; // add a0, zero, zero 0x00000533
        memory[64] = 32'h00052283; // lw t0, 0(a0) 0x00052283
        memory[65] = 32'h00452303; // lw t1, 4(a0)
        memory[66] = 32'h005303b3; // add t2, t1, t0
        memory[67] = 32'hF03FE13; // andi t3, t2, 0xF0
        memory[68] = 32'b00001111000000110110111010010011; // ori t4, t1, 0x0F0
        memory[69] = 32'h01c38163; // beq t2, t3, end (ie 2 * 4)
        memory[70] = 32'h5E8EB3; // add t4, t4, t0
        memory[71] = 32'h1D52423; // end: sw t4, 8(a0)
        memory[72] = 32'h0;                                // Halt instr
    end
    
    always @(*) begin
        case (instr_address)
            32'h0: instruction = memory[0];
            32'h4: instruction = memory[1];
            32'h8: instruction = memory[2];
            32'hC: instruction = memory[72];
            
            32'h40: instruction = memory[63];
            32'h44: instruction = memory[64];
            32'h48: instruction = memory[65];
            32'h4C: instruction = memory[66];
            32'h50: instruction = memory[67];
            32'h54: instruction = memory[68];
            32'h58: instruction = memory[69];
            32'h5C: instruction = memory[70];
            32'h60: instruction = memory[71];
            32'h64: instruction = memory[72];
            
            default: instruction = memory[0];
        endcase
        
        if (instruction == 0) begin
            HALT <= 1;
        end
        else begin
            HALT <= 0;
        end
    end
    // can
endmodule
