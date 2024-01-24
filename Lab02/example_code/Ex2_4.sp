.TITLE Ex2_4
*****************************
**     Library setting     **
*****************************
.protect
.include '7nm_TT.pm'
.include 'asap7sc7p5t_OA_RVT.sp'
.include 'asap7sc7p5t_SIMPLE_RVT.sp'
.include 'asap7sc7p5t_AO_RVT.sp'
.include 'asap7sc7p5t_INVBUF_RVT.sp'
.include 'asap7sc7p5t_SEQ_RVT.sp'
.include 'Buffer.sp'

.unprotect
.vec 'Pattern_adder_4bit.vec'
*****************************
**     Voltage Source      **
*****************************
.global VDD GND
VDD VDD GND 0.7


*** .SUBSKT
.SUBCKT Adder_4bit VSS VDD  A[3] A[2] A[1] A[0] B[3] B[2] B[1] B[0] Output[4] Output[3] Output[2] Output[1] Output[0]
XU3 VSS VDD  A[0] B[0] Output[0] XOR2xp5_ASAP7_75t_R
XU4 VSS VDD  B[0] A[0] n11 NAND2xp5_ASAP7_75t_R
XU5 VSS VDD  B[1] A[1] n11 A0  Output[1] FAx1_ASAP7_75t_R
XU6 VSS VDD  B[2] A[2] n6 XNOR2xp5_ASAP7_75t_R
XU7 VSS VDD  B[1] A[1] n9 NAND2xp5_ASAP7_75t_R
XU8 VSS VDD  n11 n9 n4 NAND2xp5_ASAP7_75t_R
XU9 VSS VDD  B[1] A[1] n7 OR2x2_ASAP7_75t_R
XU10 VSS VDD  n4 n7 n5 NAND2xp5_ASAP7_75t_R
XU11 VSS VDD  n6 n5 Output[2] XOR2xp5_ASAP7_75t_R
XU12 VSS VDD  n7 n8 INVx1_ASAP7_75t_R
XU13 VSS VDD  B[2] A[2] n10 NAND2xp5_ASAP7_75t_R
XU14 VSS VDD  n8 n10 n14 NAND2xp5_ASAP7_75t_R
XU15 VSS VDD  B[2] A[2] n13 OR2x2_ASAP7_75t_R
XU16 VSS VDD  n11 n10 n9 n12 NAND3xp33_ASAP7_75t_R
XU17 VSS VDD  n14 n13 n12 n16 NAND3xp33_ASAP7_75t_R
XU18 VSS VDD  B[3] A[3] n15 XNOR2xp5_ASAP7_75t_R
XU19 VSS VDD  n16 n15 Output[3] XOR2xp5_ASAP7_75t_R
XU20 VSS VDD  n16 n18 INVx1_ASAP7_75t_R
XU21 VSS VDD  B[3] A[3] n17 OR2x2_ASAP7_75t_R
XU22 VSS VDD  n18 n17 n20 NAND2xp5_ASAP7_75t_R
XU23 VSS VDD  B[3] A[3] n19 NAND2xp5_ASAP7_75t_R
XU24 VSS VDD  n20 n19 Output[4] NAND2xp5_ASAP7_75t_R
.ENDS


*** CIRCUIT
xbuf0  in_A3 A_3_buf buffer
xbuf1  in_A2 A_2_buf buffer
xbuf2  in_A1 A_1_buf buffer
xbuf3  in_A0 A_0_buf buffer
xbuf4  in_B3 B_3_buf buffer
xbuf5  in_B2 B_2_buf buffer
xbuf6  in_B1 B_1_buf buffer
xbuf7  in_B0 B_0_buf buffer

xAdder_4bit GND VDD A_3_buf A_2_buf A_1_buf A_0_buf B_3_buf B_2_buf B_1_buf B_0_buf Out_4 Out_3 Out_2 Out_1 Out_0 Adder_4bit

Cout4 Out_4 GND 5f
Cout3 Out_3 GND 5f
Cout2 Out_2 GND 5f
Cout1 Out_1 GND 5f
Cout0 Out_0 GND 5f


