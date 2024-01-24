


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
output [20:0] Out_OFM;
//////////////////////////////////////////////////////////////////////


/////// 2 Buffer/////////////
reg [7:0]IFM_Buffer[1:9] ;   //  Use this buffer to store IFM
reg [7:0]Weight_Buffer[1:9];  //  Use this buffer to store Weight


wire  [16:0]out[1:9];
reg   [16:0]out_reg[1:9];
wire  [20:0]out_sum;
reg   [20:0]OFM;

reg  in_valid2, in_valid3;
integer j;



always@(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		for(j=1; j<10 ; j=j+1)begin
			Weight_Buffer[j] <= 0;
		end
	end	
	else if(weight_valid)begin
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

always@(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		for(j=1; j<10 ; j=j+1)begin
			IFM_Buffer[j] <= 0;
		end
	end
	else if(in_valid)begin
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
end

genvar k;
generate
	for(k = 1; k < 10; k = k + 1)
	begin
		assign out[k] = Weight_Buffer[k]*IFM_Buffer[k];
	end
endgenerate


assign out_sum = out[1] + out[2] + out[3] + out[4] + out[5] + out[6] + out[7] + out[8] + out[9];


always@(posedge clk or negedge rst_n)begin
	if(!rst_n) in_valid2 <= 0;
	else in_valid2 <= in_valid;
end



always@(posedge clk or negedge rst_n)begin
	if(!rst_n) OFM <= 0;
	else OFM <= out_sum ;
end

always@(posedge clk or negedge rst_n)begin
	if(!rst_n) 	out_valid <= 0;
	else 		out_valid <= in_valid2;
end

assign Out_OFM = out_valid ? OFM : 0;

endmodule