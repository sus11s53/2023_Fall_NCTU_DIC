/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03
// Date      : Fri Dec  8 13:34:49 2023
/////////////////////////////////////////////////////////////


module Convolution ( IFM_0, IFM_1, IFM_2, IFM_3, INW_0, INW_1, INW_2, INW_3, 
        Output, Port10 );
  input [3:0] IFM_0;
  input [3:0] IFM_1;
  input [3:0] IFM_2;
  input [3:0] IFM_3;
  input [3:0] INW_0;
  input [3:0] INW_1;
  input [3:0] INW_2;
  input [3:0] INW_3;
  output [9:0] Output;
  input Port10;
  wire   N9, N8, N7, N6, N50, N5, N49, N48, N47, N46, N45, N44, N43, N42, N41,
         N40, N4, N39, N38, N37, N36, N35, N34, N33, N32, N31, N30, N3, N29,
         N28, N27, N26, N25, N2, N15, N14, N13, N12, N11, N10, N1, N0, n1, n2,
         n3, n4, n5, n6, n7, n8, n9, SYNOPSYS_UNCONNECTED_1,
         SYNOPSYS_UNCONNECTED_2;

  Convolution_DW_mult_uns_3 mult_19 ( .a(IFM_0), .b(INW_0), .product({N7, N6, 
        N5, N4, N3, N2, N1, N0}) );
  Convolution_DW_mult_uns_2 mult_19_2 ( .a(IFM_1), .b(INW_1), .product({N15, 
        N14, N13, N12, N11, N10, N9, N8}) );
  Convolution_DW_mult_uns_1 mult_19_3 ( .a(IFM_2), .b(INW_2), .product({N32, 
        N31, N30, N29, N28, N27, N26, N25}) );
  Convolution_DW_mult_uns_0 mult_19_4 ( .a(IFM_3), .b(INW_3), .product({N50, 
        N49, N48, N47, N46, N45, N44, N43}) );
  Convolution_DW01_add_2 add_1_root_add_0_root_add_19_3 ( .A({N42, N42, N15, 
        N14, N13, N12, N11, N10, N9, N8}), .B({N42, N42, N50, N49, N48, N47, 
        N46, N45, N44, N43}), .CI(N42), .SUM({SYNOPSYS_UNCONNECTED_1, n9, n8, 
        n7, n6, n5, n4, n3, n2, n1}) );
  Convolution_DW01_add_1 add_2_root_add_0_root_add_19_3 ( .A({N42, N42, N7, N6, 
        N5, N4, N3, N2, N1, N0}), .B({N42, N42, N32, N31, N30, N29, N28, N27, 
        N26, N25}), .CI(N42), .SUM({SYNOPSYS_UNCONNECTED_2, N41, N40, N39, N38, 
        N37, N36, N35, N34, N33}) );
  Convolution_DW01_add_0 add_0_root_add_0_root_add_19_3 ( .A({N42, N41, N40, 
        N39, N38, N37, N36, N35, N34, N33}), .B({N42, n9, n8, n7, n6, n5, n4, 
        n3, n2, n1}), .CI(N42), .SUM(Output) );
  TIELOx1_ASAP7_75t_R U1 ( .L(N42) );
endmodule


module Convolution_DW01_add_0 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25;

  FAx1_ASAP7_75t_R U1_8 ( .A(A[8]), .B(B[8]), .CI(n3), .CON(n10), .SN(n11) );
  FAx1_ASAP7_75t_R U1_7 ( .A(A[7]), .B(B[7]), .CI(n4), .CON(n12), .SN(n13) );
  FAx1_ASAP7_75t_R U1_6 ( .A(A[6]), .B(B[6]), .CI(n5), .CON(n14), .SN(n15) );
  FAx1_ASAP7_75t_R U1_5 ( .A(A[5]), .B(B[5]), .CI(n6), .CON(n16), .SN(n17) );
  FAx1_ASAP7_75t_R U1_4 ( .A(A[4]), .B(B[4]), .CI(n7), .CON(n18), .SN(n19) );
  FAx1_ASAP7_75t_R U1_3 ( .A(A[3]), .B(B[3]), .CI(n8), .CON(n20), .SN(n21) );
  FAx1_ASAP7_75t_R U1_2 ( .A(A[2]), .B(B[2]), .CI(n9), .CON(n22), .SN(n23) );
  FAx1_ASAP7_75t_R U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CON(n24), .SN(n25) );
  AND2x2_ASAP7_75t_R U1 ( .A(A[0]), .B(B[0]), .Y(n1) );
  XOR2xp5_ASAP7_75t_R U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
  INVx1_ASAP7_75t_R U3 ( .A(n12), .Y(n3) );
  INVx1_ASAP7_75t_R U4 ( .A(n14), .Y(n4) );
  INVx1_ASAP7_75t_R U5 ( .A(n16), .Y(n5) );
  INVx1_ASAP7_75t_R U6 ( .A(n18), .Y(n6) );
  INVx1_ASAP7_75t_R U7 ( .A(n20), .Y(n7) );
  INVx1_ASAP7_75t_R U8 ( .A(n22), .Y(n8) );
  INVx1_ASAP7_75t_R U9 ( .A(n24), .Y(n9) );
  INVx1_ASAP7_75t_R U10 ( .A(n10), .Y(SUM[9]) );
  INVx1_ASAP7_75t_R U11 ( .A(n11), .Y(SUM[8]) );
  INVx1_ASAP7_75t_R U12 ( .A(n13), .Y(SUM[7]) );
  INVx1_ASAP7_75t_R U13 ( .A(n15), .Y(SUM[6]) );
  INVx1_ASAP7_75t_R U14 ( .A(n17), .Y(SUM[5]) );
  INVx1_ASAP7_75t_R U15 ( .A(n19), .Y(SUM[4]) );
  INVx1_ASAP7_75t_R U16 ( .A(n21), .Y(SUM[3]) );
  INVx1_ASAP7_75t_R U17 ( .A(n23), .Y(SUM[2]) );
  INVx1_ASAP7_75t_R U18 ( .A(n25), .Y(SUM[1]) );
