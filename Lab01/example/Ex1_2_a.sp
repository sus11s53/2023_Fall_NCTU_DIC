.TITLE Ex1_2_a
*****************************
**     Library setting     **
*****************************
.protect
.include 'asap7sc7p5t_INVBUF_RVT.sp'
.include '7nm_TT.pm'
.unprotect

*****************************
**     Voltage Source      **
*****************************
*.global VDD GND
VDD VDD 0 0.7

Vin in  0 0

VSS VSS 0 0

*****************************
**         Curcuit         **
*****************************
xsmallest_INV VSS VDD in out1 INVxp33_ASAP7_75t_R
xlargest_INV  VSS VDD in out2 INVx13_ASAP7_75t_R

*****************************
**      Measurement        **
*****************************
.DC Vin 0 0.7 0.01 VDD 0.4 0.7 0.1 
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

