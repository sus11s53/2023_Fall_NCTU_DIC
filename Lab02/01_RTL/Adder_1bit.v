//==============================================
//==============================================				
//	Author	:	Wei Lu																		
//----------------------------------------------
//												
//	File Name		:	Adder_4bit.v					
//	Module Name		:	Adder_4bit					
//	Release version	:	v1.0					
//												
//----------------------------------------------								
//----------------------------------------------											
//	Input	:   A,
//				B,												
//	Output	:	Output,					
//==============================================
//==============================================
module Adder_1bit(
    //Input Port
	A,	
	B,
    //Output Port
	Output
    );

//---------------------------------------------------------------------
//   PORT DECLARATION
//---------------------------------------------------------------------
input A;
input B;

output wire [1:0]Output;


assign Output = A + B;


endmodule