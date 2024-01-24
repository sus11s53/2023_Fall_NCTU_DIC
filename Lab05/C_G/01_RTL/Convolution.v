
// synopsys translate_off
`include "asap7sc7p5t_SEQ_RVT_TT_08302018.v"
// synopsys translate_on

module Convolution(
	//input
clk,
rst_n,	
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
In_Weight_1,
In_Weight_2,	
In_Weight_3,	
In_Weight_4,
In_Weight_5,
In_Weight_6,	
In_Weight_7,	
In_Weight_8,
In_Weight_9,
out_valid, 
Out_OFM

);

input clk, rst_n, in_valid, weight_valid;
input [7:0]In_IFM_1, In_IFM_2, In_IFM_3, In_IFM_4, In_IFM_5;
input [7:0]In_IFM_6, In_IFM_7, In_IFM_8, In_IFM_9;		
input [7:0]In_Weight_1, In_Weight_2, In_Weight_3, In_Weight_4, In_Weight_5;
input [7:0]In_Weight_6, In_Weight_7, In_Weight_8, In_Weight_9;

//////////////The output port shoud be registers///////////////////////
output reg out_valid;
output reg[20:0] Out_OFM;
//////////////////////////////////////////////////////////////////////


/////// 2 Buffer/////////////
reg [7:0]IFM_Buffer[1:9] ;   //  Use this buffer to store IFM
reg [7:0]Weight_Buffer[1:9];  //  Use this buffer to store Weight


wire  [20:0]out;
wire  [16:0]out_sum[1:3];

reg  in_valid2;
integer j,k;

wire  gclk_Input , gclk_Weight;
wire  Enable_Input , Enable_Weight;
wire  a,b,c;
reg Enable_Input_1;


ICGx3_ASAP7_75t_R x1(.GCLK(gclk_Input), .ENA(1'b0), .SE(Enable_Input), .CLK(clk));
ICGx3_ASAP7_75t_R x2(.GCLK(gclk_Weight), .ENA(1'b0), .SE(Enable_Weight), .CLK(clk));

assign a = !((In_IFM_1 == 0) && (In_IFM_2 == 0) && (In_IFM_3 == 0));
assign b = !((In_IFM_4 == 0) && (In_IFM_5 == 0) && (In_IFM_6 == 0));
assign c = !((In_IFM_7 == 0) && (In_IFM_8 == 0) && (In_IFM_9 == 0));
assign Enable_Input = a || b || c ;
assign Enable_Weight = weight_valid;

always@(posedge gclk_Weight or negedge rst_n)begin
	if(!rst_n)begin
		for(j=1; j<10 ; j=j+1)begin
			Weight_Buffer[j] <= 0;
		end
	end	
	else if(Enable_Weight)begin
		Weight_Buffer[1] <= In_Weight_1;
		Weight_Buffer[2] <= In_Weight_2;
		Weight_Buffer[3] <= In_Weight_3;
		Weight_Buffer[4] <= In_Weight_4;
		Weight_Buffer[5] <= In_Weight_5;
		Weight_Buffer[6] <= In_Weight_6;
		Weight_Buffer[7] <= In_Weight_7;
		Weight_Buffer[8] <= In_Weight_8;
		Weight_Buffer[9] <= In_Weight_9;
	end
end

always@(posedge gclk_Input or negedge rst_n)begin
	if(!rst_n)begin
		for(j=1; j<10 ; j=j+1)begin
			IFM_Buffer[j] <= 0;
		end
	end
	else if(Enable_Input)begin
		IFM_Buffer[1] <= In_IFM_1;
		IFM_Buffer[2] <= In_IFM_2;
		IFM_Buffer[3] <= In_IFM_3;
		IFM_Buffer[4] <= In_IFM_4;
		IFM_Buffer[5] <= In_IFM_5;
		IFM_Buffer[6] <= In_IFM_6;
		IFM_Buffer[7] <= In_IFM_7;
		IFM_Buffer[8] <= In_IFM_8;
		IFM_Buffer[9] <= In_IFM_9;
	end
	else begin
		IFM_Buffer[1] <= 0;
		IFM_Buffer[2] <= 0;
		IFM_Buffer[3] <= 0;
		IFM_Buffer[4] <= 0;
		IFM_Buffer[5] <= 0;
		IFM_Buffer[6] <= 0;
		IFM_Buffer[7] <= 0;
		IFM_Buffer[8] <= 0;
		IFM_Buffer[9] <= 0;
	end
end

always@(posedge clk or negedge rst_n)begin
	if(!rst_n)  in_valid2 <= 0;
	else 		in_valid2 <= in_valid;
end

always@(posedge clk or negedge rst_n)begin
	if(!rst_n)  Enable_Input_1 <= 0;
	else 		Enable_Input_1 <= Enable_Input;
end

assign out = (Enable_Input_1)  ? (Weight_Buffer[1]*IFM_Buffer[1]
								+ Weight_Buffer[2]*IFM_Buffer[2]
								+ Weight_Buffer[3]*IFM_Buffer[3]
								+ Weight_Buffer[4]*IFM_Buffer[4]
								+ Weight_Buffer[5]*IFM_Buffer[5]
								+ Weight_Buffer[6]*IFM_Buffer[6]
								+ Weight_Buffer[7]*IFM_Buffer[7]
								+ Weight_Buffer[8]*IFM_Buffer[8]
								+ Weight_Buffer[9]*IFM_Buffer[9]) : 0;


always@(posedge clk or negedge rst_n)begin
	if(!rst_n) Out_OFM <= 0;
	else if(in_valid2 == 1'b1) Out_OFM <= out;
end


always@(posedge clk or negedge rst_n)begin
	if(!rst_n) 	out_valid <= 0;
	else 		out_valid <= in_valid2;
end


endmodule