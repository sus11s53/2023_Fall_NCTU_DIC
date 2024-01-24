module Convolution	(
	rst_n,
	clk,
	in_valid,
	weight_valid,
	In_IFM_1,
	In_IFM_2,
	In_IFM_3,
	In_IFM_4,
	In_IFM_5,
	In_IFM_6,
	In_IFM_7,
	In_IFM_8,	
	In_IFM_9,
	In_IFM_10,
	In_IFM_11,
	In_IFM_12,
	In_IFM_13,
	In_IFM_14,
	In_IFM_15,
	In_IFM_16,
	In_IFM_17,
	In_IFM_18,	
	In_IFM_19,
	In_IFM_20,
	In_IFM_21,
	In_IFM_22,
	In_IFM_23,
	In_IFM_24,
	In_IFM_25,
	In_IFM_26,
	In_IFM_27,
	In_IFM_28,	
	In_IFM_29,
	In_IFM_30,
	In_IFM_31,
	In_IFM_32,
	In_Weight_1,
	In_Weight_2,
	In_Weight_3,
	In_Weight_4,
	In_Weight_5,
	In_Weight_6,
	In_Weight_7,
	In_Weight_8,
	In_Weight_9,
	In_Weight_10,
	In_Weight_11,
	In_Weight_12,
	In_Weight_13,
	In_Weight_14,
	In_Weight_15,
	In_Weight_16,
	In_Weight_17,
	In_Weight_18,	
	In_Weight_19,
	In_Weight_20,
	In_Weight_21,
	In_Weight_22,
	In_Weight_23,
	In_Weight_24,
	In_Weight_25,
	In_Weight_26,
	In_Weight_27,
	In_Weight_28,	
	In_Weight_29,
	In_Weight_30,
	In_Weight_31,
	In_Weight_32,
	out_valid,
	Out_OFM
);

input clk;
input rst_n;
input in_valid;
input weight_valid;
input [3:0] In_IFM_1 ;
input [3:0] In_IFM_2 ;
input [3:0] In_IFM_3 ;
input [3:0] In_IFM_4 ;
input [3:0] In_IFM_5 ;
input [3:0] In_IFM_6 ;
input [3:0] In_IFM_7 ;
input [3:0] In_IFM_8 ;	
input [3:0] In_IFM_9 ;
input [3:0]In_IFM_10 ;
input [3:0]In_IFM_11 ;
input [3:0]In_IFM_12 ;
input [3:0]In_IFM_13 ;
input [3:0]In_IFM_14 ;
input [3:0]In_IFM_15 ;
input [3:0]In_IFM_16 ;
input [3:0]In_IFM_17 ;
input [3:0]In_IFM_18 ;
input [3:0]In_IFM_19 ;
input [3:0]In_IFM_20 ;
input [3:0]In_IFM_21 ;
input [3:0]In_IFM_22 ;
input [3:0]In_IFM_23 ;
input [3:0]In_IFM_24 ;
input [3:0]In_IFM_25 ;
input [3:0]In_IFM_26 ;
input [3:0]In_IFM_27 ;
input [3:0]In_IFM_28 ;
input [3:0]In_IFM_29 ;
input [3:0]In_IFM_30 ;
input [3:0]In_IFM_31 ;
input [3:0]In_IFM_32 ;
input [3:0]In_Weight_1;
input [3:0]In_Weight_2;
input [3:0]In_Weight_3;	
input [3:0]In_Weight_4;
input [3:0]In_Weight_5;
input [3:0]In_Weight_6;
input [3:0]In_Weight_7;	
input [3:0]In_Weight_8;
input [3:0]In_Weight_9;
input [3:0]In_Weight_10;
input [3:0]In_Weight_11;
input [3:0]In_Weight_12;
input [3:0]In_Weight_13;	
input [3:0]In_Weight_14;
input [3:0]In_Weight_15;
input [3:0]In_Weight_16;
input [3:0]In_Weight_17;	
input [3:0]In_Weight_18;
input [3:0]In_Weight_19;
input [3:0]In_Weight_20;
input [3:0]In_Weight_21;
input [3:0]In_Weight_22;
input [3:0]In_Weight_23;	
input [3:0]In_Weight_24;
input [3:0]In_Weight_25;
input [3:0]In_Weight_26;
input [3:0]In_Weight_27;	
input [3:0]In_Weight_28;
input [3:0]In_Weight_29;
input [3:0]In_Weight_30;
input [3:0]In_Weight_31;
input [3:0]In_Weight_32;

