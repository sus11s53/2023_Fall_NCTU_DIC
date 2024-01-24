.SUBCKT Convolution IFM_0[3] IFM_0[2] IFM_0[1] IFM_0[0] IFM_1[3] IFM_1[2] IFM_1[1] IFM_1[0] IFM_2[3] IFM_2[2] IFM_2[1] IFM_2[0] IFM_3[3] IFM_3[2] IFM_3[1] IFM_3[0] INW_0[3] INW_0[2] INW_0[1] INW_0[0] INW_1[3] INW_1[2] INW_1[1] INW_1[0] INW_2[3] INW_2[2] INW_2[1] INW_2[0] INW_3[3] INW_3[2] INW_3[1] INW_3[0] Output[9] Output[8] Output[7] Output[6] Output[5] Output[4] Output[3] Output[2] Output[1] Output[0] Port10
Xmult_19 IFM_0[3] IFM_0[2] IFM_0[1] IFM_0[0] INW_0[3] INW_0[2] INW_0[1] INW_0[0] N7 N6 N5 N4 N3 N2 N1 N0 Convolution_DW_mult_uns_3
Xmult_19_2 IFM_1[3] IFM_1[2] IFM_1[1] IFM_1[0] INW_1[3] INW_1[2] INW_1[1] INW_1[0] N15 N14 N13 N12 N11 N10 N9 N8 Convolution_DW_mult_uns_2
Xmult_19_3 IFM_2[3] IFM_2[2] IFM_2[1] IFM_2[0] INW_2[3] INW_2[2] INW_2[1] INW_2[0] N32 N31 N30 N29 N28 N27 N26 N25 Convolution_DW_mult_uns_1
Xmult_19_4 IFM_3[3] IFM_3[2] IFM_3[1] IFM_3[0] INW_3[3] INW_3[2] INW_3[1] INW_3[0] N50 N49 N48 N47 N46 N45 N44 N43 Convolution_DW_mult_uns_0
Xadd_1_root_add_0_root_add_19_3 N42 N42 N15 N14 N13 N12 N11 N10 N9 N8 N42 N42 N50 N49 N48 N47 N46 N45 N44 N43 N42 SYNOPSYS_UNCONNECTED_1 n9 n8 n7 n6 n5 n4 n3 n2 n1 Convolution_DW01_add_2
Xadd_2_root_add_0_root_add_19_3 N42 N42 N7 N6 N5 N4 N3 N2 N1 N0 N42 N42 N32 N31 N30 N29 N28 N27 N26 N25 N42 SYNOPSYS_UNCONNECTED_2 N41 N40 N39 N38 N37 N36 N35 N34 N33 Convolution_DW01_add_1
Xadd_0_root_add_0_root_add_19_3 N42 N41 N40 N39 N38 N37 N36 N35 N34 N33 N42 n9 n8 n7 n6 n5 n4 n3 n2 n1 N42 Output[9] Output[8] Output[7] Output[6] Output[5] Output[4] Output[3] Output[2] Output[1] Output[0] Convolution_DW01_add_0
XU1 N42 TIELOx1_ASAP7_75t_R
.ENDS


