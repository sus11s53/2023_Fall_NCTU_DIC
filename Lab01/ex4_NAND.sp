******************************
.TITLE NAND2

******************************hspice simulation options
.option post nomod brief measdgt=7 captab
.op

******************************process and temperature options
.include '7nm_TT.pm'
.include 'asap7sc7p5t_SIMPLE_RVT.sp'
.include 'asap7sc7p5t_INVBUF_RVT.sp'
.temp 25
.global VDD GND

******************************parameters
.param supply=0.7v
.param slew=30p

******************************input/ volgate sources.
vs vdd gnd supply
vA A gnd pulse( 0 0.7 1ps 1ps 1ps 2ns 4ns )
vB B gnd pulse( 0 0.7 1ps 1ps 1ps 4ns 8ns )

******************************circuit
*.SUBCKT NAND2x1_ASAP7_75t_R VSS VDD A B Y
xnand GND VDD A B Y1 NAND2x1_ASAP7_75t_R

******************************Loading
xinv2 gnd vdd y1 out1 INVx1_ASAP7_75t_R
xinv3 gnd vdd y1 out2 INVx1_ASAP7_75t_R
xinv4 gnd vdd y1 out3 INVx1_ASAP7_75t_R
xinv5 gnd vdd y1 out4 INVx1_ASAP7_75t_R
c1 y1 gnd 10f

******************************hspice simulation modes
*.dc vin 0 0.7 0.01
.tran 1ps 32ns 

******************************measurements
.meas tran Tr Trig v(y1) val='0.7*0.2' rise=1 Targ v(y1) val='0.7*0.8' rise=1
.meas tran Tf Trig v(y1) val='0.7*0.8' fall=1 Targ v(y1) val='0.7*0.2' fall=1 
.meas tran TpHL Trig v(A) val=0.35v rise=2 Targ v(y1) val=0.35v fall=2
.meas tran TpLH Trig v(A) val=0.35v fall=2 Targ v(y1) val=0.35v rise=2
.meas pwr avg power 

.end