output reg out_valid;
output [12:0] Out_OFM;

wire    [12:0]out;
/*====================================*/
/*            Design                 */
/*===================================*/
reg    [3:0]D_In_IFM_1 ;
reg    [3:0]D_In_IFM_2 ;
reg    [3:0]D_In_IFM_3 ;
reg    [3:0]D_In_IFM_4 ;
reg    [3:0]D_In_IFM_5 ;
reg    [3:0]D_In_IFM_6 ;
reg    [3:0]D_In_IFM_7 ;
reg    [3:0]D_In_IFM_8 ;	
reg    [3:0]D_In_IFM_9 ;
reg    [3:0]D_In_IFM_10 ;
reg    [3:0]D_In_IFM_11 ;
reg    [3:0]D_In_IFM_12 ;
reg    [3:0]D_In_IFM_13 ;
reg    [3:0]D_In_IFM_14 ;
reg    [3:0]D_In_IFM_15 ;
reg    [3:0]D_In_IFM_16 ;
reg    [3:0]D_In_IFM_17 ;
reg    [3:0]D_In_IFM_18 ;
reg    [3:0]D_In_IFM_19 ;
reg    [3:0]D_In_IFM_20 ;
reg    [3:0]D_In_IFM_21 ;
reg    [3:0]D_In_IFM_22 ;
reg    [3:0]D_In_IFM_23 ;
reg    [3:0]D_In_IFM_24 ;
reg    [3:0]D_In_IFM_25 ;
reg    [3:0]D_In_IFM_26 ;
reg    [3:0]D_In_IFM_27 ;
reg    [3:0]D_In_IFM_28 ;
reg    [3:0]D_In_IFM_29 ;
reg    [3:0]D_In_IFM_30 ;
reg    [3:0]D_In_IFM_31 ;
reg    [3:0]D_In_IFM_32 ;

reg    [3:0]D_In_Weight_1;
reg    [3:0]D_In_Weight_2;
reg    [3:0]D_In_Weight_3;	
reg    [3:0]D_In_Weight_4;
reg    [3:0]D_In_Weight_5;
reg    [3:0]D_In_Weight_6;
reg    [3:0]D_In_Weight_7;	
reg    [3:0]D_In_Weight_8;
reg    [3:0]D_In_Weight_9;
reg    [3:0]D_In_Weight_10;
reg    [3:0]D_In_Weight_11;
reg    [3:0]D_In_Weight_12;
reg    [3:0]D_In_Weight_13;	
reg    [3:0]D_In_Weight_14;
reg    [3:0]D_In_Weight_15;
reg    [3:0]D_In_Weight_16;
reg    [3:0]D_In_Weight_17;	
reg    [3:0]D_In_Weight_18;
reg    [3:0]D_In_Weight_19;
reg    [3:0]D_In_Weight_20;
reg    [3:0]D_In_Weight_21;
reg    [3:0]D_In_Weight_22;
reg    [3:0]D_In_Weight_23;	
reg    [3:0]D_In_Weight_24;
reg    [3:0]D_In_Weight_25;
reg    [3:0]D_In_Weight_26;
reg    [3:0]D_In_Weight_27;	
reg    [3:0]D_In_Weight_28;
reg    [3:0]D_In_Weight_29;
reg    [3:0]D_In_Weight_30;
reg    [3:0]D_In_Weight_31;
reg    [3:0]D_In_Weight_32;






