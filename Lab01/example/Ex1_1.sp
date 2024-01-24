.TITLE Ex1_1_Finfet
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
VDD VDD GND 0.7

Vg  Vg 0 0

*** 16nm mos
Mp_cmos   VDD    Vg   GND    VDD   pmos   w = 16nm l = 16nm
Mn_cmos   VDD    Vg   GND    GND   nmos   w = 16nm l = 16nm

*** 7nm Finfet
Mp_fin    VDD    Vg   GND    VDD   pmos_lvt   m = 1
Mn_fin    VDD    Vg   GND    GND   nmos_lvt   m = 1

*****************************
**      Measurement        **
*****************************
.DC Vg -1 1 0.01
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

