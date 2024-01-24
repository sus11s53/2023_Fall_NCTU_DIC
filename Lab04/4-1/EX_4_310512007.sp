.TITLE 4

.include 'asap7sc7p5t_AO_RVT.sp'
.include 'asap7sc7p5t_INVBUF_RVT.sp'
.include 'asap7sc7p5t_OA_RVT.sp'
.include 'asap7sc7p5t_SEQ_RVT.sp'
.include 'asap7sc7p5t_SIMPLE_RVT.sp'
.include '7nm_TT.pm'

.protect
.unprotect

.global VDD GND
VVDD VDD GND 0.7v
**** Input Vector ****
.VEC 'Pattern_310512007.vec'

**** include the 2x2 convolution ****
.include 'Design_310512007.sp'

x1 GND VDD In_IFM_13 In_IFM_12 In_IFM_11 In_IFM_10 In_IFM_23 In_IFM_22 In_IFM_21 In_IFM_20 In_IFM_33 In_IFM_32 In_IFM_31 In_IFM_30 In_IFM_43 In_IFM_42 In_IFM_41 In_IFM_40 In_Weight_13 In_Weight_12 In_Weight_11 In_Weight_10 In_Weight_23 In_Weight_22 In_Weight_21 In_Weight_20 In_Weight_33 In_Weight_32 In_Weight_31 In_Weight_30 In_Weight_43 In_Weight_42 In_Weight_41 In_Weight_40  Out_OFM9 Out_OFM8 Out_OFM7 Out_OFM6 Out_OFM5 Out_OFM4 Out_OFM3 Out_OFM2 Out_OFM1 Out_OFM0 Convolution

C1  Out_OFM0  GND 15ff
C2  Out_OFM1  GND 15ff
C3  Out_OFM2  GND 15ff
C4  Out_OFM3  GND 15ff
C5  Out_OFM4  GND 15ff
C6  Out_OFM5  GND 15ff
C7  Out_OFM6  GND 15ff
C8  Out_OFM7  GND 15ff
C9  Out_OFM8  GND 15ff
C10  Out_OFM9  GND 15ff

.option post 
.options probe			*with I/V in .lis
.probe v(In_IFM_10) 
.probe v(In_IFM_11) 
.probe v(In_IFM_12) 
.probe v(In_IFM_13)
.probe v(In_IFM_20) 
.probe v(In_IFM_21) 
.probe v(In_IFM_22) 
.probe v(In_IFM_23)
.probe v(In_IFM_30) 
.probe v(In_IFM_31) 
.probe v(In_IFM_32) 
.probe v(In_IFM_33)
.probe v(In_IFM_40) 
.probe v(In_IFM_41) 
.probe v(In_IFM_42) 
.probe v(In_IFM_43) 
.probe v(Out_OFM0) 
.probe v(Out_OFM1) 
.probe v(Out_OFM2) 
.probe v(Out_OFM3) 
.probe v(Out_OFM4) 
.probe v(Out_OFM5) 
.probe v(Out_OFM6) 
.probe v(Out_OFM7) 
.probe v(Out_OFM8) 
.probe v(Out_OFM9) 
.probe v(In_Weight_10) 
.probe v(In_Weight_11) 
.probe v(In_Weight_12) 
.probe v(In_Weight_13)
.probe v(In_Weight_20) 
.probe v(In_Weight_21) 
.probe v(In_Weight_22) 
.probe v(In_Weight_23)
.probe v(In_Weight_30) 
.probe v(In_Weight_31) 
.probe v(In_Weight_32) 
.probe v(In_Weight_33)
.probe v(In_Weight_40) 
.probe v(In_Weight_41) 
.probe v(In_Weight_42) 
.probe v(In_Weight_43)

.option captab			*with cap value in .lis
.TEMP 25
.meas tran pwr avg power
.tran 10ps 25n
.end
