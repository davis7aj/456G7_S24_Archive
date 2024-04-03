`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2024 01:25:05 PM
// Design Name: 
// Module Name: reg_file
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

//The register file should be able to read register fields from the instruction and write data
//from the alu or data memory as shown in the figure above. It should have two output
//ports for reading as shown in the figure as well

module reg_file(
    input clk,
    input [4:0] reg_1,
    input [4:0] reg_2,
    input [4:0] write_reg,
    input [31:0] write_data,
    input reg_write,
    output reg [31:0] read_data_1,
    output reg [31:0] read_data_2
    );
    
    reg [31:0] registers [31:0];
    
    always @(*) begin
        read_data_1 <= registers[reg_1];
        read_data_2 <= registers[reg_2];
    end
    // is this the right move? is clock needed, idk how to implement write back
    always @(posedge clk) begin
        if (reg_write == 1) begin
            registers[write_reg] <= write_data;
        end
    end
endmodule
