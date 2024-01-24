/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03
// Date      : Sat Oct 28 13:05:02 2023
/////////////////////////////////////////////////////////////


module Adder_1bit ( A, B, Output );
  output [1:0] Output;
  input A, B;


  AND2x2_ASAP7_75t_R U1 ( .A(A), .B(B), .Y(Output[1]) );
  XOR2xp5_ASAP7_75t_R U2 ( .A(B), .B(A), .Y(Output[0]) );
endmodule

