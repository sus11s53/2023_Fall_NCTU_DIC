`include "AFIFO.v"



/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : Q-2019.12
// Date      : Fri Dec  9 17:14:33 2022
/////////////////////////////////////////////////////////////




module Convolution #(parameter DSIZE = 21,
			   		 parameter ASIZE = 4) (
	//input
    clk1,
    clk2,
    clk_operating,
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
	//output
    out_valid, 
	Out_OFM	

);

input clk1, clk2, rst_n, in_valid, weight_valid;
input clk_operating;
input [7:0]In_IFM_1, In_IFM_2, In_IFM_3, In_IFM_4, In_IFM_5;
input [7:0]In_IFM_6, In_IFM_7, In_IFM_8, In_IFM_9;		
input [7:0]In_Weight_1, In_Weight_2, In_Weight_3, In_Weight_4, In_Weight_5;
input [7:0]In_Weight_6, In_Weight_7, In_Weight_8, In_Weight_9;

output reg out_valid;
output reg[20:0] Out_OFM;

reg [7:0]IFM_Buffer[1:9] ;  
reg [7:0]Weight_Buffer[1:9];

wire  [16:0]out[1:9];
wire  [20:0]out_sum;
wire  [20:0]r_out_sum;

reg in_valid_reg_1;

reg [1:0] cnt_out;
reg [20:0] A1 , A2;

wire B_syn;
wire A_syn;

wire wfull , rempty;
reg winc;
wire rinc;

integer j;

always@(posedge clk1 or negedge rst_n)begin
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
    else begin
        Weight_Buffer[1] <= Weight_Buffer[1];
        Weight_Buffer[2] <= Weight_Buffer[2];
        Weight_Buffer[3] <= Weight_Buffer[3];
        Weight_Buffer[4] <= Weight_Buffer[4];
        Weight_Buffer[5] <= Weight_Buffer[5];
        Weight_Buffer[6] <= Weight_Buffer[6];
        Weight_Buffer[7] <= Weight_Buffer[7];
        Weight_Buffer[8] <= Weight_Buffer[8];
        Weight_Buffer[9] <= Weight_Buffer[9];
    end
end

always@(posedge clk1 or negedge rst_n)begin
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
	else begin
		IFM_Buffer[1] <= IFM_Buffer[1];
		IFM_Buffer[2] <= IFM_Buffer[2];
		IFM_Buffer[3] <= IFM_Buffer[3];
		IFM_Buffer[4] <= IFM_Buffer[4];
		IFM_Buffer[5] <= IFM_Buffer[5];
		IFM_Buffer[6] <= IFM_Buffer[6];
		IFM_Buffer[7] <= IFM_Buffer[7];
		IFM_Buffer[8] <= IFM_Buffer[8];
		IFM_Buffer[9] <= IFM_Buffer[9];
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

always@(posedge clk1 or negedge rst_n)begin
	if(!rst_n) in_valid_reg_1 <= 0;
	else in_valid_reg_1 <= in_valid;
end


always@(*) begin
	if(wfull) winc = 0;
	else if(in_valid_reg_1) winc = 1;
	else winc = 0;
end


AFIFO #(.DSIZE(DSIZE) , .ASIZE(ASIZE)) u1(.rst_n(rst_n) , .rclk(clk2) , .rinc(rinc) , .wclk(clk1) , .winc(winc) , .wdata(out_sum) , .rempty(rempty) , .rdata(r_out_sum) ,.wfull(wfull));


assign rinc = ~rempty;

always@(posedge clk2 or negedge rst_n)begin
	if(!rst_n) Out_OFM <= 0;
	else if(rinc) Out_OFM <= r_out_sum;
    else       Out_OFM <= 0;
end

always@(posedge clk2 or negedge rst_n)begin
	if(!rst_n) 	out_valid <= 0;
	else 		out_valid <= rinc;
end

endmodule