always@(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        D_In_IFM_1  <= 0;
        D_In_IFM_2  <= 0;
        D_In_IFM_3  <= 0;
        D_In_IFM_4  <= 0;
        D_In_IFM_5  <= 0;
        D_In_IFM_6  <= 0;
        D_In_IFM_7  <= 0;
        D_In_IFM_8  <= 0;
        D_In_IFM_9  <= 0;
        D_In_IFM_10 <= 0;
        D_In_IFM_11 <= 0;
        D_In_IFM_12 <= 0;
        D_In_IFM_13 <= 0;
        D_In_IFM_14 <= 0;
        D_In_IFM_15 <= 0;
        D_In_IFM_16 <= 0;
        D_In_IFM_17 <= 0;
        D_In_IFM_18 <= 0;
        D_In_IFM_19 <= 0;
        D_In_IFM_20 <= 0;
        D_In_IFM_21 <= 0;
        D_In_IFM_22 <= 0;
        D_In_IFM_23 <= 0;
        D_In_IFM_24 <= 0;
        D_In_IFM_25 <= 0;
        D_In_IFM_26 <= 0;
        D_In_IFM_27 <= 0;
        D_In_IFM_28 <= 0;
        D_In_IFM_29 <= 0;
        D_In_IFM_30 <= 0;
        D_In_IFM_31 <= 0;
        D_In_IFM_32 <= 0;
    end
    else if(in_valid)begin
        D_In_IFM_1  <= In_IFM_1 ;
        D_In_IFM_2  <= In_IFM_2 ;
        D_In_IFM_3  <= In_IFM_3 ;
        D_In_IFM_4  <= In_IFM_4 ;
        D_In_IFM_5  <= In_IFM_5 ;
        D_In_IFM_6  <= In_IFM_6 ;
        D_In_IFM_7  <= In_IFM_7 ;
        D_In_IFM_8  <= In_IFM_8 ;
        D_In_IFM_9  <= In_IFM_9 ;
        D_In_IFM_10 <= In_IFM_10;
        D_In_IFM_11 <= In_IFM_11;
        D_In_IFM_12 <= In_IFM_12;
        D_In_IFM_13 <= In_IFM_13;
        D_In_IFM_14 <= In_IFM_14;
        D_In_IFM_15 <= In_IFM_15;
        D_In_IFM_16 <= In_IFM_16;
        D_In_IFM_17 <= In_IFM_17;
        D_In_IFM_18 <= In_IFM_18;
        D_In_IFM_19 <= In_IFM_19;
        D_In_IFM_20 <= In_IFM_20;
        D_In_IFM_21 <= In_IFM_21;
        D_In_IFM_22 <= In_IFM_22;
        D_In_IFM_23 <= In_IFM_23;
        D_In_IFM_24 <= In_IFM_24;
        D_In_IFM_25 <= In_IFM_25;
        D_In_IFM_26 <= In_IFM_26;
        D_In_IFM_27 <= In_IFM_27;
        D_In_IFM_28 <= In_IFM_28;
        D_In_IFM_29 <= In_IFM_29;
        D_In_IFM_30 <= In_IFM_30;
        D_In_IFM_31 <= In_IFM_31;
        D_In_IFM_32 <= In_IFM_32;
    end
end

always@(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        D_In_Weight_1  <= 0 ; 
        D_In_Weight_2  <= 0 ; 
        D_In_Weight_3  <= 0 ; 
        D_In_Weight_4  <= 0 ; 
        D_In_Weight_5  <= 0 ; 
        D_In_Weight_6  <= 0 ; 
        D_In_Weight_7  <= 0 ; 
        D_In_Weight_8  <= 0 ; 
        D_In_Weight_9  <= 0 ; 
        D_In_Weight_10 <= 0 ;
        D_In_Weight_11 <= 0 ;
        D_In_Weight_12 <= 0 ;
        D_In_Weight_13 <= 0 ;
        D_In_Weight_14 <= 0 ;
        D_In_Weight_15 <= 0 ;
        D_In_Weight_16 <= 0 ;
        D_In_Weight_17 <= 0 ;
        D_In_Weight_18 <= 0 ;
        D_In_Weight_19 <= 0 ;
        D_In_Weight_20 <= 0 ;
        D_In_Weight_21 <= 0 ;
        D_In_Weight_22 <= 0 ;
        D_In_Weight_23 <= 0 ;
        D_In_Weight_24 <= 0 ;
        D_In_Weight_25 <= 0 ;
        D_In_Weight_26 <= 0 ;
        D_In_Weight_27 <= 0 ;
        D_In_Weight_28 <= 0 ;
        D_In_Weight_29 <= 0 ;
        D_In_Weight_30 <= 0 ;
        D_In_Weight_31 <= 0 ;
        D_In_Weight_32 <= 0 ;
    end
    else if(weight_valid)begin
        D_In_Weight_1  <= In_Weight_1  ;
        D_In_Weight_2  <= In_Weight_2  ;
        D_In_Weight_3  <= In_Weight_3  ;
        D_In_Weight_4  <= In_Weight_4  ;
        D_In_Weight_5  <= In_Weight_5  ;
        D_In_Weight_6  <= In_Weight_6  ;
        D_In_Weight_7  <= In_Weight_7  ;
        D_In_Weight_8  <= In_Weight_8  ;
        D_In_Weight_9  <= In_Weight_9  ;
        D_In_Weight_10 <= In_Weight_10 ;
        D_In_Weight_11 <= In_Weight_11 ;
        D_In_Weight_12 <= In_Weight_12 ;
        D_In_Weight_13 <= In_Weight_13 ;
        D_In_Weight_14 <= In_Weight_14 ;
        D_In_Weight_15 <= In_Weight_15 ;
        D_In_Weight_16 <= In_Weight_16 ;
        D_In_Weight_17 <= In_Weight_17 ;
        D_In_Weight_18 <= In_Weight_18 ;
        D_In_Weight_19 <= In_Weight_19 ;
        D_In_Weight_20 <= In_Weight_20 ;
        D_In_Weight_21 <= In_Weight_21 ;
        D_In_Weight_22 <= In_Weight_22 ;
        D_In_Weight_23 <= In_Weight_23 ;
        D_In_Weight_24 <= In_Weight_24 ;
        D_In_Weight_25 <= In_Weight_25 ;
        D_In_Weight_26 <= In_Weight_26 ;
        D_In_Weight_27 <= In_Weight_27 ;
        D_In_Weight_28 <= In_Weight_28 ;
        D_In_Weight_29 <= In_Weight_29 ;
        D_In_Weight_30 <= In_Weight_30 ;
        D_In_Weight_31 <= In_Weight_31 ;
        D_In_Weight_32 <= In_Weight_32 ;
    end
end

always@(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        out_valid <= 0;
    end
    else begin
        out_valid <= in_valid;
    end
end

assign out= 
    (D_In_IFM_1   * D_In_Weight_1 )+
    (D_In_IFM_2   * D_In_Weight_2 )+
    (D_In_IFM_3   * D_In_Weight_3 )+
    (D_In_IFM_4   * D_In_Weight_4 )+
    (D_In_IFM_5   * D_In_Weight_5 )+
    (D_In_IFM_6   * D_In_Weight_6 )+
    (D_In_IFM_7   * D_In_Weight_7 )+
    (D_In_IFM_8   * D_In_Weight_8 )+
    (D_In_IFM_9   * D_In_Weight_9 )+
    (D_In_IFM_10  * D_In_Weight_10) +
    (D_In_IFM_11  * D_In_Weight_11) +
    (D_In_IFM_12  * D_In_Weight_12) +
    (D_In_IFM_13  * D_In_Weight_13) +
    (D_In_IFM_14  * D_In_Weight_14) +
    (D_In_IFM_15  * D_In_Weight_15) +
    (D_In_IFM_16  * D_In_Weight_16) +
    (D_In_IFM_17  * D_In_Weight_17) +
    (D_In_IFM_18  * D_In_Weight_18) +
    (D_In_IFM_19  * D_In_Weight_19) +
    (D_In_IFM_20  * D_In_Weight_20) +
    (D_In_IFM_21  * D_In_Weight_21) +
    (D_In_IFM_22  * D_In_Weight_22) +
    (D_In_IFM_23  * D_In_Weight_23) +
    (D_In_IFM_24  * D_In_Weight_24) +
    (D_In_IFM_25  * D_In_Weight_25) +
    (D_In_IFM_26  * D_In_Weight_26) +
    (D_In_IFM_27  * D_In_Weight_27) +
    (D_In_IFM_28  * D_In_Weight_28) +
    (D_In_IFM_29  * D_In_Weight_29) +
    (D_In_IFM_30  * D_In_Weight_30) +
    (D_In_IFM_31  * D_In_Weight_31) +
    (D_In_IFM_32  * D_In_Weight_32) ;

assign Out_OFM = (out_valid == 1)? out : 0;



endmodule