*****************************
**      Measurement        **
*****************************
.tran 0.1ns 15ns 0.01ns
.measure TRAN T_R0  TRIG V(B_0_buf)    VAL=0.35 RISE=1   TARG V(Out_4) VAL=0.35 RISE=1 
.measure TRAN T_R1  TRIG V(B_0_buf)    VAL=0.35 RISE=2   TARG V(Out_4) VAL=0.35 RISE=2 
.measure TRAN T_R2  TRIG V(B_0_buf)    VAL=0.35 RISE=3   TARG V(Out_4) VAL=0.35 RISE=3 
.measure TRAN T_R3  TRIG V(B_0_buf)    VAL=0.35 RISE=4   TARG V(Out_4) VAL=0.35 RISE=4 
.measure TRAN T_R4  TRIG V(B_0_buf)    VAL=0.35 RISE=5   TARG V(Out_4) VAL=0.35 RISE=5 
.measure TRAN T_R5  TRIG V(B_0_buf)    VAL=0.35 RISE=6   TARG V(Out_4) VAL=0.35 RISE=6 
.measure TRAN T_R6  TRIG V(B_0_buf)    VAL=0.35 RISE=7   TARG V(Out_4) VAL=0.35 RISE=7 
.measure TRAN T_R7  TRIG V(B_0_buf)    VAL=0.35 RISE=8   TARG V(Out_4) VAL=0.35 RISE=8 
.measure TRAN T_R8  TRIG V(B_0_buf)    VAL=0.35 RISE=9   TARG V(Out_4) VAL=0.35 RISE=9 
.measure TRAN T_R9  TRIG V(B_0_buf)    VAL=0.35 RISE=10  TARG V(Out_4) VAL=0.35 RISE=10
.measure TRAN T_R10 TRIG V(B_0_buf)    VAL=0.35 RISE=11  TARG V(Out_4) VAL=0.35 RISE=11
.measure TRAN T_R11 TRIG V(B_0_buf)    VAL=0.35 RISE=12  TARG V(Out_4) VAL=0.35 RISE=12
.measure TRAN T_R12 TRIG V(B_0_buf)    VAL=0.35 RISE=13  TARG V(Out_4) VAL=0.35 RISE=13
.measure TRAN T_R13 TRIG V(B_0_buf)    VAL=0.35 RISE=14  TARG V(Out_4) VAL=0.35 RISE=14
.measure TRAN T_R14 TRIG V(B_0_buf)    VAL=0.35 RISE=15  TARG V(Out_4) VAL=0.35 RISE=15
.measure TRAN T_R15 TRIG V(B_0_buf)    VAL=0.35 RISE=16  TARG V(Out_4) VAL=0.35 RISE=16
.measure TRAN T_R16 TRIG V(B_0_buf)    VAL=0.35 RISE=17  TARG V(Out_4) VAL=0.35 RISE=17
.measure TRAN T_R17 TRIG V(B_0_buf)    VAL=0.35 RISE=18  TARG V(Out_4) VAL=0.35 RISE=18
.measure TRAN T_R18 TRIG V(B_0_buf)    VAL=0.35 RISE=19  TARG V(Out_4) VAL=0.35 RISE=19
.measure TRAN T_R19 TRIG V(B_0_buf)    VAL=0.35 RISE=20  TARG V(Out_4) VAL=0.35 RISE=20
.measure TRAN T_R20 TRIG V(B_0_buf)    VAL=0.35 RISE=21  TARG V(Out_4) VAL=0.35 RISE=21
.measure TRAN T_R21 TRIG V(B_0_buf)    VAL=0.35 RISE=22  TARG V(Out_4) VAL=0.35 RISE=22
.measure TRAN T_R22 TRIG V(B_0_buf)    VAL=0.35 RISE=23  TARG V(Out_4) VAL=0.35 RISE=23
.measure TRAN T_R23 TRIG V(B_0_buf)    VAL=0.35 RISE=24  TARG V(Out_4) VAL=0.35 RISE=24
.measure TRAN T_R24 TRIG V(B_0_buf)    VAL=0.35 RISE=25  TARG V(Out_4) VAL=0.35 RISE=25