.SUBCKT Convolution_DW01_add_0 A[9] A[8] A[7] A[6] A[5] A[4] A[3] A[2] A[1] A[0] B[9] B[8] B[7] B[6] B[5] B[4] B[3] B[2] B[1] B[0] CI SUM[9] SUM[8] SUM[7] SUM[6] SUM[5] SUM[4] SUM[3] SUM[2] SUM[1] SUM[0] CO
XU1_8 A[8] B[8] n3 n10 n11 FAx1_ASAP7_75t_R
XU1_7 A[7] B[7] n4 n12 n13 FAx1_ASAP7_75t_R
XU1_6 A[6] B[6] n5 n14 n15 FAx1_ASAP7_75t_R
XU1_5 A[5] B[5] n6 n16 n17 FAx1_ASAP7_75t_R
XU1_4 A[4] B[4] n7 n18 n19 FAx1_ASAP7_75t_R
XU1_3 A[3] B[3] n8 n20 n21 FAx1_ASAP7_75t_R
XU1_2 A[2] B[2] n9 n22 n23 FAx1_ASAP7_75t_R
XU1_1 A[1] B[1] n1 n24 n25 FAx1_ASAP7_75t_R
XU1 A[0] B[0] n1 AND2x2_ASAP7_75t_R
XU2 B[0] A[0] SUM[0] XOR2xp5_ASAP7_75t_R
XU3 n12 n3 INVx1_ASAP7_75t_R
XU4 n14 n4 INVx1_ASAP7_75t_R
XU5 n16 n5 INVx1_ASAP7_75t_R
XU6 n18 n6 INVx1_ASAP7_75t_R
XU7 n20 n7 INVx1_ASAP7_75t_R
XU8 n22 n8 INVx1_ASAP7_75t_R
XU9 n24 n9 INVx1_ASAP7_75t_R
XU10 n10 SUM[9] INVx1_ASAP7_75t_R
XU11 n11 SUM[8] INVx1_ASAP7_75t_R
XU12 n13 SUM[7] INVx1_ASAP7_75t_R
XU13 n15 SUM[6] INVx1_ASAP7_75t_R
XU14 n17 SUM[5] INVx1_ASAP7_75t_R
XU15 n19 SUM[4] INVx1_ASAP7_75t_R
XU16 n21 SUM[3] INVx1_ASAP7_75t_R
XU17 n23 SUM[2] INVx1_ASAP7_75t_R
XU18 n25 SUM[1] INVx1_ASAP7_75t_R
.ENDS


.SUBCKT Convolution_DW01_add_1 A[9] A[8] A[7] A[6] A[5] A[4] A[3] A[2] A[1] A[0] B[9] B[8] B[7] B[6] B[5] B[4] B[3] B[2] B[1] B[0] CI SUM[9] SUM[8] SUM[7] SUM[6] SUM[5] SUM[4] SUM[3] SUM[2] SUM[1] SUM[0] CO
XU1_7 A[7] B[7] n3 n9 n10 FAx1_ASAP7_75t_R
XU1_6 A[6] B[6] n4 n11 n12 FAx1_ASAP7_75t_R
XU1_5 A[5] B[5] n5 n13 n14 FAx1_ASAP7_75t_R
XU1_4 A[4] B[4] n6 n15 n16 FAx1_ASAP7_75t_R
XU1_3 A[3] B[3] n7 n17 n18 FAx1_ASAP7_75t_R
XU1_2 A[2] B[2] n8 n19 n20 FAx1_ASAP7_75t_R
XU1_1 A[1] B[1] n2 n21 n22 FAx1_ASAP7_75t_R
XU1 B[0] A[0] SUM[0] XOR2xp5_ASAP7_75t_R
XU2 A[0] B[0] n2 AND2x2_ASAP7_75t_R
XU3 n11 n3 INVx1_ASAP7_75t_R
XU4 n13 n4 INVx1_ASAP7_75t_R
XU5 n15 n5 INVx1_ASAP7_75t_R
XU6 n17 n6 INVx1_ASAP7_75t_R
XU7 n19 n7 INVx1_ASAP7_75t_R
XU8 n21 n8 INVx1_ASAP7_75t_R
XU9 n9 SUM[8] INVx1_ASAP7_75t_R
XU10 n10 SUM[7] INVx1_ASAP7_75t_R
XU11 n12 SUM[6] INVx1_ASAP7_75t_R
XU12 n14 SUM[5] INVx1_ASAP7_75t_R
XU13 n16 SUM[4] INVx1_ASAP7_75t_R
XU14 n18 SUM[3] INVx1_ASAP7_75t_R
XU15 n20 SUM[2] INVx1_ASAP7_75t_R
XU16 n22 SUM[1] INVx1_ASAP7_75t_R
.ENDS


