module Convolution_with_pipeline(
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
reg [15:0] mul1[0:8];
reg [15:0] mul2[0:8];
reg [15:0] mul3[0:8];
reg [15:0] mul4[0:8];

wire [16:0] add10, add11, add12, add13;
reg [17:0] add14, add15;
wire [18:0] add16;
reg [19:0] add17;
reg [15:0] mul1_8;
//
wire [16:0] add20, add21, add22, add23;
reg  [17:0] add24, add25;
wire[18:0] add26;
reg [19:0] add27;
reg [15:0] mul2_8;
//
wire [16:0] add30, add31, add32, add33;
reg  [17:0] add34, add35;
wire[18:0] add36;
reg [19:0] add37;
reg [15:0] mul3_8;
//
wire [16:0] add40, add41, add42, add43;
reg  [17:0] add44, add45;
wire[18:0] add46;
reg [19:0] add47;
reg [15:0] mul4_8;

always@(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
        mul1[0] <= 0;
		mul1[1] <= 0;
		mul1[2] <= 0;
		mul1[3] <= 0;
		mul1[4] <= 0;
		mul1[5] <= 0;
		mul1[6] <= 0;
		mul1[7] <= 0;
		mul1[8] <= 0;
    end
	else  begin
        mul1[0] <= weight[0][7:0] * IFM[0] [7:0];
        mul1[1] <= weight[1][7:0] * IFM[1] [7:0];
        mul1[2] <= weight[2][7:0] * IFM[2] [7:0];
        mul1[3] <= weight[3][7:0] * IFM[7] [7:0];
        mul1[4] <= weight[4][7:0] * IFM[8] [7:0];
        mul1[5] <= weight[5][7:0] * IFM[9] [7:0];
        mul1[6] <= weight[6][7:0] * IFM[14][7:0];
        mul1[7] <= weight[7][7:0] * IFM[15][7:0];
        mul1[8] <= weight[8][7:0] * IFM[16][7:0];
    end 
end
always@(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
        mul2[0] <= 0;
		mul2[1] <= 0;
		mul2[2] <= 0;
		mul2[3] <= 0;
		mul2[4] <= 0;
		mul2[5] <= 0;
		mul2[6] <= 0;
		mul2[7] <= 0;
		mul2[8] <= 0;
    end
	else  begin
        mul2[0] <= weight[0][15:8] * IFM[0] [7:0];
        mul2[1] <= weight[1][15:8] * IFM[1] [7:0];
        mul2[2] <= weight[2][15:8] * IFM[2] [7:0];
        mul2[3] <= weight[3][15:8] * IFM[7] [7:0];
        mul2[4] <= weight[4][15:8] * IFM[8] [7:0];
        mul2[5] <= weight[5][15:8] * IFM[9] [7:0];
        mul2[6] <= weight[6][15:8] * IFM[14][7:0];
        mul2[7] <= weight[7][15:8] * IFM[15][7:0];
        mul2[8] <= weight[8][15:8] * IFM[16][7:0];
    end 
end
always@(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
        mul3[0] <= 0;
		mul3[1] <= 0;
		mul3[2] <= 0;
		mul3[3] <= 0;
		mul3[4] <= 0;
		mul3[5] <= 0;
		mul3[6] <= 0;
		mul3[7] <= 0;
		mul3[8] <= 0;
    end
	else  begin
        mul3[0] <= weight[0][7:0] * IFM[0] [15:8];
        mul3[1] <= weight[1][7:0] * IFM[1] [15:8];
        mul3[2] <= weight[2][7:0] * IFM[2] [15:8];
        mul3[3] <= weight[3][7:0] * IFM[7] [15:8];
        mul3[4] <= weight[4][7:0] * IFM[8] [15:8];
        mul3[5] <= weight[5][7:0] * IFM[9] [15:8];
        mul3[6] <= weight[6][7:0] * IFM[14][15:8];
        mul3[7] <= weight[7][7:0] * IFM[15][15:8];
        mul3[8] <= weight[8][7:0] * IFM[16][15:8];
    end 
end
always@(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
        mul4[0] <= 0;
		mul4[1] <= 0;
		mul4[2] <= 0;
		mul4[3] <= 0;
		mul4[4] <= 0;
		mul4[5] <= 0;
		mul4[6] <= 0;
		mul4[7] <= 0;
		mul4[8] <= 0;
    end
	else  begin
        mul4[0] <= weight[0][15:8] * IFM[0] [15:8];
        mul4[1] <= weight[1][15:8] * IFM[1] [15:8];
        mul4[2] <= weight[2][15:8] * IFM[2] [15:8];
        mul4[3] <= weight[3][15:8] * IFM[7] [15:8];
        mul4[4] <= weight[4][15:8] * IFM[8] [15:8];
        mul4[5] <= weight[5][15:8] * IFM[9] [15:8];
        mul4[6] <= weight[6][15:8] * IFM[14][15:8];
        mul4[7] <= weight[7][15:8] * IFM[15][15:8];
        mul4[8] <= weight[8][15:8] * IFM[16][15:8];
    end 
end
assign add10 = mul1[0] + mul1[1];
assign add11 = mul1[2] + mul1[3];
assign add12 = mul1[4] + mul1[5];
assign add13 = mul1[6] + mul1[7];
always@(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
        mul1_8 <= 0;
    end
	else  begin
        mul1_8 <= mul1[8];
    end 
end
always@(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
        add14 <= 0;
    end
	else  begin
        add14 <= add10 + add11;
    end 
end
always@(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
        add15 <= 0;
    end
	else  begin
        add15 <= add12 + add13;
    end 
end
assign add16 = add14 + add15;
always@(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
        add17 <= 0;
    end
	else  begin
        add17 <= add16 + mul1_8;
    end 
end
//
//
//
assign add20 = mul2[0] + mul2[1];
assign add21 = mul2[2] + mul2[3];
assign add22 = mul2[4] + mul2[5];
assign add23 = mul2[6] + mul2[7];
always@(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
        mul2_8 <= 0;
    end
	else  begin
        mul2_8 <= mul2[8];
    end 
end
always@(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
        add24 <= 0;
    end
	else  begin
        add24 <= add20 + add21;
    end 
end
always@(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
        add25 <= 0;
    end
	else  begin
        add25 <= add22 + add23;
    end 
end
assign add26 = add24 + add25;
always@(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
        add27 <= 0;
    end
	else  begin
        add27 <= add26 + mul2_8;
    end 
end
//
assign add30 = mul3[0] + mul3[1];
assign add31 = mul3[2] + mul3[3];
assign add32 = mul3[4] + mul3[5];
assign add33 = mul3[6] + mul3[7];
always@(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
        mul3_8 <= 0;
    end
	else  begin
        mul3_8 <= mul3[8];
    end 
end
always@(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
        add34 <= 0;
    end
	else  begin
        add34 <= add30 + add31;
    end 
end
always@(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
        add35 <= 0;
    end
	else  begin
        add35 <= add32 + add33;
    end 
end
assign add36 = add34 + add35;
always@(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
        add37 <= 0;
    end
	else  begin
        add37 <= add36 + mul3_8;
    end 
end
//
assign add40 = mul4[0] + mul4[1];
assign add41 = mul4[2] + mul4[3];
assign add42 = mul4[4] + mul4[5];
assign add43 = mul4[6] + mul4[7];
always@(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
        mul4_8 <= 0;
    end
	else  begin
        mul4_8 <= mul4[8];
    end 
end
always@(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
        add44 <= 0;
    end
	else  begin
        add44 <= add40 + add41;
    end 
end
always@(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
        add45 <= 0;
    end
	else  begin
        add45 <= add42 + add43;
    end 
end
assign add46 = add44 + add45;
always@(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
        add47 <= 0;
    end
	else  begin
        add47 <= add46 + mul4_8;
    end 
end

//
reg flag1, flag2;
always@(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
        flag1 <= 0;
		flag2 <= 0;
    end
	else  begin
        flag1 <= (count>='d26)? 1: 0;
		flag2 <= flag1;
    end 
end

wire [34:0]combine1, combine2;
assign combine1 = (add47<<16) + add17;
assign combine2 = ((add37 + add27) << 8);
always@(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
        out_valid <= 0;
        Out_OFM <= 'd0;
    end
	else if(flag2) begin
        out_valid <= 1;
        Out_OFM <= combine1 + combine2;
    end
    else  begin
        out_valid <= 0;
        Out_OFM <= 'd0;
    end
end
endmodule