.measure TRAN T_F0  TRIG V(B_0_buf)    VAL=0.35 FALL=1   TARG V(Out_4) VAL=0.35 FALL=1 
.measure TRAN T_F1  TRIG V(B_0_buf)    VAL=0.35 FALL=2   TARG V(Out_4) VAL=0.35 FALL=2 
.measure TRAN T_F2  TRIG V(B_0_buf)    VAL=0.35 FALL=3   TARG V(Out_4) VAL=0.35 FALL=3 
.measure TRAN T_F3  TRIG V(B_0_buf)    VAL=0.35 FALL=4   TARG V(Out_4) VAL=0.35 FALL=4 
.measure TRAN T_F4  TRIG V(B_0_buf)    VAL=0.35 FALL=5   TARG V(Out_4) VAL=0.35 FALL=5 
.measure TRAN T_F5  TRIG V(B_0_buf)    VAL=0.35 FALL=6   TARG V(Out_4) VAL=0.35 FALL=6 
.measure TRAN T_F6  TRIG V(B_0_buf)    VAL=0.35 FALL=7   TARG V(Out_4) VAL=0.35 FALL=7 
.measure TRAN T_F7  TRIG V(B_0_buf)    VAL=0.35 FALL=8   TARG V(Out_4) VAL=0.35 FALL=8 
.measure TRAN T_F8  TRIG V(B_0_buf)    VAL=0.35 FALL=9   TARG V(Out_4) VAL=0.35 FALL=9 
.measure TRAN T_F9  TRIG V(B_0_buf)    VAL=0.35 FALL=10  TARG V(Out_4) VAL=0.35 FALL=10
.measure TRAN T_F10 TRIG V(B_0_buf)    VAL=0.35 FALL=11  TARG V(Out_4) VAL=0.35 FALL=11
.measure TRAN T_F11 TRIG V(B_0_buf)    VAL=0.35 FALL=12  TARG V(Out_4) VAL=0.35 FALL=12
.measure TRAN T_F12 TRIG V(B_0_buf)    VAL=0.35 FALL=13  TARG V(Out_4) VAL=0.35 FALL=13
.measure TRAN T_F13 TRIG V(B_0_buf)    VAL=0.35 FALL=14  TARG V(Out_4) VAL=0.35 FALL=14
.measure TRAN T_F14 TRIG V(B_0_buf)    VAL=0.35 FALL=15  TARG V(Out_4) VAL=0.35 FALL=15
.measure TRAN T_F15 TRIG V(B_0_buf)    VAL=0.35 FALL=16  TARG V(Out_4) VAL=0.35 FALL=16
.measure TRAN T_F16 TRIG V(B_0_buf)    VAL=0.35 FALL=17  TARG V(Out_4) VAL=0.35 FALL=17
.measure TRAN T_F17 TRIG V(B_0_buf)    VAL=0.35 FALL=18  TARG V(Out_4) VAL=0.35 FALL=18
.measure TRAN T_F18 TRIG V(B_0_buf)    VAL=0.35 FALL=19  TARG V(Out_4) VAL=0.35 FALL=19
.measure TRAN T_F19 TRIG V(B_0_buf)    VAL=0.35 FALL=20  TARG V(Out_4) VAL=0.35 FALL=20
.measure TRAN T_F20 TRIG V(B_0_buf)    VAL=0.35 FALL=21  TARG V(Out_4) VAL=0.35 FALL=21
.measure TRAN T_F21 TRIG V(B_0_buf)    VAL=0.35 FALL=22  TARG V(Out_4) VAL=0.35 FALL=22
.measure TRAN T_F22 TRIG V(B_0_buf)    VAL=0.35 FALL=23  TARG V(Out_4) VAL=0.35 FALL=23
.measure TRAN T_F23 TRIG V(B_0_buf)    VAL=0.35 FALL=24  TARG V(Out_4) VAL=0.35 FALL=24

.measure tran T_RISE  param='max(T_R0,T_R1,T_R2,T_R3,T_R4,T_R5,T_R6,T_R7,T_R8,T_R9,T_R10,T_R11,T_R12,T_R13,T_R14,T_R15,T_R16,T_R17,T_R18,T_R19,T_R20,T_R21,T_R22,T_R23,T_R24)'
.measure tran T_FALL  param='max(T_F0,T_F1,T_F2,T_F3,T_F4,T_F5,T_F6,T_F7,T_F8,T_F9,T_F10,T_F11,T_F12,T_F13,T_F14,T_F15,T_F16,T_F17,T_F18,T_F19,T_F20,T_F21,T_F22,T_F23)'
.measure tran Worst_case_delay  param='max(T_RISE,T_FALL)'
.meas tran pwr avg POWER 
*** 
*****************************
**    Simulator setting    **
*****************************
.option post 
.options probe	
.probe v(*) i(*)
.option captab	
.TEMP 25

.op

.end