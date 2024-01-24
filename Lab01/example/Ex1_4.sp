.TITLE Ex1_4
*****************************
**     Library setting     **
*****************************
.protect
.include '7nm_TT.pm'
.include '16mos.pm'
.include 'asap7sc7p5t_INVBUF_RVT.sp'
.include 'asap7sc7p5t_SIMPLE_RVT.sp'
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

**** NOR circuit
X_buffer1  NOR_in1 NOR_in1_ buffer
X_buffer2  NOR_in2 NOR_in2_ buffer
X_NOR2x1  GND VDD NOR_in1_ NOR_in2_ NOR_out NOR2xp33_ASAP7_75t_R

Cwire1     NOR_out GND 10f
X_NOR_fan_1   GND VDD NOR_out out1  INVxp33_ASAP7_75t_R
X_NOR_fan_2   GND VDD NOR_out out2  INVxp33_ASAP7_75t_R
X_NOR_fan_3   GND VDD NOR_out out3  INVxp33_ASAP7_75t_R
X_NOR_fan_4   GND VDD NOR_out out4  INVxp33_ASAP7_75t_R


**** NAND circuit
X_buffer3  NAND_in1 NAND_in1_ buffer
X_buffer4  NAND_in2 NAND_in2_ buffer
X_NAND2x1  GND VDD NAND_in1_ NAND_in2_ NAND_out NAND2xp33_ASAP7_75t_R

Cwire2     NAND_out GND 10f
X_NAND_fan_1   GND VDD NAND_out out5  INVxp33_ASAP7_75t_R
X_NAND_fan_2   GND VDD NAND_out out6  INVxp33_ASAP7_75t_R
X_NAND_fan_3   GND VDD NAND_out out7  INVxp33_ASAP7_75t_R
X_NAND_fan_4   GND VDD NAND_out out8  INVxp33_ASAP7_75t_R


*****************************
**      Measurement        **
*****************************
VNOR_in1 NOR_in1 GND pwl(4.9n 0v ,5n 0.7v, 9.9n 0.7v , 10n 0v  , 15n 0v R 0)
VNOR_in2 NOR_in2 GND 0v

VNAND_in1 NAND_in1 GND pwl(4.9n 0v ,5n 0.7v, 9.9n 0.7v , 10n 0v , 15n 0v  R 0)
VNAND_in2 NAND_in2 GND 0.7v

.tran 1p 15n
.meas tran NOR_Tr   TRIG V(NOR_out) VAL=0.07 RISE=1 TARG V(NOR_out) VAL=0.63 RISE=1
.meas tran NOR_Tf   TRIG V(NOR_out) VAL=0.63 FALL=1 TARG V(NOR_out) VAL=0.07 FALL=1
.meas tran NOR_Tplh TRIG V(NOR_in1)  VAL=0.35 FALL=1 TARG V(NOR_out) VAL=0.35 RISE=1
.meas tran NOR_Tphl TRIG V(NOR_in1)  VAL=0.35 RISE=1 TARG V(NOR_out) VAL=0.35 FALL=1

.meas tran NAND_Tr   TRIG V(NAND_out) VAL=0.07 RISE=1 TARG V(NAND_out) VAL=0.63 RISE=1
.meas tran NAND_Tf   TRIG V(NAND_out) VAL=0.63 FALL=1 TARG V(NAND_out) VAL=0.07 FALL=1
.meas tran NAND_Tplh TRIG V(NAND_in1)  VAL=0.35 FALL=1 TARG V(NAND_out) VAL=0.35 RISE=1
.meas tran NAND_Tphl TRIG V(NAND_in1)  VAL=0.35 RISE=1 TARG V(NAND_out) VAL=0.35 FALL=1
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

