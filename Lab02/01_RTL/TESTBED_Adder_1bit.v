
`timescale 10ps/1ps
`include "../01_RTL/PATTERN_Adder_1bit.v"

`ifdef RTL
  `include "Adder_1bit.v"
`endif

`ifdef GATE
  `include "../02_SYN/Netlist/Adder_1bit_SYN.v"
`endif


module TESTBED;
   //input
	wire A;
	wire B;	
	//output
	wire [1:0] Output;

	
	
initial begin
  `ifdef RTL
    $fsdbDumpfile("Adder_1bit.fsdb");
    $fsdbDumpvars();
  `endif
  `ifdef GATE
    $sdf_annotate("../02_SYN/Netlist/Adder_1bit.sdf",u_Adder_1bit);
    $fsdbDumpfile("Adder_1bit_SYN.fsdb");
    $fsdbDumpvars();    
  `endif
end

`ifdef RTL	
Adder_1bit	u_Adder_1bit	(
		.A(A),
		.B(B),
		.Output(Output)
		);
`endif

`ifdef GATE
Adder_1bit u_Adder_1bit	(
		.A(A),
		.B(B),
		.Output(Output)
		);
`endif

PATTERN_Adder_1bit	u_PATTERN_Adder_1bit (
		.A(A),
		.B(B),
		.Output(Output)
		);
		
endmodule