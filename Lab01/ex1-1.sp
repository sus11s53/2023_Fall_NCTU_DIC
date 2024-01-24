******************************
.TITLE FINFET

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
.param nfin=1

******************************input/ volgate sources.
vs vdd gnd supply
vin in gnd dc 0.1

******************************circuit
MM0 GND in VDD VDD PMOS_RVT n='nfin'
MM1 VDD in GND GND NMOS_RVT n='nfin'

******************************hspice simulation modes
.dc sweep vin 0 0.7 0.01
.probe I(MM0)
.probe I(MM1)

******************************measurements

.end