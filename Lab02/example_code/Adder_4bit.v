module Adder_4bit(
    //Input Port
	A,	
	B,
    //Output Port
	Output
    );

//---------------------------------------------------------------------
//   PORT DECLARATION
//---------------------------------------------------------------------
input [3:0]A;
input [3:0]B;

output wire [4:0]Output;


assign Output = A + B;


endmodule