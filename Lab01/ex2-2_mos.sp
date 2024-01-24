******************************
.TITLE CMOSINVTER

******************************hspice simulation options
.option post nomod brief measdgt=7 captab
.op

******************************process and temperature options
.include '16mos.pm'
.temp 25
.global VDD GND

******************************parameters
.param supply=0.7v
.param wp=16n
.param wn=16n
.param slew=30p

******************************input/ volgate sources.
vs vdd gnd supply
vin in gnd

******************************circuit
MM0 OUT1 IN VDD VDD PMOS W=wp L=16n M=1.0
MM1 OUT1 IN GND GND NMOS W=wn L=16n M=1.0

******************************hspice simulation modes
.dc  vin 0 0.7 0.01

******************************measurements

.end