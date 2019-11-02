`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:41:52 10/22/2019
// Design Name:   buffer_ram_dp
// Module Name:   C:/Users/UECCI/Documents/GitHub/SPARTAN6-ATMEGA-MAX5864/lab/P001-ProyectoCamara/src/ramdp/TB_ram.v
// Project Name:  P001-ProyectoCamara
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: buffer_ram_dp
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////


module TB_ram;

// Inputs


reg clk;
reg [14:0] addr_in;
reg [15:0] data_in;
reg regwrite;
reg [14:0] addr_out;
reg regread;


reg [16-1: 0] ram [0: (2 ** 17)-1];
// Outputs
wire [15:0] data_out;

// Instantiate the Unit Under Test (UUT)
buffer_ram_dp uut (
.clk(clk),
.addr_in(addr_in),
.data_in(data_in),
.regwrite(regwrite),
.data_out(data_out),
.addr_out(addr_out),
.regread(regread)
);

initial begin
// Initialize Inputs
clk = 0;
addr_in = 0;
data_in = 0;
regwrite = 0;
addr_out = 0;
regread = 0;
end
 // Adicionar las estimulos necesarios para simular la lectura y escritura de la memoria ram
initial $readmemh("/home/brayan/work01-ramdp-grupo-03/src/image.men", ram);


integer i;



initial begin

    $display("rdata:");

    for (i=0; i < (2 ** 10); i=i+1)

    $display("%d:%h",i,ram[i]);
	 
	 #1 addr_in = addr_in + 1;

end    

 

always  clk = ~clk ;
endmodule