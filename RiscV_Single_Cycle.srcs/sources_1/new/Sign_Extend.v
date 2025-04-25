//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.12.2024 11:05:38
// Design Name: 
// Module Name: Sign_Extend
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


module Sign_Extend(
    input [31:0] In,
    output[31:0] Imm_Extend,
    input ImmSrc
    );
    
    assign Imm_Extend = (ImmSrc == 1'b1) ?({{20{In[31]}},In[31:25],In[11:7]}):
                                          {{20{In[31]}},In[31:20]};
endmodule