.SUBCKT Convolution_DW01_add_2 A[9] A[8] A[7] A[6] A[5] A[4] A[3] A[2] A[1] A[0] B[9] B[8] B[7] B[6] B[5] B[4] B[3] B[2] B[1] B[0] CI SUM[9] SUM[8] SUM[7] SUM[6] SUM[5] SUM[4] SUM[3] SUM[2] SUM[1] SUM[0] CO
XU1_7 A[7] B[7] n3 n9 n10 FAx1_ASAP7_75t_R
XU1_6 A[6] B[6] n4 n11 n12 FAx1_ASAP7_75t_R
XU1_5 A[5] B[5] n5 n13 n14 FAx1_ASAP7_75t_R
XU1_4 A[4] B[4] n6 n15 n16 FAx1_ASAP7_75t_R
XU1_3 A[3] B[3] n7 n17 n18 FAx1_ASAP7_75t_R
XU1_2 A[2] B[2] n8 n19 n20 FAx1_ASAP7_75t_R
XU1_1 A[1] B[1] n1 n21 n22 FAx1_ASAP7_75t_R
XU1 A[0] B[0] n1 AND2x2_ASAP7_75t_R
XU2 B[0] A[0] SUM[0] XOR2xp5_ASAP7_75t_R
XU3 n11 n3 INVx1_ASAP7_75t_R
XU4 n13 n4 INVx1_ASAP7_75t_R
XU5 n15 n5 INVx1_ASAP7_75t_R
XU6 n17 n6 INVx1_ASAP7_75t_R
XU7 n19 n7 INVx1_ASAP7_75t_R
XU8 n21 n8 INVx1_ASAP7_75t_R
XU9 n9 SUM[8] INVx1_ASAP7_75t_R
XU10 n10 SUM[7] INVx1_ASAP7_75t_R
XU11 n12 SUM[6] INVx1_ASAP7_75t_R
XU12 n14 SUM[5] INVx1_ASAP7_75t_R
XU13 n16 SUM[4] INVx1_ASAP7_75t_R
XU14 n18 SUM[3] INVx1_ASAP7_75t_R
XU15 n20 SUM[2] INVx1_ASAP7_75t_R
XU16 n22 SUM[1] INVx1_ASAP7_75t_R
.ENDS


.SUBCKT Convolution_DW_mult_uns_0 a[3] a[2] a[1] a[0] b[3] b[2] b[1] b[0] product[7] product[6] product[5] product[4] product[3] product[2] product[1] product[0]
XU32 n41 n44 n31 n25 n26 FAx1_ASAP7_75t_R
XU35 n36 n45 n32 n29 n30 FAx1_ASAP7_75t_R
XU39 n49 n52 n38 n34 n35 FAx1_ASAP7_75t_R
XU70 a[2] n83 INVx1_ASAP7_75t_R
XU71 n35 n84 INVx1_ASAP7_75t_R
XU72 a[0] n85 INVx1_ASAP7_75t_R
XU73 b[3] n86 INVx1_ASAP7_75t_R
XU74 b[0] n87 INVx1_ASAP7_75t_R
XU75 n88 n89 product[7] NAND2xp33_ASAP7_75t_R
XU76 n90 n91 n89 NAND2xp33_ASAP7_75t_R
XU77 n92 n25 n88 OR2x2_ASAP7_75t_R
XU78 n91 n90 product[6] XOR2xp5_ASAP7_75t_R
XU79 n92 n25 n90 XOR2xp5_ASAP7_75t_R
XU80 b[3] a[3] n92 NAND2xp33_ASAP7_75t_R
XU81 n93 n94 n91 NAND2xp33_ASAP7_75t_R
XU82 n95 n96 n94 NAND2xp33_ASAP7_75t_R
XU83 n26 n29 n93 OR2x2_ASAP7_75t_R
XU84 n96 n95 product[5] XOR2xp5_ASAP7_75t_R
XU85 n26 n29 n95 XOR2xp5_ASAP7_75t_R
XU86 n97 n98 n96 NAND2xp33_ASAP7_75t_R
XU87 n99 n100 n98 NAND2xp33_ASAP7_75t_R
XU88 n30 n34 n97 OR2x2_ASAP7_75t_R
XU89 n100 n99 product[4] XOR2xp5_ASAP7_75t_R
XU90 n30 n34 n99 XOR2xp5_ASAP7_75t_R
XU91 n101 n102 n100 NAND2xp33_ASAP7_75t_R
XU92 n103 n104 n102 NAND2xp33_ASAP7_75t_R
XU93 n105 n84 n101 NAND2xp33_ASAP7_75t_R
XU94 n104 n103 product[3] XOR2xp5_ASAP7_75t_R
XU95 n35 n105 n103 XNOR2xp5_ASAP7_75t_R
XU96 n106 n107 n105 XOR2xp5_ASAP7_75t_R
XU97 n108 n109 n104 NAND2xp33_ASAP7_75t_R
XU98 n110 n111 n109 NAND2xp33_ASAP7_75t_R
XU99 n112 n113 n108 NAND2xp33_ASAP7_75t_R
XU100 n110 n111 product[2] XOR2xp5_ASAP7_75t_R
XU101 n112 n113 n111 XOR2xp5_ASAP7_75t_R
XU102 n114 n115 n113 XOR2xp5_ASAP7_75t_R
XU103 n83 n87 n112 NOR2xp33_ASAP7_75t_R
XU104 n116 n117 n110 NOR2xp33_ASAP7_75t_R
XU105 n116 n117 product[1] XOR2xp5_ASAP7_75t_R
XU106 b[1] a[0] n117 NAND2xp33_ASAP7_75t_R
XU107 b[0] a[1] n116 NAND2xp33_ASAP7_75t_R
XU108 n87 n85 product[0] NOR2xp33_ASAP7_75t_R
XU109 n85 n86 n52 NOR2xp33_ASAP7_75t_R
XU110 a[1] b[2] n49 AND2x2_ASAP7_75t_R
XU111 a[2] b[2] n45 AND2x2_ASAP7_75t_R
XU112 n83 n86 n44 NOR2xp33_ASAP7_75t_R
XU113 b[2] a[3] n41 AND2x2_ASAP7_75t_R
XU114 n115 n114 n38 NOR2xp33_ASAP7_75t_R
XU115 b[1] a[1] n114 NAND2xp33_ASAP7_75t_R
XU116 b[2] a[0] n115 NAND2xp33_ASAP7_75t_R
XU117 n107 n106 n36 NOR2xp33_ASAP7_75t_R
XU118 a[3] b[0] n106 NAND2xp33_ASAP7_75t_R
XU119 a[2] b[1] n107 NAND2xp33_ASAP7_75t_R
XU120 n118 n119 n32 XOR2xp5_ASAP7_75t_R
XU121 n118 n119 n31 NOR2xp33_ASAP7_75t_R
XU122 a[3] b[1] n119 NAND2xp33_ASAP7_75t_R
XU123 b[3] a[1] n118 NAND2xp33_ASAP7_75t_R
.ENDS


