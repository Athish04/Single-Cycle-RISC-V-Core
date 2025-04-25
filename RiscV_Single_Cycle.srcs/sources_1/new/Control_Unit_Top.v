`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.12.2024 11:26:27
// Design Name: 
// Module Name: Control_Unit_Top
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


module Control_Unit_Top(
    input [6:0] Op,
    input [6:0] funct7,
    input [2:0] funct3,
    output RegWrite,ALUSrc,MemWrite,ResultSrc,
    output Branch,
    output ImmSrc,
    output [2:0] ALUControl
    );
    
wire [1:0]ALUOp;

main_decoder main_decoder(
.op(Op),
.RegWrite(Regwrite),
.ImmSrc(ImmSrc),
.MemWrite(MemWrite),
.ResultSrc(ResultSrc),
.Branch(Branch),
.ALUSrc(ALUSrc),
.ALUOp(ALUOp)
);

ALU_Decoder ALU_Decoder(
.ALUOp(ALUOp),
.funct3(funct3),
.funct7(funct7),
.op5(Op),
.ALUControl(ALUControl)
);   
endmodule
