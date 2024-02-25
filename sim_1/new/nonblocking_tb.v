`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2024 01:55:09 PM
// Design Name: 
// Module Name: nonblocking_tb
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


`timescale 1 ns/ 1 ns

module nonblocking_tb;
    reg a;
    wire out;
    
       
    localparam time_step = 10;
    nonblocking nonblocking_tb(a, out);
    
    initial
        begin           ;
            a = 0;
            #time_step;
            
            a = 1;
            #time_step;
                      
            a = 1;
            #time_step;
                        
            a = 0;
            #time_step;
                        
            a = 0;
            #time_step;
                 
            a = 1;
            #time_step;
                       
            a = 0;
            #time_step;
                 
            a = 1;
            #time_step;          
        end
    
endmodule

