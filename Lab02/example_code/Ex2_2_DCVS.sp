.TITLE Ex2_2_DCVS
*****************************
**     Library setting     **
*****************************
.protect
.include '7nm_TT.pm'
*.include 'asap7_75t_R_24.cdl'
.include 'Buffer.sp'

.unprotect
.vec 'Pattern_adder_1bit.vec'
*****************************
**     Voltage Source      **
*****************************
.global VDD GND
VDD VDD GND 0.7


xinv0 in_0_buf in_0_inv  inverter
xinv1 in_1_buf in_1_inv  inverter
xinv2 in_2_buf in_2_inv  inverter

xbuf0 in_0 in_0_buf      buffer
xbuf1 in_1 in_1_buf      buffer
xbuf2 in_2 in_2_buf      buffer

mp_C_0 C_out C_out_bar VDD     x pmos_rvt  m=1
mp_C_1 C_out_bar C_out VDD     x pmos_rvt  m=1

mn_C_0 C_out_bar in_1_buf  wire_C0 x nmos_rvt  m=2
mn_C_1 C_out_bar in_0_buf  wire_C1 x nmos_rvt  m=2
mn_C_2 C_out in_0_inv  wire_C2 x nmos_rvt  m=2
mn_C_3 C_out in_1_inv  wire_C3 x nmos_rvt  m=2

mn_C_4 wire_C0 in_2_buf GND x nmos_rvt  m=2
mn_C_5 wire_C1 in_1_buf GND x nmos_rvt  m=2
mn_C_6 wire_C1 in_2_buf GND x nmos_rvt  m=2
mn_C_7 wire_C2 in_2_inv GND x nmos_rvt  m=2
mn_C_8 wire_C2 in_1_inv GND x nmos_rvt  m=2
mn_C_9 wire_C3 in_2_inv GND x nmos_rvt  m=2



mp_S_0 S_out S_out_bar VDD     x pmos_rvt  m=1
mp_S_1 S_out_bar S_out VDD     x pmos_rvt  m=1

mn_S_0 S_out_bar in_0_buf wire_S0 x nmos_rvt m=2
mn_S_1 S_out_bar in_0_inv wire_S1 x nmos_rvt m=2
mn_S_2 S_out     in_0_inv wire_S0 x nmos_rvt m=2
mn_S_3 S_out     in_0_buf wire_S1 x nmos_rvt m=2

mn_S_4 wire_S0   in_1_buf wire_S2 x nmos_rvt m=2
mn_S_5 wire_S0   in_1_inv wire_S3 x nmos_rvt m=2
mn_S_6 wire_S1   in_1_inv wire_S2 x nmos_rvt m=2
mn_S_7 wire_S1   in_1_buf wire_S3 x nmos_rvt m=2

mn_S_8 wire_S2   in_2_buf GND x nmos_rvt m=2
mn_S_9 wire_S3   in_2_inv GND x nmos_rvt m=2

C1 C_out GND 5f
C2 S_out GND 5f
C3 C_out_bar GND 5f
C4 S_out_bar GND 5f

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

