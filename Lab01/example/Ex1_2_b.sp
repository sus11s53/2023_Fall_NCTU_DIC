.TITLE Ex1_2_b
*****************************
**     Library setting     **
*****************************
.protect
.include '7nm_TT.pm'
.include '16mos.pm'
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
*** INV of Cmos
Mp_fin out1 in VDD VDD pmos_lvt m = 11
Mn_fin out1 in VSS VSS nmos_lvt m = 7

Mp_cmos out2 in VDD VDD pmos l = 16nm w = 30nm  m = 1
Mn_cmos out2 in VSS VSS nmos l = 16nm w = 16nm  m = 1
*****************************
**      Measurement        **
*****************************
.DC Vin 0 0.7 0.001 
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

