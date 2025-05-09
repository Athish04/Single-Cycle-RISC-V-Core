`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.12.2024 15:58:32
// Design Name: 
// Module Name: ALU_Decoder
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


module ALU_Decoder(
    input [2:0] funct3,
    input [6:0]funct7,
    output [2:0] ALUControl,
    input [6:0]op5,
    input [1:0] ALUOp
    );
    
    wire [1:0]concat;
    assign concat = {op5,funct7};
    
    assign ALUControl = (ALUOp == 2'b00)?3'b000:
                        (ALUOp == 2'b01)?3'b001:
                        (ALUOp == 2'b10 & funct3 == 3'b010)?3'b101:
                        (ALUOp == 2'b10 & funct3 == 3'b110)?3'b011:
                        (ALUOp == 2'b10 & funct3 == 3'b111)?3'b010:
                        (ALUOp == 2'b10 & funct3 == 3'b000 & concat == 2'b11)?3'b001:
                        (ALUOp == 2'b10 & funct3 == 3'b000 & concat != 2'b11)?3'b000:3'b000;
endmodule
