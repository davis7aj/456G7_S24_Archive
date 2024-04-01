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
    input sysclk,
    input [1:0] SWITCHES,
    output [5:0] LEDS
    );
    reg [31:0] dm_mux_out;
    
    
    pc_compute();
    
    //adder imm 4 and pc result
    
    reg [31:0] instruction;
    instr_mem(address, instruction);
    
    
    reg [31:0] imm_val;
    immediate(instruction, imm_val);
    
    // second adder
    
    reg [7:0] control_out;
    control(instruction[6:0], control_out);
    // mux back to pc
    
    reg [7:0] alu_ctrl_out;
    alu_ctrl(control_out[1:0], funccode, alu_ctrl_out);
    
    reg write_data;
    reg read_data_1;
    reg read_data_2;
    reg_file(instruction[19:15], instruction[24:20], instruction[11:7], dm_mux_out, control_out[3], read_data_1, read_data_2);

    
    // reg_mux(read_data_2, immediate, ALUSrc, mux_out);
    
    reg alu_result;
    reg zero;    
    alu_32();
    
    // reg memread_zero_out;
    // memread_zero_and(control_out[2], zero, memread_zero_out) 
    
    // pc_adder_mux()
    
    data_mem();
    
    // dm_mux(read_data_dm, alu_result, mem_read, mux_out);
    
    
endmodule
