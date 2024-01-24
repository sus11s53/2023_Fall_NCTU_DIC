.TITLE 2-1

.include '7nm_TT.pm'
.include 'asap7_75t_R_24.cdl'  *original

.option post nomod brief measdgt=7 captab
.op

.global VDD GND
.param supply=0.7v
.param slew=30p
vs VDD GND supply
vA A0 GND pulse( 0 0.7 1ps 1ps 1ps 2ns 4ns )
vB B0 GND pulse( 0 0.7 1ps 1ps 1ps 2ns 4ns )
vC C0 GND pulse( 0 0.7 1ps 1ps 1ps 2ns 4ns )

**** include the Adder****
.include 'Adder_1bit_SYN_new.sp'
 

x1 C0 VDD GND C00 INVx8_ASAP7_75t_R
x2 C00 VDD GND C000 INVx8_ASAP7_75t_R

x3 A0 VDD GND A00 INVx8_ASAP7_75t_R
x4 A00 VDD GND A000 INVx8_ASAP7_75t_R

x5 B0 VDD GND B00 INVx8_ASAP7_75t_R
x6 B00 VDD GND B000 INVx8_ASAP7_75t_R

 
x17  GND VDD  C000 A000 B000 COUT SUM Adder_1bit_FULL_ADDER



C1  COUT  GND 5ff
C2  SUM  GND 5ff


*.dc vin 0 0.7 0.01
.tran 1ps 32ns 
.meas tran Tr Trig v(COUT) val='0.7*0.2' rise=1 Targ v(COUT) val='0.7*0.8' rise=1
.meas tran Tf Trig v(COUT) val='0.7*0.8' fall=1 Targ v(COUT) val='0.7*0.2' fall=1 
.meas tran TpHL Trig v(A0) val=0.35v rise=2 Targ v(COUT) val=0.35v fall=2
.meas tran TpLH Trig v(A0) val=0.35v fall=2 Targ v(COUT) val=0.35v rise=2
.meas pwr avg power 

.end
