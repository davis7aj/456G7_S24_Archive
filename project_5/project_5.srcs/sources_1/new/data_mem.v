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
    input [31:0] address,
    input data_address, // One bit or array?
    input [31:0] write_data,
    output reg [31:0] read_data 
    );
endmodule
