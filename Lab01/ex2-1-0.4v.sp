******************************
.TITLE INVERTER 0.4v

******************************hspice simulation options
.option post nomod brief measdgt=7 captab
.op

******************************process and temperature options
.include '7nm_TT.pm'
.include 'asap7sc7p5t_INVBUF_RVT.sp'
.temp 25
.global VDD GND

******************************parameters
.param supply=0.4v
.param slew=30p

******************************input/ volgate sources.
vs vdd gnd supply
vin in gnd pulse( 0 0.4 100ps 100ps 100ps 2ns 4ns )

******************************circuit
*.SUBCKT INVx1_ASAP7_75t_R VSS VDD A Y
xinv1 GND VDD in Y1 INVx1_ASAP7_75t_R

*.SUBCKT INVx13_ASAP7_75t_R VSS VDD A Y
xinv2 GND VDD in Y2 INVx13_ASAP7_75t_R

******************************hspice simulation modes
.dc vin 0 0.4 0.01
.tran 1ps 8ns 

******************************measurements

.end