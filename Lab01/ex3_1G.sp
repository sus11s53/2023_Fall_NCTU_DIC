******************************
.TITLE INVERTER

******************************hspice simulation options
.option post nomod brief measdgt=7 captab
.op

******************************process and temperature options
.include '7nm_TT.pm'
.include 'asap7sc7p5t_INVBUF_RVT.sp'
.temp 25
.global VDD GND

******************************parameters
.param supply=0.7v
.param slew=30p

******************************input/ volgate sources.
vs vdd gnd supply
vin in gnd pulse( 0 0.7 100ps 100ps 100ps 0.5ns 1ns )

******************************circuit
*.SUBCKT INVx1_ASAP7_75t_R VSS VDD A Y
xinv1 GND VDD in Y1 INVx1_ASAP7_75t_R

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
.meas pwr avg power 

.end