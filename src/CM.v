`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:39:24 10/30/2019 
// Design Name: 
// Module Name:    CM 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module CM(clk, regwrite);
input clk;
input regwrite;
reg addr_out, regread;
buffer_ram_dp RAM	( clk, , , regwrite, , addr_out, regread);

endmodule