.SUBCKT Convolution_DW_mult_uns_1 a[3] a[2] a[1] a[0] b[3] b[2] b[1] b[0] product[7] product[6] product[5] product[4] product[3] product[2] product[1] product[0]
XU32 n41 n44 n31 n25 n26 FAx1_ASAP7_75t_R
XU35 n36 n45 n32 n29 n30 FAx1_ASAP7_75t_R
XU39 n49 n52 n38 n34 n35 FAx1_ASAP7_75t_R
XU70 a[2] n83 INVx1_ASAP7_75t_R
XU71 n35 n84 INVx1_ASAP7_75t_R
XU72 a[0] n85 INVx1_ASAP7_75t_R
XU73 b[3] n86 INVx1_ASAP7_75t_R
XU74 b[0] n87 INVx1_ASAP7_75t_R
XU75 n88 n89 product[7] NAND2xp33_ASAP7_75t_R
XU76 n90 n91 n89 NAND2xp33_ASAP7_75t_R
XU77 n92 n25 n88 OR2x2_ASAP7_75t_R
XU78 n91 n90 product[6] XOR2xp5_ASAP7_75t_R
XU79 n92 n25 n90 XOR2xp5_ASAP7_75t_R
XU80 b[3] a[3] n92 NAND2xp33_ASAP7_75t_R
XU81 n93 n94 n91 NAND2xp33_ASAP7_75t_R
XU82 n95 n96 n94 NAND2xp33_ASAP7_75t_R
XU83 n26 n29 n93 OR2x2_ASAP7_75t_R
XU84 n96 n95 product[5] XOR2xp5_ASAP7_75t_R
XU85 n26 n29 n95 XOR2xp5_ASAP7_75t_R
XU86 n97 n98 n96 NAND2xp33_ASAP7_75t_R
XU87 n99 n100 n98 NAND2xp33_ASAP7_75t_R
XU88 n30 n34 n97 OR2x2_ASAP7_75t_R
XU89 n100 n99 product[4] XOR2xp5_ASAP7_75t_R
XU90 n30 n34 n99 XOR2xp5_ASAP7_75t_R
XU91 n101 n102 n100 NAND2xp33_ASAP7_75t_R
XU92 n103 n104 n102 NAND2xp33_ASAP7_75t_R
XU93 n105 n84 n101 NAND2xp33_ASAP7_75t_R
XU94 n104 n103 product[3] XOR2xp5_ASAP7_75t_R
XU95 n35 n105 n103 XNOR2xp5_ASAP7_75t_R
XU96 n106 n107 n105 XOR2xp5_ASAP7_75t_R
XU97 n108 n109 n104 NAND2xp33_ASAP7_75t_R
XU98 n110 n111 n109 NAND2xp33_ASAP7_75t_R
XU99 n112 n113 n108 NAND2xp33_ASAP7_75t_R
XU100 n110 n111 product[2] XOR2xp5_ASAP7_75t_R
XU101 n112 n113 n111 XOR2xp5_ASAP7_75t_R
XU102 n114 n115 n113 XOR2xp5_ASAP7_75t_R
XU103 n83 n87 n112 NOR2xp33_ASAP7_75t_R
XU104 n116 n117 n110 NOR2xp33_ASAP7_75t_R
XU105 n116 n117 product[1] XOR2xp5_ASAP7_75t_R
XU106 b[1] a[0] n117 NAND2xp33_ASAP7_75t_R
XU107 b[0] a[1] n116 NAND2xp33_ASAP7_75t_R
XU108 n87 n85 product[0] NOR2xp33_ASAP7_75t_R
XU109 n85 n86 n52 NOR2xp33_ASAP7_75t_R
XU110 a[1] b[2] n49 AND2x2_ASAP7_75t_R
XU111 a[2] b[2] n45 AND2x2_ASAP7_75t_R
XU112 n83 n86 n44 NOR2xp33_ASAP7_75t_R
XU113 b[2] a[3] n41 AND2x2_ASAP7_75t_R
XU114 n115 n114 n38 NOR2xp33_ASAP7_75t_R
XU115 b[1] a[1] n114 NAND2xp33_ASAP7_75t_R
XU116 b[2] a[0] n115 NAND2xp33_ASAP7_75t_R
XU117 n107 n106 n36 NOR2xp33_ASAP7_75t_R
XU118 a[3] b[0] n106 NAND2xp33_ASAP7_75t_R
XU119 a[2] b[1] n107 NAND2xp33_ASAP7_75t_R
XU120 n118 n119 n32 XOR2xp5_ASAP7_75t_R
XU121 n118 n119 n31 NOR2xp33_ASAP7_75t_R
XU122 a[3] b[1] n119 NAND2xp33_ASAP7_75t_R
XU123 b[3] a[1] n118 NAND2xp33_ASAP7_75t_R
.ENDS


