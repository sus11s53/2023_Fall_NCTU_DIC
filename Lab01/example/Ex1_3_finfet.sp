.TITLE Ex1_3_a
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
.global VDD GND

VDD VDD GND 0.7
*VSS VSS 0 0

*****************************
**         Curcuit         **
*****************************
.subckt inverter in out
	Mp  out  in  VDD  x  pmos_rvt  m=1
	Mn  out  in  GND  x  nmos_rvt  m=1
.ends
.subckt buffer in out
	X_INV1 in   in_b inverter
	X_INV2 in_b out  inverter
.ends

.subckt inverter_finfet in out
    Mp_fin out in VDD VDD pmos_lvt m = 11
    Mn_fin out in GND GND nmos_lvt m = 7
.ends
* .subckt inverter_cmos in out
    * Mp_cmos out in VDD VDD pmos l = 16nm w = 30nm  m = 1
    * Mn_cmos out in VSS VSS nmos l = 16nm w = 16nm  m = 1
* .ends

X_buffer  in buffered_in buffer
X_inv_fin buffered_in out inverter_finfet
Cwire     out GND 10f
X_fan_1   out out1  inverter_finfet
X_fan_2   out out2  inverter_finfet
X_fan_3   out out3  inverter_finfet
X_fan_4   out out4  inverter_finfet



*****************************
**      Measurement        **
*****************************
vin in GND pwl(1.9n  0v  , 2n    0.7v, 2.9n 0.7v, 3n    0v  , 4.9n  0v  , 5n    0.7v, 5.9n 0.7v,
+              6n    0v  , 6.9n  0v  , 7n   0.7v, 8.9n  0.7v, 9n    0v  , 10.9n 0v  ,
+              11n   0.7v, 12.9n 0.7v, 13n  0v  , 13.9n 0v  , 14n   0.7v, 14.9n 0.7v,  15n 0v  ,
+              16n   0v  , 17.9n 0v  , 18n  0.7v, 19.9n 0.7v, 20n   0v  , 

+              20.9n 0v  , 21n   0.7v, 21.4n 0.7v, 21.5n 0v , 22.4n 0v  , 22.5n 0.7v, 22.9n 0.7v,
+              23n   0v  , 23.4n 0v  , 23.5n 0.7v, 24.4n 0.7v, 24.5n 0v, 25.4n 0v ,
+              25.5n 0.7v, 26.4n 0.7v, 26.5n 0v,  26.9n 0v , 27n 0.7v, 27.4n, 0.7v, 27.5n 0v ,
+              28n 0v , 28.9n 0v , 29n 0.7v, 29.9n 0.7v, 30n 0v  

+              30.4n 0v,   30.5n 0.7v, 30.65n 0.7v  30.75n 0v , 31.15n 0v , 31.25n 0.7v , 31.4n 0.7v,
+              31.5n 0v ,  31.65n 0v , 31.75n 0.7v, 32.15n 0.7v, 32.25n 0v, 32.65n 0v, 
+              32.75n 0.7v, 33.15n 0.7v, 33.25n 0v,33.4n 0v, 33.5n 0.7v, 33.65n 0.7v, 33.75n 0v,
+              34n 0v,  34.4n 0v , 34.5n 0.7v, 34.9n 0.7v, 35n 0v R 0)
.tran 1p 35n
.meas tran pwr1 avg POWER from=0ns to=20ns   **for 1GHz
.meas tran pwr2 avg POWER from=20ns to=30ns  **for 2GHz
.meas tran pwr4 avg POWER from=30ns to=35ns  **for 4GHz
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

