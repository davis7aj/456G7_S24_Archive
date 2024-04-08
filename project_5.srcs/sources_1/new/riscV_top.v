`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2024 01:23:36 PM
// Design Name: 
// Module Name: riscV_top
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

module riscV_top(
    input clk,
    input [1:0] SWITCHES,
    output wire [5:0] LEDS
    );
    
    wire [31:0] pc_out;          // Output of pc_compute
    wire [31:0] instruction;     // Output of instr_mem
    wire HALT;
    instr_mem   instr_mem_1({pc_out[31:7], SWITCHES[0], pc_out[5:0]}, HALT, instruction);
    
    wire [31:0] imm_val;         // Output of immediate
    immediate   imm_1(instruction, imm_val);
    
    wire [7:0] control_out;      // Output of control
    control     control_1(instruction[6:0], control_out);
    
    wire [4:0] alu_ctrl_out;     // Output of ALU_Ctrl
    alu_ctrl    alu_ctrl_1(control_out[1:0], {instruction[30], instruction[14:12]}, alu_ctrl_out);

    wire [31:0] read_data_reg_1; // Output of reg_file, Read data 1, 
    wire [31:0] read_data_reg_2; // Output of reg_file, Read data 2
    reg_file    reg_file_1(instruction[19:15], instruction[24:20], instruction[11:7], mem_mux_out, control_out[5], read_data_reg_1, read_data_reg_2);
    
    wire [31:0] reg_mux_out;     // Output of reg_mux, Immediate or Read data 2 to ALU32
    mux32_2     reg_mux(imm_val, read_data_reg_2, control_out[7], reg_mux_out); // 1 - immediate, 0 - read_data_2, ALUSrc
    
    wire carryout;               // Output flag of alu
    wire overflow;               // Output flag of alu
    wire zero;                   // Output flag of alu
    wire [31:0] alu_out;         // Output of ALU32
    alu_32      alu_32_1(read_data_reg_1, reg_mux_out, alu_ctrl_out, alu_out, zero, overflow, carryout);
    
    wire [31:0] read_data_mem;   // Output of data_mem, Read Data
    data_mem    data_mem_1(control_out[3], control_out[4], {alu_out[31:7], SWITCHES[1], alu_out[5:0]}, read_data_reg_2, read_data_mem);
    
    wire [31:0] mem_mux_out;     // Output of Mem mux, Alu result or write_data
    mux32_2     mem_mux(read_data_mem, alu_out, control_out[6], mem_mux_out); // 1 - read data, 0 - alu result, MemToReg];
    
    pc_compute  pc_1(clk, imm_val, control_out[2], zero, HALT, pc_out);
    
    led_ctrl led_ctl(clk, HALT, mem_mux_out[5:0], LEDS);
endmodule
