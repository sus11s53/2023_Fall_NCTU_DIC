.TITLE Ex2_1
*****************************
**     Library setting     **
*****************************
.protect
.include '7nm_TT.pm'
.include 'asap7_75t_R_24.cdl'
.include 'Buffer.sp'

.unprotect
.vec 'Pattern_adder_1bit.vec'
*****************************
**     Voltage Source      **
*****************************
.global VDD GND
VDD VDD GND 0.7


xbuf0 in_0 in_0_buf  buffer
xbuf1 in_1 in_1_buf  buffer
xbuf2 in_2 in_2_buf  buffer

xMAJI in_0_buf in_1_buf in_2_buf VDD GND wire2 MAJIxp5_ASAP7_75t_R
xINV  wire2  VDD GND  C_out INVxp33_ASAP7_75t_R
xXOR1 in_0_buf in_1_buf VDD GND wire1 XOR2xp5_ASAP7_75t_R
xXOR2 wire1 in_2_buf VDD GND S_out XOR2xp5_ASAP7_75t_R

C1 C_out GND 5f
C2 S_out GND 5f

*****************************
**      Measurement        **
*****************************
.tran 0.1ns 50ns 0.01ns
.meas tran pwr avg POWER 
.include 'Measure.sp'
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