endmodule


module Convolution_DW01_add_1 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22;

  FAx1_ASAP7_75t_R U1_7 ( .A(A[7]), .B(B[7]), .CI(n3), .CON(n9), .SN(n10) );
  FAx1_ASAP7_75t_R U1_6 ( .A(A[6]), .B(B[6]), .CI(n4), .CON(n11), .SN(n12) );
  FAx1_ASAP7_75t_R U1_5 ( .A(A[5]), .B(B[5]), .CI(n5), .CON(n13), .SN(n14) );
  FAx1_ASAP7_75t_R U1_4 ( .A(A[4]), .B(B[4]), .CI(n6), .CON(n15), .SN(n16) );
  FAx1_ASAP7_75t_R U1_3 ( .A(A[3]), .B(B[3]), .CI(n7), .CON(n17), .SN(n18) );
  FAx1_ASAP7_75t_R U1_2 ( .A(A[2]), .B(B[2]), .CI(n8), .CON(n19), .SN(n20) );
  FAx1_ASAP7_75t_R U1_1 ( .A(A[1]), .B(B[1]), .CI(n2), .CON(n21), .SN(n22) );
  XOR2xp5_ASAP7_75t_R U1 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
  AND2x2_ASAP7_75t_R U2 ( .A(A[0]), .B(B[0]), .Y(n2) );
  INVx1_ASAP7_75t_R U3 ( .A(n11), .Y(n3) );
  INVx1_ASAP7_75t_R U4 ( .A(n13), .Y(n4) );
  INVx1_ASAP7_75t_R U5 ( .A(n15), .Y(n5) );
  INVx1_ASAP7_75t_R U6 ( .A(n17), .Y(n6) );
  INVx1_ASAP7_75t_R U7 ( .A(n19), .Y(n7) );
  INVx1_ASAP7_75t_R U8 ( .A(n21), .Y(n8) );
  INVx1_ASAP7_75t_R U9 ( .A(n9), .Y(SUM[8]) );
  INVx1_ASAP7_75t_R U10 ( .A(n10), .Y(SUM[7]) );
  INVx1_ASAP7_75t_R U11 ( .A(n12), .Y(SUM[6]) );
  INVx1_ASAP7_75t_R U12 ( .A(n14), .Y(SUM[5]) );
  INVx1_ASAP7_75t_R U13 ( .A(n16), .Y(SUM[4]) );
  INVx1_ASAP7_75t_R U14 ( .A(n18), .Y(SUM[3]) );
  INVx1_ASAP7_75t_R U15 ( .A(n20), .Y(SUM[2]) );
  INVx1_ASAP7_75t_R U16 ( .A(n22), .Y(SUM[1]) );
endmodule


