`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2024 01:24:52 PM
// Design Name: 
// Module Name: data_mem
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

//The data memory is similar to the instruction memory, with an input of a 32-bit address,
//the Data Address[6] bit coming from SWITCHES[1]. The data memory should have the
//addition of the ability to write data in so a 32-bit data write in port and a 32-bit output
//port for data. This is similar to the RAM design in a previous lab.

module data_mem(
    input memwrite,
    input memread,
    input [31:0] address,
    input [31:0] write_data,
    output reg [31:0] read_data 
    );
    
    reg [31:0] data_memory [72:0];
    
    initial begin
        // Sets hard coded values
        data_memory[256'h0]  = 32'h00C0FFEE;
        data_memory[256'h4]  = 32'hA5A5A5A5;
        data_memory[256'h40] = 32'hFFFFFFFF;
        data_memory[256'h44] = 32'h1;
    end
    
    always @(*) begin
        if (memwrite) begin
            data_memory[address] <= write_data;
        end
        read_data <= data_memory[address];
    end
endmodule