.SUBCKT Convolution_DW_mult_uns_2 a[3] a[2] a[1] a[0] b[3] b[2] b[1] b[0] product[7] product[6] product[5] product[4] product[3] product[2] product[1] product[0]
XU32 n41 n44 n31 n25 n26 FAx1_ASAP7_75t_R
XU35 n36 n45 n32 n29 n30 FAx1_ASAP7_75t_R
XU39 n49 n52 n38 n34 n35 FAx1_ASAP7_75t_R
XU70 a[2] n83 INVx1_ASAP7_75t_R
XU71 n35 n84 INVx1_ASAP7_75t_R
XU72 a[0] n85 INVx1_ASAP7_75t_R
XU73 b[3] n86 INVx1_ASAP7_75t_R
XU74 b[0] n87 INVx1_ASAP7_75t_R
XU75 n88 n89 product[7] NAND2xp33_ASAP7_75t_R
XU76 n90 n91 n89 NAND2xp33_ASAP7_75t_R
XU77 n92 n25 n88 OR2x2_ASAP7_75t_R
XU78 n91 n90 product[6] XOR2xp5_ASAP7_75t_R
XU79 n92 n25 n90 XOR2xp5_ASAP7_75t_R
XU80 b[3] a[3] n92 NAND2xp33_ASAP7_75t_R
XU81 n93 n94 n91 NAND2xp33_ASAP7_75t_R
XU82 n95 n96 n94 NAND2xp33_ASAP7_75t_R
XU83 n26 n29 n93 OR2x2_ASAP7_75t_R
XU84 n96 n95 product[5] XOR2xp5_ASAP7_75t_R
XU85 n26 n29 n95 XOR2xp5_ASAP7_75t_R
XU86 n97 n98 n96 NAND2xp33_ASAP7_75t_R
XU87 n99 n100 n98 NAND2xp33_ASAP7_75t_R
XU88 n30 n34 n97 OR2x2_ASAP7_75t_R
XU89 n100 n99 product[4] XOR2xp5_ASAP7_75t_R
XU90 n30 n34 n99 XOR2xp5_ASAP7_75t_R
XU91 n101 n102 n100 NAND2xp33_ASAP7_75t_R
XU92 n103 n104 n102 NAND2xp33_ASAP7_75t_R
XU93 n105 n84 n101 NAND2xp33_ASAP7_75t_R
XU94 n104 n103 product[3] XOR2xp5_ASAP7_75t_R
XU95 n35 n105 n103 XNOR2xp5_ASAP7_75t_R
XU96 n106 n107 n105 XOR2xp5_ASAP7_75t_R
XU97 n108 n109 n104 NAND2xp33_ASAP7_75t_R
XU98 n110 n111 n109 NAND2xp33_ASAP7_75t_R
XU99 n112 n113 n108 NAND2xp33_ASAP7_75t_R
XU100 n110 n111 product[2] XOR2xp5_ASAP7_75t_R
XU101 n112 n113 n111 XOR2xp5_ASAP7_75t_R
XU102 n114 n115 n113 XOR2xp5_ASAP7_75t_R
XU103 n83 n87 n112 NOR2xp33_ASAP7_75t_R
XU104 n116 n117 n110 NOR2xp33_ASAP7_75t_R
XU105 n116 n117 product[1] XOR2xp5_ASAP7_75t_R
XU106 b[1] a[0] n117 NAND2xp33_ASAP7_75t_R
XU107 b[0] a[1] n116 NAND2xp33_ASAP7_75t_R
XU108 n87 n85 product[0] NOR2xp33_ASAP7_75t_R
XU109 n85 n86 n52 NOR2xp33_ASAP7_75t_R
XU110 a[1] b[2] n49 AND2x2_ASAP7_75t_R
XU111 a[2] b[2] n45 AND2x2_ASAP7_75t_R
XU112 n83 n86 n44 NOR2xp33_ASAP7_75t_R
XU113 b[2] a[3] n41 AND2x2_ASAP7_75t_R
XU114 n115 n114 n38 NOR2xp33_ASAP7_75t_R
XU115 b[1] a[1] n114 NAND2xp33_ASAP7_75t_R
XU116 b[2] a[0] n115 NAND2xp33_ASAP7_75t_R
XU117 n107 n106 n36 NOR2xp33_ASAP7_75t_R
XU118 a[3] b[0] n106 NAND2xp33_ASAP7_75t_R
XU119 a[2] b[1] n107 NAND2xp33_ASAP7_75t_R
XU120 n118 n119 n32 XOR2xp5_ASAP7_75t_R
XU121 n118 n119 n31 NOR2xp33_ASAP7_75t_R
XU122 a[3] b[1] n119 NAND2xp33_ASAP7_75t_R
XU123 b[3] a[1] n118 NAND2xp33_ASAP7_75t_R
.ENDS


