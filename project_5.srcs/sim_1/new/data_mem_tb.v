`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2024 01:29:19 PM
// Design Name: 
// Module Name: data_mem_tb
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


module data_mem_tb;
    wire [31:0] read_data;
    reg memwrite;
    reg memread;
    reg [31:0] address;
    reg [31:0] write_data;
    
    localparam time_step = 20;
    
    data_mem data(memwrite, memread, address, write_data, read_data);
    
    initial begin
        memwrite = 0;
        memread = 1;
        address = 32'b0;
        write_data = 32'b0;
        #time_step;
        memwrite = 1;
        memread = 0;
        address = 32'd8;
        write_data = 32'd2;
        #time_step;
        memwrite = 0;
        memread = 1;
        address = 32'd8;
        write_data = 32'd0;
        #time_step;
    end

endmodule
