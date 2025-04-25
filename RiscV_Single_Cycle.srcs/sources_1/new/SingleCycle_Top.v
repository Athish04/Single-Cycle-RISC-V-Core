//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.12.2024 12:32:57
// Design Name: 
// Module Name: 
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

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.12.2024 10:39:53
// Design Name: 
// Module Name: Single_Cycle_Top
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


module Single_Cycle_Top(
    input rst,
    input clk
    );
    
wire [31:0] PC_Top,RD_Top,RD1_Top,Imm_Ext_Top,ALUResult,ReadData,PCPlus4,RD2_Top,SrcB,Result;    
wire RegWrite,MemWrite,ALUSrc,ResultSrc;
wire [1:0]ImmSrc;
wire [2:0]ALUControl_Top;
    
PC_Count PC(
    .clk(clk),
    .rst(rst),
    .PC(PC_Top),
    .PC_next(PCPlus4)
);

PC_Adder PC_Adder(
.A(PC_Top),
.B(32'd4),
.C(PCPlus4)
); 

Mem_Ins Mem_Ins(
.rst(rst),
.A(PC_Top),
.RD(RD_Top)
);

Reg_file Reg_file(
    .clk(clk),
    .rst(rst),
    .WE3(RegWrite),
    .WD3(Result),
    .A1(RD_Top[19:15]),
    .A2(RD_Top[24:20]),
    .A3(RD_Top[11:7]),
    .RD1(RD1_Top),
    .RD2(RD2_Top)
);

Sign_Extend Sign_Extend(
.In(RD_Top),
.ImmSrc(ImmSRC),
.Imm_Extend(Imm_Ext_Top)
);  

Mux Mux_RegtoALU(
.A(RD2_Top),
.B(Imm_Ext_Top),
.S(ALU_Src),
.C(SrcB)
);

ALU ALU(
.A(RD_Top),
.B(SrcB),
.Result(ALUResult),
.ALUControl(ALUControl_Top),
.V(),
.C(),
.Z(),
.N()
); 

Control_Unit_Top Control_Unit_Top(
.Op(RD_Top[6:0]),
.RegWrite(RegWrite),
.ImmSrc(ImmSRC),
.ALUSrc(),
.MemWrite(MemWrite),
.ResultSrc(),
.Branch(),
.funct3(RD_Top[14:12]),
.funct7(),
.ALUControl(ALUControl_Top)
);
  
Data_Mem Data_Mem(
.A(ALUResult),
.WD(RD2_Top),
.WE(MemWrite),
.RD(ReadData),
.clk(clk),
.rst(rst)
);

Mux MuxDMtoReg(
.A(ALUResult),
.B(ReadData),
.S(ResultSrc),
.C(Result)
);
 
   
    
endmodule

