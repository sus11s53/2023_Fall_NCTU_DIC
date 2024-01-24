.TITLE Ex2_2_CPL
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


.subckt CPL_AND A A_bar B B_bar out out_bar
    Mn_0  out      B      A      x  nmos_rvt  m=1
    Mn_1  out      B_bar  B      x  nmos_rvt  m=1
    Mn_2  out_bar  B      A_bar  x  nmos_rvt  m=1
    Mn_3  out_bar  B_bar  B_bar  x  nmos_rvt  m=1
.ends
.subckt CPL_OR A A_bar B B_bar out out_bar
    Mn_0  out      B_bar  A      x  nmos_rvt  m=1
    Mn_1  out      B      B      x  nmos_rvt  m=1
    Mn_2  out_bar  B_bar  A_bar  x  nmos_rvt  m=1
    Mn_3  out_bar  B      B_bar  x  nmos_rvt  m=1
.ends
.subckt CPL_XOR A A_bar B B_bar out out_bar
    Mn_0  out      B_bar  A      x  nmos_rvt  m=1
    Mn_1  out      B      A_bar  x  nmos_rvt  m=1
    Mn_2  out_bar  B_bar  A_bar  x  nmos_rvt  m=1
    Mn_3  out_bar  B      A      x  nmos_rvt  m=1
.ends

xXOR0 in_0_buf in_0_inv  in_1_buf in_1_inv wire0 wire0_bar  CPL_XOR   ***4T
xXOR1 wire0    wire0_bar in_2_buf in_2_inv S_out_ S_out_bar  CPL_XOR  ***4T
xAND0 in_0_buf in_0_inv  in_1_buf in_1_inv wire1 wire1_bar  CPL_AND   ***4T
xAND1 wire0    wire0_bar in_2_buf in_2_inv wire2 wire2_bar  CPL_AND   ***4T
xOR   wire1    wire1_bar wire2    wire2_bar C_out_ C_out_bar CPL_OR   ***4T
Mp0    C_out_     C_out_bar VDD x pmos_rvt m=1
Mp1    C_out_bar  C_out_    VDD x pmos_rvt m=1

Mp2    S_out_bar S_out_     VDD x pmos_rvt m=1
Mp3    S_out_    S_out_bar  VDD x pmos_rvt m=1
xout0 S_out_bar S_out inverter   ***2T
xout1 C_out_bar C_out inverter   ***2T

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