module Convolution_DW01_add_2 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22;

  FAx1_ASAP7_75t_R U1_7 ( .A(A[7]), .B(B[7]), .CI(n3), .CON(n9), .SN(n10) );
  FAx1_ASAP7_75t_R U1_6 ( .A(A[6]), .B(B[6]), .CI(n4), .CON(n11), .SN(n12) );
  FAx1_ASAP7_75t_R U1_5 ( .A(A[5]), .B(B[5]), .CI(n5), .CON(n13), .SN(n14) );
  FAx1_ASAP7_75t_R U1_4 ( .A(A[4]), .B(B[4]), .CI(n6), .CON(n15), .SN(n16) );
  FAx1_ASAP7_75t_R U1_3 ( .A(A[3]), .B(B[3]), .CI(n7), .CON(n17), .SN(n18) );
  FAx1_ASAP7_75t_R U1_2 ( .A(A[2]), .B(B[2]), .CI(n8), .CON(n19), .SN(n20) );
  FAx1_ASAP7_75t_R U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CON(n21), .SN(n22) );
  AND2x2_ASAP7_75t_R U1 ( .A(A[0]), .B(B[0]), .Y(n1) );
  XOR2xp5_ASAP7_75t_R U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
  INVx1_ASAP7_75t_R U3 ( .A(n11), .Y(n3) );
  INVx1_ASAP7_75t_R U4 ( .A(n13), .Y(n4) );
  INVx1_ASAP7_75t_R U5 ( .A(n15), .Y(n5) );
  INVx1_ASAP7_75t_R U6 ( .A(n17), .Y(n6) );
  INVx1_ASAP7_75t_R U7 ( .A(n19), .Y(n7) );
  INVx1_ASAP7_75t_R U8 ( .A(n21), .Y(n8) );
  INVx1_ASAP7_75t_R U9 ( .A(n9), .Y(SUM[8]) );
  INVx1_ASAP7_75t_R U10 ( .A(n10), .Y(SUM[7]) );
  INVx1_ASAP7_75t_R U11 ( .A(n12), .Y(SUM[6]) );
  INVx1_ASAP7_75t_R U12 ( .A(n14), .Y(SUM[5]) );
  INVx1_ASAP7_75t_R U13 ( .A(n16), .Y(SUM[4]) );
  INVx1_ASAP7_75t_R U14 ( .A(n18), .Y(SUM[3]) );
  INVx1_ASAP7_75t_R U15 ( .A(n20), .Y(SUM[2]) );
  INVx1_ASAP7_75t_R U16 ( .A(n22), .Y(SUM[1]) );
endmodule


