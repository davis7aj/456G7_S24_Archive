`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2024 01:28:53 PM
// Design Name: 
// Module Name: reg_file_tb
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


module reg_file_tb;
    wire [31:0] read_data_1;
    wire [31:0] read_data_2;
    reg [4:0] reg_1;
    reg [4:0] reg_2;
    reg [4:0] write_reg;
    reg [31:0] write_data;
    reg reg_write;


    localparam time_step = 20;
    
    reg_file reg_f(reg_1, reg_2, write_reg, write_data, reg_write, read_data_1, read_data_2);
    
    initial begin
        reg_1 = 5'd6;
        reg_2 = 5'd7;
        write_reg = 5'b0;
        write_data = 32'b0;
        reg_write = 0;
        #time_step;
        write_reg = 5'd7;
        write_data = 32'd28;
        reg_write = 1;
        #time_step;
        reg_2 = 5'd7;
        #time_step;
    end
endmodule
