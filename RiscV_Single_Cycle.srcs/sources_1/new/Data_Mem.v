`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.12.2024 11:48:59
// Design Name: 
// Module Name: Data_Mem
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


module Data_Mem(
    input [31:0] A,
    input [31:0] WD,
    input WE,rst,
    input clk,
    output [31:0] RD
    );
    
    reg[31:0] Data_Mem[1023:0];
    assign RD = (WE == 1'b0) ? Data_Mem[A] : 32'h00000000;
    
    always@(posedge clk) begin
    
        if(WE)
        begin
            Data_Mem[A] <= WD;
        end
end
endmodule