.SUBCKT Convolution_DW_mult_uns_3 a[3] a[2] a[1] a[0] b[3] b[2] b[1] b[0] product[7] product[6] product[5] product[4] product[3] product[2] product[1] product[0]
XU32 n41 n44 n31 n25 n26 FAx1_ASAP7_75t_R
XU35 n36 n45 n32 n29 n30 FAx1_ASAP7_75t_R
XU39 n49 n52 n38 n34 n35 FAx1_ASAP7_75t_R
XU70 a[2] n83 INVx1_ASAP7_75t_R
XU71 n35 n84 INVx1_ASAP7_75t_R
XU72 a[0] n85 INVx1_ASAP7_75t_R
XU73 b[3] n86 INVx1_ASAP7_75t_R
XU74 b[0] n87 INVx1_ASAP7_75t_R
XU75 n88 n89 product[7] NAND2xp33_ASAP7_75t_R
XU76 n90 n91 n89 NAND2xp33_ASAP7_75t_R
XU77 n92 n25 n88 OR2x2_ASAP7_75t_R
XU78 n91 n90 product[6] XOR2xp5_ASAP7_75t_R
XU79 n92 n25 n90 XOR2xp5_ASAP7_75t_R
XU80 b[3] a[3] n92 NAND2xp33_ASAP7_75t_R
XU81 n93 n94 n91 NAND2xp33_ASAP7_75t_R
XU82 n95 n96 n94 NAND2xp33_ASAP7_75t_R
XU83 n26 n29 n93 OR2x2_ASAP7_75t_R
XU84 n96 n95 product[5] XOR2xp5_ASAP7_75t_R
XU85 n26 n29 n95 XOR2xp5_ASAP7_75t_R
XU86 n97 n98 n96 NAND2xp33_ASAP7_75t_R
XU87 n99 n100 n98 NAND2xp33_ASAP7_75t_R
XU88 n30 n34 n97 OR2x2_ASAP7_75t_R
XU89 n100 n99 product[4] XOR2xp5_ASAP7_75t_R
XU90 n30 n34 n99 XOR2xp5_ASAP7_75t_R
XU91 n101 n102 n100 NAND2xp33_ASAP7_75t_R
XU92 n103 n104 n102 NAND2xp33_ASAP7_75t_R
XU93 n105 n84 n101 NAND2xp33_ASAP7_75t_R
XU94 n104 n103 product[3] XOR2xp5_ASAP7_75t_R
XU95 n35 n105 n103 XNOR2xp5_ASAP7_75t_R
XU96 n106 n107 n105 XOR2xp5_ASAP7_75t_R
XU97 n108 n109 n104 NAND2xp33_ASAP7_75t_R
XU98 n110 n111 n109 NAND2xp33_ASAP7_75t_R
XU99 n112 n113 n108 NAND2xp33_ASAP7_75t_R
XU100 n110 n111 product[2] XOR2xp5_ASAP7_75t_R
XU101 n112 n113 n111 XOR2xp5_ASAP7_75t_R
XU102 n114 n115 n113 XOR2xp5_ASAP7_75t_R
XU103 n83 n87 n112 NOR2xp33_ASAP7_75t_R
XU104 n116 n117 n110 NOR2xp33_ASAP7_75t_R
XU105 n116 n117 product[1] XOR2xp5_ASAP7_75t_R
XU106 b[1] a[0] n117 NAND2xp33_ASAP7_75t_R
XU107 b[0] a[1] n116 NAND2xp33_ASAP7_75t_R
XU108 n87 n85 product[0] NOR2xp33_ASAP7_75t_R
XU109 n85 n86 n52 NOR2xp33_ASAP7_75t_R
XU110 a[1] b[2] n49 AND2x2_ASAP7_75t_R
XU111 a[2] b[2] n45 AND2x2_ASAP7_75t_R
XU112 n83 n86 n44 NOR2xp33_ASAP7_75t_R
XU113 b[2] a[3] n41 AND2x2_ASAP7_75t_R
XU114 n115 n114 n38 NOR2xp33_ASAP7_75t_R
XU115 b[1] a[1] n114 NAND2xp33_ASAP7_75t_R
XU116 b[2] a[0] n115 NAND2xp33_ASAP7_75t_R
XU117 n107 n106 n36 NOR2xp33_ASAP7_75t_R
XU118 a[3] b[0] n106 NAND2xp33_ASAP7_75t_R
XU119 a[2] b[1] n107 NAND2xp33_ASAP7_75t_R
XU120 n118 n119 n32 XOR2xp5_ASAP7_75t_R
XU121 n118 n119 n31 NOR2xp33_ASAP7_75t_R
XU122 a[3] b[1] n119 NAND2xp33_ASAP7_75t_R
XU123 b[3] a[1] n118 NAND2xp33_ASAP7_75t_R
.ENDS


