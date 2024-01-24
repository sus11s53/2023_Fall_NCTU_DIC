module Convolution_without_pipeline(
	//input
    clk,
    rst_n,
	in_valid,
	weight_valid,
	In_IFM_1,
    In_Weight_1,
	//output
    out_valid, 
	Out_OFM	

);

input clk, rst_n, in_valid, weight_valid;
input [15:0]In_IFM_1;		
input [15:0]In_Weight_1;
output reg out_valid;
output reg[35:0] Out_OFM;

//////////////////////////////////////////////////////////////////////
//				Reg & Wire
//////////////////////////////////////////////////////////////////////
reg [15:0] IFM[0:24];
reg [15:0] weight[0:8];
reg [5:0] count;
integer i;
//////////////////////////////////////////////////////////////////////
//				Input
//////////////////////////////////////////////////////////////////////

always@(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		count <= 0;
	end
	else if(in_valid)
		count <= count + 1;
	else 
		count <=0;
end

//////////////////////////////////////////////////////////////////////
//				Input
//////////////////////////////////////////////////////////////////////

always@(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		for (i=0;i<9;i=i+1) 
			weight[i] <= 0;
	end
	else if(weight_valid && count < 9)
		weight[count] <= In_Weight_1;
end
always@(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		for (i=0;i<24;i=i+1) 
			IFM[i] <= 0;
	end
	else if(count < 29 ) begin
		IFM[0]  <= IFM[1] ;
		IFM[1]  <= IFM[2] ;
		IFM[2]  <= IFM[3] ;
		IFM[3]  <= IFM[4] ;
		IFM[4]  <= IFM[5] ;
		IFM[5]  <= IFM[6] ;
		IFM[6]  <= IFM[7] ;
		IFM[7]  <= IFM[8] ;
		IFM[8]  <= IFM[9] ;
		IFM[9]  <= IFM[10];
		IFM[10] <= IFM[11];
		IFM[11] <= IFM[12];
		IFM[12] <= IFM[13];
		IFM[13] <= IFM[14];
		IFM[14] <= IFM[15];
		IFM[15] <= IFM[16];
		IFM[16] <= IFM[17];
		IFM[17] <= IFM[18];
		IFM[18] <= IFM[19];
		IFM[19] <= IFM[20];
		IFM[20] <= IFM[21];
		IFM[21] <= IFM[22];
		IFM[22] <= IFM[23];
		IFM[23] <= IFM[24];
		IFM[24] <= In_IFM_1;
	end
	else if(count == 29 ) begin
		IFM[0]  <= IFM[3] ;
		IFM[1]  <= IFM[4] ;
		IFM[2]  <= IFM[5] ;
		IFM[3]  <= IFM[6] ;
		IFM[4]  <= IFM[7] ;
		IFM[5]  <= IFM[8] ;
		IFM[6]  <= IFM[9] ;
		IFM[7]  <= IFM[10];
		IFM[8]  <= IFM[11];
		IFM[9]  <= IFM[12];
		IFM[10] <= IFM[13];
		IFM[11] <= IFM[14];
		IFM[12] <= IFM[15];
		IFM[13] <= IFM[16];
		IFM[14] <= IFM[17];
		IFM[15] <= IFM[18];
		IFM[16] <= IFM[19];
		IFM[17] <= IFM[20];
		IFM[18] <= IFM[21];
		IFM[19] <= IFM[22];
		IFM[20] <= IFM[23];
		IFM[21] <= IFM[24];
		IFM[22] <= In_IFM_1;
	end
	else if(count >= 30 && count <34) begin
		IFM[0]  <= IFM[1] ;
		IFM[1]  <= IFM[2] ;
		IFM[2]  <= IFM[3] ;
		IFM[3]  <= IFM[4] ;
		IFM[4]  <= IFM[5] ;
		IFM[5]  <= IFM[6] ;
		IFM[6]  <= IFM[7] ;
		IFM[7]  <= IFM[8] ;
		IFM[8]  <= IFM[9] ;
		IFM[9]  <= IFM[10];
		IFM[10] <= IFM[11];
		IFM[11] <= IFM[12];
		IFM[12] <= IFM[13];
		IFM[13] <= IFM[14];
		IFM[14] <= IFM[15];
		IFM[15] <= IFM[16];
		IFM[16] <= IFM[17];
		IFM[17] <= IFM[18];
		IFM[18] <= IFM[19];
		IFM[19] <= IFM[20];
		IFM[20] <= IFM[21];
		IFM[21] <= IFM[22];
		IFM[22] <= In_IFM_1;
	end
	else if(count ==34) begin
		IFM[0]  <= IFM[3] ;
		IFM[1]  <= IFM[4] ;
		IFM[2]  <= IFM[5] ;
		IFM[3]  <= IFM[6] ;
		IFM[4]  <= IFM[7] ;
		IFM[5]  <= IFM[8] ;
		IFM[6]  <= IFM[9] ;
		IFM[7]  <= IFM[10];
		IFM[8]  <= IFM[11];
		IFM[9]  <= IFM[12];
		IFM[10] <= IFM[13];
		IFM[11] <= IFM[14];
		IFM[12] <= IFM[15];
		IFM[13] <= IFM[16];
		IFM[14] <= IFM[17];
		IFM[15] <= IFM[18];
		IFM[16] <= IFM[19];
		IFM[17] <= IFM[20];
		IFM[18] <= IFM[21];
		IFM[19] <= IFM[22];
		IFM[20] <= In_IFM_1;
	end
	else if(count >= 35 && count < 39) begin
		IFM[0]  <= IFM[1] ;
		IFM[1]  <= IFM[2] ;
		IFM[2]  <= IFM[3] ;
		IFM[3]  <= IFM[4] ;
		IFM[4]  <= IFM[5] ;
		IFM[5]  <= IFM[6] ;
		IFM[6]  <= IFM[7] ;
		IFM[7]  <= IFM[8] ;
		IFM[8]  <= IFM[9] ;
		IFM[9]  <= IFM[10];
		IFM[10] <= IFM[11];
		IFM[11] <= IFM[12];
		IFM[12] <= IFM[13];
		IFM[13] <= IFM[14];
		IFM[14] <= IFM[15];
		IFM[15] <= IFM[16];
		IFM[16] <= IFM[17];
		IFM[17] <= IFM[18];
		IFM[18] <= IFM[19];
		IFM[19] <= IFM[20];
		IFM[20] <= In_IFM_1;
	end
	else if(count == 39) begin
		IFM[0]  <= IFM[3] ;
		IFM[1]  <= IFM[4] ;
		IFM[2]  <= IFM[5] ;
		IFM[3]  <= IFM[6] ;
		IFM[4]  <= IFM[7] ;
		IFM[5]  <= IFM[8] ;
		IFM[6]  <= IFM[9] ;
		IFM[7]  <= IFM[10];
		IFM[8]  <= IFM[11];
		IFM[9]  <= IFM[12];
		IFM[10] <= IFM[13];
		IFM[11] <= IFM[14];
		IFM[12] <= IFM[15];
		IFM[13] <= IFM[16];
		IFM[14] <= IFM[17];
		IFM[15] <= IFM[18];
		IFM[16] <= IFM[19];
		IFM[17] <= IFM[20];
		IFM[18] <= In_IFM_1;
	end
	else if(count >= 40 && count < 44) begin
		IFM[0]  <= IFM[1] ;
		IFM[1]  <= IFM[2] ;
		IFM[2]  <= IFM[3] ;
		IFM[3]  <= IFM[4] ;
		IFM[4]  <= IFM[5] ;
		IFM[5]  <= IFM[6] ;
		IFM[6]  <= IFM[7] ;
		IFM[7]  <= IFM[8] ;
		IFM[8]  <= IFM[9] ;
		IFM[9]  <= IFM[10];
		IFM[10] <= IFM[11];
		IFM[11] <= IFM[12];
		IFM[12] <= IFM[13];
		IFM[13] <= IFM[14];
		IFM[14] <= IFM[15];
		IFM[15] <= IFM[16];
		IFM[16] <= IFM[17];
		IFM[17] <= IFM[18];
		IFM[18] <= In_IFM_1;
	end
	else if(count == 44) begin
		IFM[0]  <= IFM[3] ;
		IFM[1]  <= IFM[4] ;
		IFM[2]  <= IFM[5] ;
		IFM[3]  <= IFM[6] ;
		IFM[4]  <= IFM[7] ;
		IFM[5]  <= IFM[8] ;
		IFM[6]  <= IFM[9] ;
		IFM[7]  <= IFM[10];
		IFM[8]  <= IFM[11];
		IFM[9]  <= IFM[12];
		IFM[10] <= IFM[13];
		IFM[11] <= IFM[14];
		IFM[12] <= IFM[15];
		IFM[13] <= IFM[16];
		IFM[14] <= IFM[17];
		IFM[15] <= IFM[18];
		IFM[16] <= In_IFM_1;
	end
	else if(count > 44) begin
		IFM[0]  <= IFM[1] ;
		IFM[1]  <= IFM[2] ;
		IFM[2]  <= IFM[3] ;
		IFM[3]  <= IFM[4] ;
		IFM[4]  <= IFM[5] ;
		IFM[5]  <= IFM[6] ;
		IFM[6]  <= IFM[7] ;
		IFM[7]  <= IFM[8] ;
		IFM[8]  <= IFM[9] ;
		IFM[9]  <= IFM[10];
		IFM[10] <= IFM[11];
		IFM[11] <= IFM[12];
		IFM[12] <= IFM[13];
		IFM[13] <= IFM[14];
		IFM[14] <= IFM[15];
		IFM[15] <= IFM[16];
		IFM[16] <= In_IFM_1;
	end
end



//////////////////////////////////////////////////////////////////////
//				Conv
//////////////////////////////////////////////////////////////////////
wire [31:0] mul[0:8];
wire [32:0] add0, add1, add2, add3;
wire [33:0] add4, add5;
wire [34:0] add6;
wire [35:0] add7;

assign mul[0] = weight[0] * IFM[0];
assign mul[1] = weight[1] * IFM[1];
assign mul[2] = weight[2] * IFM[2];
assign mul[3] = weight[3] * IFM[7];
assign mul[4] = weight[4] * IFM[8];
assign mul[5] = weight[5] * IFM[9];
assign mul[6] = weight[6] * IFM[14];
assign mul[7] = weight[7] * IFM[15];
assign mul[8] = weight[8] * IFM[16];
assign add0 = mul[0] + mul[1];
assign add1 = mul[2] + mul[3];
assign add2 = mul[4] + mul[5];
assign add3 = mul[6] + mul[7];
assign add4 = add0 + add1;
assign add5 = add2 + add3;
assign add6 = add4 + add5;
assign add7 = add6 + mul[8];

always@(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
        out_valid <= 0;
        Out_OFM <= 'd0;
    end
	else if(count>='d25) begin
        out_valid <= 1;
        Out_OFM <= add7;
    end
    else  begin
        out_valid <= 0;
        Out_OFM <= 'd0;
    end
end

endmodule