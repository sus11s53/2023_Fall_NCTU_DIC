******************************
.TITLE CMOS

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
vin in gnd dc 0.1

******************************circuit
MM0 GND in VDD VDD PMOS W=wp L=16n M=1.0
MM1 VDD in GND GND NMOS W=wn L=16n M=1.0

******************************hspice simulation modes
.dc sweep vin 0 0.7 0.01
.probe I(MM0)
.probe I(MM1)

******************************measurements

.end