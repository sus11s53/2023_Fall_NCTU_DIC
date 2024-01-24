.TITLE Ex2_2_CMOS
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


.subckt CMOS_NAND A B out 
    Mp_0  out      A      VDD    x  pmos_rvt m=1
    Mp_1  out      B      VDD    x  pmos_rvt m=1

    Mn_0  out      A      wire0  x  nmos_rvt m=1
    Mn_1  wire0    B      GND    x  nmos_rvt m=1
.ends

.subckt CMOS_XOR A A_bar B B_bar out 
    Mp_0  wire0    A_bar  VDD    x  pmos_rvt  m=1
    Mp_1  out      B      wire0  x  pmos_rvt  m=1
    Mp_2  wire1    A      VDD    x  pmos_rvt  m=1
    Mp_3  out      B_bar  wire1  x  pmos_rvt  m=1

    Mn_0  wire2    B_bar  GND    x  nmos_rvt  m=1
    Mn_1  out      A_bar  wire2  x  nmos_rvt  m=1
    Mn_2  wire3    B      GND    x  nmos_rvt  m=1
    Mn_3  out      A      wire3  x  nmos_rvt  m=1
.ends

xXOR0 in_0_buf in_0_inv  in_1_buf in_1_inv wire0    CMOS_XOR  *** 8T
xINV  wire0    wire0_bar inverter                             *** 2T
xXOR1 wire0    wire0_bar in_2_buf in_2_inv S_out    CMOS_XOR  *** 8T

xNAND0 in_0_buf in_1_buf  wire1    CMOS_NAND   *** 4T
xNAND1 wire0    in_2_buf  wire2    CMOS_NAND   *** 4T
xNAND2 wire1    wire2     C_out    CMOS_NAND    *** 4T


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