module Convolution_DW_mult_uns_0 ( a, b, product );
  input [3:0] a;
  input [3:0] b;
  output [7:0] product;
  wire   n25, n26, n29, n30, n31, n32, n34, n35, n36, n38, n41, n44, n45, n49,
         n52, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119;

  FAx1_ASAP7_75t_R U32 ( .A(n41), .B(n44), .CI(n31), .CON(n25), .SN(n26) );
  FAx1_ASAP7_75t_R U35 ( .A(n36), .B(n45), .CI(n32), .CON(n29), .SN(n30) );
  FAx1_ASAP7_75t_R U39 ( .A(n49), .B(n52), .CI(n38), .CON(n34), .SN(n35) );
  INVx1_ASAP7_75t_R U70 ( .A(a[2]), .Y(n83) );
  INVx1_ASAP7_75t_R U71 ( .A(n35), .Y(n84) );
  INVx1_ASAP7_75t_R U72 ( .A(a[0]), .Y(n85) );
  INVx1_ASAP7_75t_R U73 ( .A(b[3]), .Y(n86) );
  INVx1_ASAP7_75t_R U74 ( .A(b[0]), .Y(n87) );
  NAND2xp33_ASAP7_75t_R U75 ( .A(n88), .B(n89), .Y(product[7]) );
  NAND2xp33_ASAP7_75t_R U76 ( .A(n90), .B(n91), .Y(n89) );
  OR2x2_ASAP7_75t_R U77 ( .A(n92), .B(n25), .Y(n88) );
  XOR2xp5_ASAP7_75t_R U78 ( .A(n91), .B(n90), .Y(product[6]) );
  XOR2xp5_ASAP7_75t_R U79 ( .A(n92), .B(n25), .Y(n90) );
  NAND2xp33_ASAP7_75t_R U80 ( .A(b[3]), .B(a[3]), .Y(n92) );
  NAND2xp33_ASAP7_75t_R U81 ( .A(n93), .B(n94), .Y(n91) );
  NAND2xp33_ASAP7_75t_R U82 ( .A(n95), .B(n96), .Y(n94) );
  OR2x2_ASAP7_75t_R U83 ( .A(n26), .B(n29), .Y(n93) );
  XOR2xp5_ASAP7_75t_R U84 ( .A(n96), .B(n95), .Y(product[5]) );
  XOR2xp5_ASAP7_75t_R U85 ( .A(n26), .B(n29), .Y(n95) );
  NAND2xp33_ASAP7_75t_R U86 ( .A(n97), .B(n98), .Y(n96) );
  NAND2xp33_ASAP7_75t_R U87 ( .A(n99), .B(n100), .Y(n98) );
  OR2x2_ASAP7_75t_R U88 ( .A(n30), .B(n34), .Y(n97) );
  XOR2xp5_ASAP7_75t_R U89 ( .A(n100), .B(n99), .Y(product[4]) );
  XOR2xp5_ASAP7_75t_R U90 ( .A(n30), .B(n34), .Y(n99) );
  NAND2xp33_ASAP7_75t_R U91 ( .A(n101), .B(n102), .Y(n100) );
  NAND2xp33_ASAP7_75t_R U92 ( .A(n103), .B(n104), .Y(n102) );
  NAND2xp33_ASAP7_75t_R U93 ( .A(n105), .B(n84), .Y(n101) );
  XOR2xp5_ASAP7_75t_R U94 ( .A(n104), .B(n103), .Y(product[3]) );
  XNOR2xp5_ASAP7_75t_R U95 ( .A(n35), .B(n105), .Y(n103) );
  XOR2xp5_ASAP7_75t_R U96 ( .A(n106), .B(n107), .Y(n105) );
  NAND2xp33_ASAP7_75t_R U97 ( .A(n108), .B(n109), .Y(n104) );
  NAND2xp33_ASAP7_75t_R U98 ( .A(n110), .B(n111), .Y(n109) );
  NAND2xp33_ASAP7_75t_R U99 ( .A(n112), .B(n113), .Y(n108) );
  XOR2xp5_ASAP7_75t_R U100 ( .A(n110), .B(n111), .Y(product[2]) );
  XOR2xp5_ASAP7_75t_R U101 ( .A(n112), .B(n113), .Y(n111) );
  XOR2xp5_ASAP7_75t_R U102 ( .A(n114), .B(n115), .Y(n113) );
  NOR2xp33_ASAP7_75t_R U103 ( .A(n83), .B(n87), .Y(n112) );
  NOR2xp33_ASAP7_75t_R U104 ( .A(n116), .B(n117), .Y(n110) );
  XOR2xp5_ASAP7_75t_R U105 ( .A(n116), .B(n117), .Y(product[1]) );
  NAND2xp33_ASAP7_75t_R U106 ( .A(b[1]), .B(a[0]), .Y(n117) );
  NAND2xp33_ASAP7_75t_R U107 ( .A(b[0]), .B(a[1]), .Y(n116) );
  NOR2xp33_ASAP7_75t_R U108 ( .A(n87), .B(n85), .Y(product[0]) );
  NOR2xp33_ASAP7_75t_R U109 ( .A(n85), .B(n86), .Y(n52) );
  AND2x2_ASAP7_75t_R U110 ( .A(a[1]), .B(b[2]), .Y(n49) );
  AND2x2_ASAP7_75t_R U111 ( .A(a[2]), .B(b[2]), .Y(n45) );
  NOR2xp33_ASAP7_75t_R U112 ( .A(n83), .B(n86), .Y(n44) );
  AND2x2_ASAP7_75t_R U113 ( .A(b[2]), .B(a[3]), .Y(n41) );
  NOR2xp33_ASAP7_75t_R U114 ( .A(n115), .B(n114), .Y(n38) );
  NAND2xp33_ASAP7_75t_R U115 ( .A(b[1]), .B(a[1]), .Y(n114) );
  NAND2xp33_ASAP7_75t_R U116 ( .A(b[2]), .B(a[0]), .Y(n115) );
  NOR2xp33_ASAP7_75t_R U117 ( .A(n107), .B(n106), .Y(n36) );
  NAND2xp33_ASAP7_75t_R U118 ( .A(a[3]), .B(b[0]), .Y(n106) );
  NAND2xp33_ASAP7_75t_R U119 ( .A(a[2]), .B(b[1]), .Y(n107) );
  XOR2xp5_ASAP7_75t_R U120 ( .A(n118), .B(n119), .Y(n32) );
  NOR2xp33_ASAP7_75t_R U121 ( .A(n118), .B(n119), .Y(n31) );
  NAND2xp33_ASAP7_75t_R U122 ( .A(a[3]), .B(b[1]), .Y(n119) );
  NAND2xp33_ASAP7_75t_R U123 ( .A(b[3]), .B(a[1]), .Y(n118) );
endmodule


