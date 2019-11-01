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
module CM(clk, regwrite,data_out);
input clk;
input regwrite;
output [15: 0] data_out;
reg [16: 0] addr_out;
reg regread;
reg [16: 0] addr_in;
reg [15: 0] data_in ;
buffer_ram_dp RAM	( clk,addr_in,data_in, regwrite, data_out , addr_out, regread);

endmodule
