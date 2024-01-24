******************************
.TITLE FININVTER

******************************hspice simulation options
.option post nomod brief measdgt=7 captab
.op

******************************process and temperature options
.include '7nm_TT.pm'
.temp 25
.global VDD GND

******************************parameters
.param supply=0.7v
.param slew=30p

******************************input/ volgate sources.
vs vdd gnd supply
vin in gnd

******************************circuit
MM0 OUT1 IN VDD VDD PMOS_RVT nfin=1
MM1 OUT1 IN GND GND NMOS_RVT nfin=1



******************************hspice simulation modes
.dc  vin 0 0.7 0.01

******************************measurements

.end