module Convolution_DW_mult_uns_1 ( a, b, product );
  input [3:0] a;
  input [3:0] b;
  output [7:0] product;
  wire   n25, n26, n29, n30, n31, n32, n34, n35, n36, n38, n41, n44, n45, n49,
         n52, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119;

  FAx1_ASAP7_75t_R U32 ( .A(n41), .B(n44), .CI(n31), .CON(n25), .SN(n26) );
  FAx1_ASAP7_75t_R U35 ( .A(n36), .B(n45), .CI(n32), .CON(n29), .SN(n30) );
  FAx1_ASAP7_75t_R U39 ( .A(n49), .B(n52), .CI(n38), .CON(n34), .SN(n35) );
  INVx1_ASAP7_75t_R U70 ( .A(a[2]), .Y(n83) );
  INVx1_ASAP7_75t_R U71 ( .A(n35), .Y(n84) );
  INVx1_ASAP7_75t_R U72 ( .A(a[0]), .Y(n85) );
  INVx1_ASAP7_75t_R U73 ( .A(b[3]), .Y(n86) );
  INVx1_ASAP7_75t_R U74 ( .A(b[0]), .Y(n87) );
  NAND2xp33_ASAP7_75t_R U75 ( .A(n88), .B(n89), .Y(product[7]) );
  NAND2xp33_ASAP7_75t_R U76 ( .A(n90), .B(n91), .Y(n89) );
  OR2x2_ASAP7_75t_R U77 ( .A(n92), .B(n25), .Y(n88) );
  XOR2xp5_ASAP7_75t_R U78 ( .A(n91), .B(n90), .Y(product[6]) );
  XOR2xp5_ASAP7_75t_R U79 ( .A(n92), .B(n25), .Y(n90) );
  NAND2xp33_ASAP7_75t_R U80 ( .A(b[3]), .B(a[3]), .Y(n92) );
  NAND2xp33_ASAP7_75t_R U81 ( .A(n93), .B(n94), .Y(n91) );
  NAND2xp33_ASAP7_75t_R U82 ( .A(n95), .B(n96), .Y(n94) );
  OR2x2_ASAP7_75t_R U83 ( .A(n26), .B(n29), .Y(n93) );
  XOR2xp5_ASAP7_75t_R U84 ( .A(n96), .B(n95), .Y(product[5]) );
  XOR2xp5_ASAP7_75t_R U85 ( .A(n26), .B(n29), .Y(n95) );
  NAND2xp33_ASAP7_75t_R U86 ( .A(n97), .B(n98), .Y(n96) );
  NAND2xp33_ASAP7_75t_R U87 ( .A(n99), .B(n100), .Y(n98) );
  OR2x2_ASAP7_75t_R U88 ( .A(n30), .B(n34), .Y(n97) );
  XOR2xp5_ASAP7_75t_R U89 ( .A(n100), .B(n99), .Y(product[4]) );
  XOR2xp5_ASAP7_75t_R U90 ( .A(n30), .B(n34), .Y(n99) );
  NAND2xp33_ASAP7_75t_R U91 ( .A(n101), .B(n102), .Y(n100) );
  NAND2xp33_ASAP7_75t_R U92 ( .A(n103), .B(n104), .Y(n102) );
  NAND2xp33_ASAP7_75t_R U93 ( .A(n105), .B(n84), .Y(n101) );
  XOR2xp5_ASAP7_75t_R U94 ( .A(n104), .B(n103), .Y(product[3]) );
  XNOR2xp5_ASAP7_75t_R U95 ( .A(n35), .B(n105), .Y(n103) );
  XOR2xp5_ASAP7_75t_R U96 ( .A(n106), .B(n107), .Y(n105) );
  NAND2xp33_ASAP7_75t_R U97 ( .A(n108), .B(n109), .Y(n104) );
  NAND2xp33_ASAP7_75t_R U98 ( .A(n110), .B(n111), .Y(n109) );
  NAND2xp33_ASAP7_75t_R U99 ( .A(n112), .B(n113), .Y(n108) );
  XOR2xp5_ASAP7_75t_R U100 ( .A(n110), .B(n111), .Y(product[2]) );
  XOR2xp5_ASAP7_75t_R U101 ( .A(n112), .B(n113), .Y(n111) );
  XOR2xp5_ASAP7_75t_R U102 ( .A(n114), .B(n115), .Y(n113) );
  NOR2xp33_ASAP7_75t_R U103 ( .A(n83), .B(n87), .Y(n112) );
  NOR2xp33_ASAP7_75t_R U104 ( .A(n116), .B(n117), .Y(n110) );
  XOR2xp5_ASAP7_75t_R U105 ( .A(n116), .B(n117), .Y(product[1]) );
  NAND2xp33_ASAP7_75t_R U106 ( .A(b[1]), .B(a[0]), .Y(n117) );
  NAND2xp33_ASAP7_75t_R U107 ( .A(b[0]), .B(a[1]), .Y(n116) );
  NOR2xp33_ASAP7_75t_R U108 ( .A(n87), .B(n85), .Y(product[0]) );
  NOR2xp33_ASAP7_75t_R U109 ( .A(n85), .B(n86), .Y(n52) );
  AND2x2_ASAP7_75t_R U110 ( .A(a[1]), .B(b[2]), .Y(n49) );
  AND2x2_ASAP7_75t_R U111 ( .A(a[2]), .B(b[2]), .Y(n45) );
  NOR2xp33_ASAP7_75t_R U112 ( .A(n83), .B(n86), .Y(n44) );
  AND2x2_ASAP7_75t_R U113 ( .A(b[2]), .B(a[3]), .Y(n41) );
  NOR2xp33_ASAP7_75t_R U114 ( .A(n115), .B(n114), .Y(n38) );
  NAND2xp33_ASAP7_75t_R U115 ( .A(b[1]), .B(a[1]), .Y(n114) );
  NAND2xp33_ASAP7_75t_R U116 ( .A(b[2]), .B(a[0]), .Y(n115) );
  NOR2xp33_ASAP7_75t_R U117 ( .A(n107), .B(n106), .Y(n36) );
  NAND2xp33_ASAP7_75t_R U118 ( .A(a[3]), .B(b[0]), .Y(n106) );
  NAND2xp33_ASAP7_75t_R U119 ( .A(a[2]), .B(b[1]), .Y(n107) );
  XOR2xp5_ASAP7_75t_R U120 ( .A(n118), .B(n119), .Y(n32) );
  NOR2xp33_ASAP7_75t_R U121 ( .A(n118), .B(n119), .Y(n31) );
  NAND2xp33_ASAP7_75t_R U122 ( .A(a[3]), .B(b[1]), .Y(n119) );
  NAND2xp33_ASAP7_75t_R U123 ( .A(b[3]), .B(a[1]), .Y(n118) );
