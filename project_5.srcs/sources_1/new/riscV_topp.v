`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2024 12:15:29 PM
// Design Name: 
// Module Name: riscV_topp
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
    output [5:0] LEDS
    );
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


module riscV_topp(input clk, input [1:0] SWITCHES, output [5:0] LEDS);
    wire alu_zero; // Output of alu, zero
    wire [7:0] control_out; // Output of control
    wire [7:0] pc_out; // Output of pc_compute
    wire [31:0] imm_val; // Output of immediate
    wire [31:0] instruction; // Output of instr_mem
    wire [4:0] alu_ctrl_out; // Output of ALU_Ctrl
    wire [31:0] read_data_reg_1; 
    wire [31:0] read_data_reg_2;
    wire [31:0] reg_write_data;
    wire [31:0] reg_mux_out;
    wire [31:0] alu_result;
    wire carryout;
    wire overflow;  
    wire [31:0] read_data_mem;
    wire [31:0] mem_mux_out;
 
    pc_compute pc1(clk, SWITCHES[1:0], imm_val, control_out[2], alu_zero, pc_out);
    
    instr_mem instr_mem1(pc_out, instruction);
    
    immediate imm1(instruction, imm_val);
    
    control(instruction[6:0], control_out);
    
    alu_ctrl alu_ctrl1(control_out[1:0], {instruction[30], instruction[14:12]}, alu_ctrl_out);
    
    reg_file reg_file1(instruction[19:15], instruction[24:20], instruction[11:7], reg_write_data, control_out[3], read_data_reg_1, read_data_reg_2);

    mux32_2 reg_mux(immediate, read_data_reg_2, control_out[7], reg_mux_out); // 1 - immediate, 0 - read_data_2 ALUSrc
    
    alu_32 alu_321(read_data_reg_1, reg_mux_out, alu_ctrl_out, alu_zero, overflow, carryout);
    
    data_mem data_mem1(clk, data_address, control_out[3], control_out[4], alu_result, read_data_reg_2, read_data_mem);
    
    mux32_2 mem_mux(read_data_mem, alu_result, control_out[6], mem_mux_out); // 1 - read data, 0 - alu result, MemToReg
    assign LEDS = mem_mux_out[5:0];
    assign reg_write_data = mem_mux_out;
endmodule
