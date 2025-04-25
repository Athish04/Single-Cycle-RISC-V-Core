//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.12.2024 11:31:08
// Design Name: 
// Module Name: Reg_file
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


module Reg_file(
    input [4:0] A1,
    input [4:0] A2,
    input [4:0] A3,
    input [31:0] WD3,
    input WE3,
    input clk,rst,
    output [31:0] RD1,
    output [31:0] RD2
    );
    
    reg [31:0] registers [31:0];
    assign RD1 = (!rst) ? 32'h00000000:(registers[A1]);
    assign RD2 = (!rst) ? 32'h00000000:(registers[A2]);
    
    always@(posedge clk)
    begin
        if(WE3 == 1'b1)
        begin
            registers[A3] <= WD3;
        end
    end
    
    initial begin
        registers[5] = 32'h00000005;
        registers[6] = 32'h00000004;
   end
    
endmodule