endmodule


module Convolution_DW_mult_uns_2 ( a, b, product );
  input [3:0] a;
  input [3:0] b;
  output [7:0] product;
  wire   n25, n26, n29, n30, n31, n32, n34, n35, n36, n38, n41, n44, n45, n49,
         n52, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119;

  FAx1_ASAP7_75t_R U32 ( .A(n41), .B(n44), .CI(n31), .CON(n25), .SN(n26) );
  FAx1_ASAP7_75t_R U35 ( .A(n36), .B(n45), .CI(n32), .CON(n29), .SN(n30) );
  FAx1_ASAP7_75t_R U39 ( .A(n49), .B(n52), .CI(n38), .CON(n34), .SN(n35) );
  INVx1_ASAP7_75t_R U70 ( .A(a[2]), .Y(n83) );
  INVx1_ASAP7_75t_R U71 ( .A(n35), .Y(n84) );
  INVx1_ASAP7_75t_R U72 ( .A(a[0]), .Y(n85) );
  INVx1_ASAP7_75t_R U73 ( .A(b[3]), .Y(n86) );
  INVx1_ASAP7_75t_R U74 ( .A(b[0]), .Y(n87) );
  NAND2xp33_ASAP7_75t_R U75 ( .A(n88), .B(n89), .Y(product[7]) );
  NAND2xp33_ASAP7_75t_R U76 ( .A(n90), .B(n91), .Y(n89) );
  OR2x2_ASAP7_75t_R U77 ( .A(n92), .B(n25), .Y(n88) );
  XOR2xp5_ASAP7_75t_R U78 ( .A(n91), .B(n90), .Y(product[6]) );
  XOR2xp5_ASAP7_75t_R U79 ( .A(n92), .B(n25), .Y(n90) );
  NAND2xp33_ASAP7_75t_R U80 ( .A(b[3]), .B(a[3]), .Y(n92) );
  NAND2xp33_ASAP7_75t_R U81 ( .A(n93), .B(n94), .Y(n91) );
  NAND2xp33_ASAP7_75t_R U82 ( .A(n95), .B(n96), .Y(n94) );
  OR2x2_ASAP7_75t_R U83 ( .A(n26), .B(n29), .Y(n93) );
  XOR2xp5_ASAP7_75t_R U84 ( .A(n96), .B(n95), .Y(product[5]) );
  XOR2xp5_ASAP7_75t_R U85 ( .A(n26), .B(n29), .Y(n95) );
  NAND2xp33_ASAP7_75t_R U86 ( .A(n97), .B(n98), .Y(n96) );
  NAND2xp33_ASAP7_75t_R U87 ( .A(n99), .B(n100), .Y(n98) );
  OR2x2_ASAP7_75t_R U88 ( .A(n30), .B(n34), .Y(n97) );
  XOR2xp5_ASAP7_75t_R U89 ( .A(n100), .B(n99), .Y(product[4]) );
  XOR2xp5_ASAP7_75t_R U90 ( .A(n30), .B(n34), .Y(n99) );
  NAND2xp33_ASAP7_75t_R U91 ( .A(n101), .B(n102), .Y(n100) );
  NAND2xp33_ASAP7_75t_R U92 ( .A(n103), .B(n104), .Y(n102) );
  NAND2xp33_ASAP7_75t_R U93 ( .A(n105), .B(n84), .Y(n101) );
  XOR2xp5_ASAP7_75t_R U94 ( .A(n104), .B(n103), .Y(product[3]) );
  XNOR2xp5_ASAP7_75t_R U95 ( .A(n35), .B(n105), .Y(n103) );
  XOR2xp5_ASAP7_75t_R U96 ( .A(n106), .B(n107), .Y(n105) );
  NAND2xp33_ASAP7_75t_R U97 ( .A(n108), .B(n109), .Y(n104) );
  NAND2xp33_ASAP7_75t_R U98 ( .A(n110), .B(n111), .Y(n109) );
  NAND2xp33_ASAP7_75t_R U99 ( .A(n112), .B(n113), .Y(n108) );
  XOR2xp5_ASAP7_75t_R U100 ( .A(n110), .B(n111), .Y(product[2]) );
  XOR2xp5_ASAP7_75t_R U101 ( .A(n112), .B(n113), .Y(n111) );
  XOR2xp5_ASAP7_75t_R U102 ( .A(n114), .B(n115), .Y(n113) );
  NOR2xp33_ASAP7_75t_R U103 ( .A(n83), .B(n87), .Y(n112) );
  NOR2xp33_ASAP7_75t_R U104 ( .A(n116), .B(n117), .Y(n110) );
  XOR2xp5_ASAP7_75t_R U105 ( .A(n116), .B(n117), .Y(product[1]) );
  NAND2xp33_ASAP7_75t_R U106 ( .A(b[1]), .B(a[0]), .Y(n117) );
  NAND2xp33_ASAP7_75t_R U107 ( .A(b[0]), .B(a[1]), .Y(n116) );
  NOR2xp33_ASAP7_75t_R U108 ( .A(n87), .B(n85), .Y(product[0]) );
  NOR2xp33_ASAP7_75t_R U109 ( .A(n85), .B(n86), .Y(n52) );
  AND2x2_ASAP7_75t_R U110 ( .A(a[1]), .B(b[2]), .Y(n49) );
  AND2x2_ASAP7_75t_R U111 ( .A(a[2]), .B(b[2]), .Y(n45) );
  NOR2xp33_ASAP7_75t_R U112 ( .A(n83), .B(n86), .Y(n44) );
  AND2x2_ASAP7_75t_R U113 ( .A(b[2]), .B(a[3]), .Y(n41) );
  NOR2xp33_ASAP7_75t_R U114 ( .A(n115), .B(n114), .Y(n38) );
  NAND2xp33_ASAP7_75t_R U115 ( .A(b[1]), .B(a[1]), .Y(n114) );
  NAND2xp33_ASAP7_75t_R U116 ( .A(b[2]), .B(a[0]), .Y(n115) );
  NOR2xp33_ASAP7_75t_R U117 ( .A(n107), .B(n106), .Y(n36) );
  NAND2xp33_ASAP7_75t_R U118 ( .A(a[3]), .B(b[0]), .Y(n106) );
  NAND2xp33_ASAP7_75t_R U119 ( .A(a[2]), .B(b[1]), .Y(n107) );
  XOR2xp5_ASAP7_75t_R U120 ( .A(n118), .B(n119), .Y(n32) );
  NOR2xp33_ASAP7_75t_R U121 ( .A(n118), .B(n119), .Y(n31) );
  NAND2xp33_ASAP7_75t_R U122 ( .A(a[3]), .B(b[1]), .Y(n119) );
  NAND2xp33_ASAP7_75t_R U123 ( .A(b[3]), .B(a[1]), .Y(n118) );
