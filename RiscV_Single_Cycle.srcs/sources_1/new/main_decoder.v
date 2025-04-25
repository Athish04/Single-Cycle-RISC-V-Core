`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.12.2024 15:15:23
// Design Name: 
// Module Name: main_decoder
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


module main_decoder(
    input zero,
    input [6:0] op,
    output RegWrite,
    output MemWrite,
    output ResultSrc,
    output ALUSrc,
    output PCSrc,Branch,
    output ImmSrc,
    output [1:0] ALUOp
    );
    
    
    assign RegWrite = ((op == 7'b0000011) | (op == 7'b0110011))? 1'b1:1'b0;
    assign MemWrite = (op == 7'b0100011)?1'b1:1'b0;
    assign ResultSrc = (op == 7'b0000011)?1'b1:1'b0;
    assign ALUSrc = ((op == 7'b0000011)|(op == 7'b0100011))?1'b1:1'b0;
    assign Branch = (op == 7'b1100011)?1'b1:1'b0;
    assign ImmSrc = (op == 7'b0100011)?2'b01:(op == 7'b1100011)?2'b10:2'b00;
    assign ALUOp = (op == 7'b0110011)?2'b10:(op == 7'b1100011)?2'b01:2'b00;
    assign PCSrc = zero & Branch;
  
    
endmodule
