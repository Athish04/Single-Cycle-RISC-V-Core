//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.12.2024 14:38:08
// Design Name: 
// Module Name: Mem_Ins
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


module Mem_Ins(
    input [31:0] A,
    input rst,
    output [31:0] RD
    );
    
    reg [31:0] Mem [1023:0];
    assign RD = (rst == 1'b0)? 32'h00000000: Mem[A[31:2]];
    
initial begin
    Mem[2] = 32'h0064A423;     
end
endmodule