endmodule


module Convolution_DW_mult_uns_3 ( a, b, product );
  input [3:0] a;
  input [3:0] b;
  output [7:0] product;
  wire   n25, n26, n29, n30, n31, n32, n34, n35, n36, n38, n41, n44, n45, n49,
         n52, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119;

  FAx1_ASAP7_75t_R U32 ( .A(n41), .B(n44), .CI(n31), .CON(n25), .SN(n26) );
  FAx1_ASAP7_75t_R U35 ( .A(n36), .B(n45), .CI(n32), .CON(n29), .SN(n30) );
  FAx1_ASAP7_75t_R U39 ( .A(n49), .B(n52), .CI(n38), .CON(n34), .SN(n35) );
  INVx1_ASAP7_75t_R U70 ( .A(a[2]), .Y(n83) );
  INVx1_ASAP7_75t_R U71 ( .A(n35), .Y(n84) );
  INVx1_ASAP7_75t_R U72 ( .A(a[0]), .Y(n85) );
  INVx1_ASAP7_75t_R U73 ( .A(b[3]), .Y(n86) );
  INVx1_ASAP7_75t_R U74 ( .A(b[0]), .Y(n87) );
  NAND2xp33_ASAP7_75t_R U75 ( .A(n88), .B(n89), .Y(product[7]) );
  NAND2xp33_ASAP7_75t_R U76 ( .A(n90), .B(n91), .Y(n89) );
  OR2x2_ASAP7_75t_R U77 ( .A(n92), .B(n25), .Y(n88) );
  XOR2xp5_ASAP7_75t_R U78 ( .A(n91), .B(n90), .Y(product[6]) );
  XOR2xp5_ASAP7_75t_R U79 ( .A(n92), .B(n25), .Y(n90) );
  NAND2xp33_ASAP7_75t_R U80 ( .A(b[3]), .B(a[3]), .Y(n92) );
  NAND2xp33_ASAP7_75t_R U81 ( .A(n93), .B(n94), .Y(n91) );
  NAND2xp33_ASAP7_75t_R U82 ( .A(n95), .B(n96), .Y(n94) );
  OR2x2_ASAP7_75t_R U83 ( .A(n26), .B(n29), .Y(n93) );
  XOR2xp5_ASAP7_75t_R U84 ( .A(n96), .B(n95), .Y(product[5]) );
  XOR2xp5_ASAP7_75t_R U85 ( .A(n26), .B(n29), .Y(n95) );
  NAND2xp33_ASAP7_75t_R U86 ( .A(n97), .B(n98), .Y(n96) );
  NAND2xp33_ASAP7_75t_R U87 ( .A(n99), .B(n100), .Y(n98) );
  OR2x2_ASAP7_75t_R U88 ( .A(n30), .B(n34), .Y(n97) );
  XOR2xp5_ASAP7_75t_R U89 ( .A(n100), .B(n99), .Y(product[4]) );
  XOR2xp5_ASAP7_75t_R U90 ( .A(n30), .B(n34), .Y(n99) );
  NAND2xp33_ASAP7_75t_R U91 ( .A(n101), .B(n102), .Y(n100) );
  NAND2xp33_ASAP7_75t_R U92 ( .A(n103), .B(n104), .Y(n102) );
  NAND2xp33_ASAP7_75t_R U93 ( .A(n105), .B(n84), .Y(n101) );
  XOR2xp5_ASAP7_75t_R U94 ( .A(n104), .B(n103), .Y(product[3]) );
  XNOR2xp5_ASAP7_75t_R U95 ( .A(n35), .B(n105), .Y(n103) );
  XOR2xp5_ASAP7_75t_R U96 ( .A(n106), .B(n107), .Y(n105) );
  NAND2xp33_ASAP7_75t_R U97 ( .A(n108), .B(n109), .Y(n104) );
  NAND2xp33_ASAP7_75t_R U98 ( .A(n110), .B(n111), .Y(n109) );
  NAND2xp33_ASAP7_75t_R U99 ( .A(n112), .B(n113), .Y(n108) );
  XOR2xp5_ASAP7_75t_R U100 ( .A(n110), .B(n111), .Y(product[2]) );
  XOR2xp5_ASAP7_75t_R U101 ( .A(n112), .B(n113), .Y(n111) );
  XOR2xp5_ASAP7_75t_R U102 ( .A(n114), .B(n115), .Y(n113) );
  NOR2xp33_ASAP7_75t_R U103 ( .A(n83), .B(n87), .Y(n112) );
  NOR2xp33_ASAP7_75t_R U104 ( .A(n116), .B(n117), .Y(n110) );
  XOR2xp5_ASAP7_75t_R U105 ( .A(n116), .B(n117), .Y(product[1]) );
  NAND2xp33_ASAP7_75t_R U106 ( .A(b[1]), .B(a[0]), .Y(n117) );
  NAND2xp33_ASAP7_75t_R U107 ( .A(b[0]), .B(a[1]), .Y(n116) );
  NOR2xp33_ASAP7_75t_R U108 ( .A(n87), .B(n85), .Y(product[0]) );
  NOR2xp33_ASAP7_75t_R U109 ( .A(n85), .B(n86), .Y(n52) );
  AND2x2_ASAP7_75t_R U110 ( .A(a[1]), .B(b[2]), .Y(n49) );
  AND2x2_ASAP7_75t_R U111 ( .A(a[2]), .B(b[2]), .Y(n45) );
  NOR2xp33_ASAP7_75t_R U112 ( .A(n83), .B(n86), .Y(n44) );
  AND2x2_ASAP7_75t_R U113 ( .A(b[2]), .B(a[3]), .Y(n41) );
  NOR2xp33_ASAP7_75t_R U114 ( .A(n115), .B(n114), .Y(n38) );
  NAND2xp33_ASAP7_75t_R U115 ( .A(b[1]), .B(a[1]), .Y(n114) );
  NAND2xp33_ASAP7_75t_R U116 ( .A(b[2]), .B(a[0]), .Y(n115) );
  NOR2xp33_ASAP7_75t_R U117 ( .A(n107), .B(n106), .Y(n36) );
  NAND2xp33_ASAP7_75t_R U118 ( .A(a[3]), .B(b[0]), .Y(n106) );
  NAND2xp33_ASAP7_75t_R U119 ( .A(a[2]), .B(b[1]), .Y(n107) );
  XOR2xp5_ASAP7_75t_R U120 ( .A(n118), .B(n119), .Y(n32) );
  NOR2xp33_ASAP7_75t_R U121 ( .A(n118), .B(n119), .Y(n31) );
  NAND2xp33_ASAP7_75t_R U122 ( .A(a[3]), .B(b[1]), .Y(n119) );
  NAND2xp33_ASAP7_75t_R U123 ( .A(b[3]), .B(a[1]), .Y(n118) );
endmodule

