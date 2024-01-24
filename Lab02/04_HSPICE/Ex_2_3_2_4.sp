.TITLE 2-4

.protect
.include 'asap7sc7p5t_AO_RVT.sp'
.include 'asap7sc7p5t_INVBUF_RVT.sp'
.include 'asap7sc7p5t_OA_RVT.sp'
.include 'asap7sc7p5t_SEQ_RVT.sp'
.include 'asap7sc7p5t_SIMPLE_RVT.sp'
.include '7nm_TT.pm'
.unprotect

.global VDD GND
VVDD VDD GND 0.7v
**** Input Vector ****
.VEC 'pattern_adder_4bit.vec'

**** include the Adder****
.include 'Adder_4bit_SYN_new.sp'
 
x1  GND VDD  A3 A2 A1 A0 B3 B2 B1 B0 Output4 Output3 Output2 Output1 Output0 Adder_4bit

C1  Output4  GND 5ff
C2  Output3  GND 5ff
C3  Output2  GND 5ff
C4  Output1  GND 5ff
C5  Output0  GND 5ff


.option post 
.options probe			*with I/V in .lis
.probe v(*) i(*)
.option captab			*with cap value in .lis
.TEMP 25
.meas tran pwr avg power
.MEAS TRAN TpLH TRIG v(A0) VAL=0.35v FALL=5 TARG v(Output3) VAL=0.35v RISE=5
.MEAS TRAN TpHL TRIG v(A0) VAL=0.35v RISE=5 TARG v(Output3) VAL=0.35v FALL=5
.tran .2Ps 260000Ps
.end
