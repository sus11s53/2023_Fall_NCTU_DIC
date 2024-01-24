// synopsys translate_off
`include "syn_XOR.v"
`include "synchronizer.v"
// synopsys translate_on


/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : Q-2019.12
// Date      : Fri Dec  9 17:14:33 2022
/////////////////////////////////////////////////////////////




module Convolution(
	//input
    clk1,
    clk2,
    clk3,
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

// input clk1,clk2,clk3, rst_n, in_valid, weight_valid;
// //input cg_en;
// input [7:0]In_IFM_1;
// input [7:0]In_IFM_2;
// input [7:0]In_IFM_3;
// input [7:0]In_IFM_4;
// input [7:0]In_IFM_5;
// input [7:0]In_IFM_6;
// input [7:0]In_IFM_7;
// input [7:0]In_IFM_8;
// input [7:0]In_IFM_9;		
// input [7:0]In_Weight_1;
// input [7:0]In_Weight_2;
// input [7:0]In_Weight_3;
// input [7:0]In_Weight_4;
// input [7:0]In_Weight_5;
// input [7:0]In_Weight_6;
// input [7:0]In_Weight_7;
// input [7:0]In_Weight_8;
// input [7:0]In_Weight_9;

// output reg out_valid;
// output reg [20:0] Out_OFM;

parameter STATE_IDLE  = 'd0;
parameter STATE_INPUT = 'd1;
parameter STATE_EXU   = 'd2;
input clk1, clk2, clk3, rst_n, in_valid, weight_valid;
input [7:0] In_IFM_1, In_IFM_2, In_IFM_3, In_IFM_4, In_IFM_5, In_IFM_6, In_IFM_7, In_IFM_8, In_IFM_9;
input [7:0] In_Weight_1, In_Weight_2, In_Weight_3, In_Weight_4, In_Weight_5, In_Weight_6, In_Weight_7, In_Weight_8, In_Weight_9;

wire [7:0] In_IFM_11, In_IFM_22, In_IFM_33, In_IFM_44, In_IFM_55, In_IFM_66, In_IFM_77, In_IFM_88, In_IFM_99;
wire [7:0] In_Weight_11, In_Weight_22, In_Weight_33, In_Weight_44, In_Weight_55, In_Weight_66, In_Weight_77, In_Weight_88, In_Weight_99;
wire in_valid1, weight_valid1;

reg in_valid0, weight_valid0 ;
reg [7:0] In_IFM_110, In_IFM_220, In_IFM_330, In_IFM_440, In_IFM_550, In_IFM_660, In_IFM_770, In_IFM_880, In_IFM_990;
reg [7:0] In_Weight_110, In_Weight_220, In_Weight_330, In_Weight_440, In_Weight_550, In_Weight_660, In_Weight_770, In_Weight_880, In_Weight_990;

always @(posedge clk1 or negedge rst_n) begin
	if (!rst_n) begin
		in_valid0 <= 0 ;
		In_IFM_110 <= 0 ;
		In_IFM_220 <= 0 ;
		In_IFM_330 <= 0 ;
		In_IFM_440 <= 0 ;
		In_IFM_550 <= 0 ;
		In_IFM_660 <= 0 ;
		In_IFM_770 <= 0 ;
		In_IFM_880 <= 0 ;
		In_IFM_990 <= 0 ;
	end
	else if (in_valid) begin
		in_valid0 <= in_valid ;
		In_IFM_110 <= In_IFM_1 ;
		In_IFM_220 <= In_IFM_2 ;
		In_IFM_330 <= In_IFM_3 ;
		In_IFM_440 <= In_IFM_4 ;
		In_IFM_550 <= In_IFM_5 ;
		In_IFM_660 <= In_IFM_6 ;
		In_IFM_770 <= In_IFM_7 ;
		In_IFM_880 <= In_IFM_8 ;
		In_IFM_990 <= In_IFM_9 ;
	end
	else begin
		in_valid0 <= 0 ;
	end
end

always @(posedge clk1 or negedge rst_n) begin
	if (!rst_n) begin
		weight_valid0 <= 0 ;
		In_Weight_110 <= 0 ;
		In_Weight_220 <= 0 ;
		In_Weight_330 <= 0 ;
		In_Weight_440 <= 0 ;
		In_Weight_550 <= 0 ;
		In_Weight_660 <= 0 ;
		In_Weight_770 <= 0 ;
		In_Weight_880 <= 0 ;
		In_Weight_990 <= 0 ;		
	end
	else if (weight_valid) begin
		weight_valid0 <= weight_valid ;
		In_Weight_110 <= In_Weight_1 ;
		In_Weight_220 <= In_Weight_2 ;
		In_Weight_330 <= In_Weight_3 ;
		In_Weight_440 <= In_Weight_4 ;
		In_Weight_550 <= In_Weight_5 ;
		In_Weight_660 <= In_Weight_6 ;
		In_Weight_770 <= In_Weight_7 ;
		In_Weight_880 <= In_Weight_8 ;
		In_Weight_990 <= In_Weight_9 ;
	end
	else begin
		weight_valid0 <= 0 ;
	end
end



syn_XOR XOR_in_valid(.IN(in_valid0),.OUT(in_valid1),.TX_CLK(clk1),.RX_CLK(clk2),.RST_N(rst_n));

genvar p;
generate
	for (p = 0; p < 8; p = p+1)begin: gen_IFM_1
		syn_XOR XOR_IFM_1(.IN(In_IFM_110[p]),.OUT(In_IFM_11[p]),.TX_CLK(clk1),.RX_CLK(clk2),.RST_N(rst_n));
	end
endgenerate

genvar j;
generate
	for (j = 0; j < 8; j = j+1)begin: gen_IFM_2
		syn_XOR XOR_IFM_2(.IN(In_IFM_220[j]),.OUT(In_IFM_22[j]),.TX_CLK(clk1),.RX_CLK(clk2),.RST_N(rst_n));
	end
endgenerate

genvar k;
generate
	for (k = 0; k < 8; k= k+1)begin: gen_IFM_3
		syn_XOR XOR_IFM_3(.IN(In_IFM_330[k]),.OUT(In_IFM_33[k]),.TX_CLK(clk1),.RX_CLK(clk2),.RST_N(rst_n));
	end
endgenerate

genvar l;
generate
	for (l = 0; l < 8; l = l+1)begin: gen_IFM_4
		syn_XOR XOR_IFM_4(.IN(In_IFM_440[l]),.OUT(In_IFM_44[l]),.TX_CLK(clk1),.RX_CLK(clk2),.RST_N(rst_n));
	end
endgenerate

genvar m;
generate
	for (m = 0; m < 8; m = m+1)begin: gen_IFM_5
		syn_XOR XOR_IFM_5(.IN(In_IFM_550[m]),.OUT(In_IFM_55[m]),.TX_CLK(clk1),.RX_CLK(clk2),.RST_N(rst_n));
	end
endgenerate

genvar n;
generate
	for (n = 0; n < 8; n = n+1)begin: gen_IFM_6
		syn_XOR XOR_IFM_6(.IN(In_IFM_660[n]),.OUT(In_IFM_66[n]),.TX_CLK(clk1),.RX_CLK(clk2),.RST_N(rst_n));
	end
endgenerate

genvar x;
generate
	for (x = 0; x < 8; x = x+1)begin: gen_IFM_7
		syn_XOR XOR_IFM_7(.IN(In_IFM_770[x]),.OUT(In_IFM_77[x]),.TX_CLK(clk1),.RX_CLK(clk2),.RST_N(rst_n));
	end
endgenerate

genvar y;
generate
	for (y = 0; y < 8; y = y+1)begin: gen_IFM_8
		syn_XOR XOR_IFM_8(.IN(In_IFM_880[y]),.OUT(In_IFM_88[y]),.TX_CLK(clk1),.RX_CLK(clk2),.RST_N(rst_n));
	end
endgenerate

genvar z;
generate
	for (z = 0; z < 8; z = z+1)begin: gen_IFM_9
		syn_XOR XOR_IFM_9(.IN(In_IFM_990[z]),.OUT(In_IFM_99[z]),.TX_CLK(clk1),.RX_CLK(clk2),.RST_N(rst_n));
	end
endgenerate
///////////////////////////////////////////////////////////////////////////////////////////////////////////
syn_XOR XOR_weight_valid(.IN(weight_valid0),.OUT(weight_valid1),.TX_CLK(clk1),.RX_CLK(clk2),.RST_N(rst_n));

genvar ii;
generate
	for (ii = 0; ii < 8; ii = ii+1)begin: gen_Weight_1
		syn_XOR XOR_Weight_1(.IN(In_Weight_110[ii]),.OUT(In_Weight_11[ii]),.TX_CLK(clk1),.RX_CLK(clk2),.RST_N(rst_n));
	end
endgenerate

genvar jj;
generate
	for (jj = 0; jj < 8; jj = jj+1)begin: gen_Weight_2
		syn_XOR XOR_Weight_2(.IN(In_Weight_220[jj]),.OUT(In_Weight_22[jj]),.TX_CLK(clk1),.RX_CLK(clk2),.RST_N(rst_n));
	end
endgenerate

genvar kk;
generate
	for (kk = 0; kk < 8; kk= kk+1)begin: gen_Weight_3
		syn_XOR XOR_Weight_3(.IN(In_Weight_330[kk]),.OUT(In_Weight_33[kk]),.TX_CLK(clk1),.RX_CLK(clk2),.RST_N(rst_n));
	end
endgenerate

genvar ll;
generate
	for (ll = 0; ll < 8; ll = ll+1)begin: gen_Weight_4
		syn_XOR XOR_Weight_4(.IN(In_Weight_440[ll]),.OUT(In_Weight_44[ll]),.TX_CLK(clk1),.RX_CLK(clk2),.RST_N(rst_n));
	end
endgenerate

genvar mm;
generate
	for (mm = 0; mm < 8; mm = mm+1)begin: gen_Weight_5
		syn_XOR XOR_Weight_5(.IN(In_Weight_550[mm]),.OUT(In_Weight_55[mm]),.TX_CLK(clk1),.RX_CLK(clk2),.RST_N(rst_n));
	end
endgenerate

genvar nn;
generate
	for (nn = 0; nn < 8; nn = nn+1)begin: gen_Weight_6
		syn_XOR XOR_Weight_6(.IN(In_Weight_660[nn]),.OUT(In_Weight_66[nn]),.TX_CLK(clk1),.RX_CLK(clk2),.RST_N(rst_n));
	end
endgenerate

genvar xx;
generate
	for (xx = 0; xx < 8; xx = xx+1)begin: gen_Weight_7
		syn_XOR XOR_Weight_7(.IN(In_Weight_770[xx]),.OUT(In_Weight_77[xx]),.TX_CLK(clk1),.RX_CLK(clk2),.RST_N(rst_n));
	end
endgenerate

genvar yy;
generate
	for (yy = 0; yy < 8; yy = yy+1)begin: gen_Weight_8
		syn_XOR XOR_Weight_8(.IN(In_Weight_880[yy]),.OUT(In_Weight_88[yy]),.TX_CLK(clk1),.RX_CLK(clk2),.RST_N(rst_n));
	end
endgenerate

genvar zz;
generate
	for (zz = 0; zz < 8; zz = zz+1)begin: gen_Weight_9
		syn_XOR XOR_Weight_9(.IN(In_Weight_990[zz]),.OUT(In_Weight_99[zz]),.TX_CLK(clk1),.RX_CLK(clk2),.RST_N(rst_n));
	end
endgenerate
//////////////////////////////////////////////////////////////////////
reg out_valid1;
reg [20:0] Out_OFM1;
//////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////
////     clk2     ///////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
reg [7:0]weight_reg [0:8];
reg [7:0]IFM_reg [0:8];

reg [1:0] current_STATE, next_STATE;

//reg [4:0] count;
integer i;
always @(posedge clk2 or negedge rst_n) begin
	if (!rst_n)begin
		current_STATE <= STATE_IDLE;
	end
	else begin
		current_STATE <= next_STATE;
	end
end
always @(*) begin
	case(current_STATE)
		STATE_IDLE:begin
			if (in_valid1) next_STATE = STATE_INPUT;
			else next_STATE = STATE_IDLE;
		end
		STATE_INPUT:begin
			next_STATE = STATE_EXU;
		end
		STATE_EXU:begin
			if (!in_valid1) next_STATE = STATE_IDLE;
			else next_STATE = STATE_EXU;
		end
		default  next_STATE = STATE_IDLE;
	endcase
end
always @(posedge clk2 or negedge rst_n) begin
	if (!rst_n)begin
		for (i = 0; i < 9; i= i+1) weight_reg[i] <= 0;
	end
	else begin
		if (weight_valid1) begin
			weight_reg[0] <= In_Weight_11;
			weight_reg[1] <= In_Weight_22;
			weight_reg[2] <= In_Weight_33;
			weight_reg[3] <= In_Weight_44;
			weight_reg[4] <= In_Weight_55;
			weight_reg[5] <= In_Weight_66;
			weight_reg[6] <= In_Weight_77;
			weight_reg[7] <= In_Weight_88;
			weight_reg[8] <= In_Weight_99;
		end
	end
end
	
always @(posedge clk2 or negedge rst_n) begin
	if (!rst_n)begin
		for (i = 0; i < 9; i= i+1) IFM_reg[i] <= 0;
	end
	else begin
		if (in_valid1) begin
			IFM_reg[0] <= In_IFM_11;
			IFM_reg[1] <= In_IFM_22;
			IFM_reg[2] <= In_IFM_33;
			IFM_reg[3] <= In_IFM_44;
			IFM_reg[4] <= In_IFM_55;
			IFM_reg[5] <= In_IFM_66;
			IFM_reg[6] <= In_IFM_77;
			IFM_reg[7] <= In_IFM_88;
			IFM_reg[8] <= In_IFM_99;
		end
	end
end
always @(posedge clk2 or negedge rst_n) begin
	if (!rst_n) begin
		Out_OFM1 <= 0;
	end
	else if (current_STATE== STATE_EXU) begin
		Out_OFM1 <= weight_reg[0] * IFM_reg[0] +
				   	weight_reg[1] * IFM_reg[1] +
				   	weight_reg[2] * IFM_reg[2] +
				   	weight_reg[3] * IFM_reg[3] +
				   	weight_reg[4] * IFM_reg[4] +
				   	weight_reg[5] * IFM_reg[5] +
				   	weight_reg[6] * IFM_reg[6] +
				   	weight_reg[7] * IFM_reg[7] +
				   	weight_reg[8] * IFM_reg[8] ;
	end
	else begin
		Out_OFM1 <= 0 ;
	end
end

always @(posedge clk2  or negedge rst_n) begin
	if (!rst_n)begin
		out_valid1 <= 0;
	end
	else begin
		if (/*next_STATE== STATE_EXU ||*/ current_STATE== STATE_EXU) begin
			out_valid1 <= 1;
		end
		else out_valid1 <= 0;
	end
	
end

wire out_valid_wire ;
wire [20:0] Out_OFM_wire ;


//////////////The output port shoud be registers///////////////////////
output reg out_valid;
output reg [20:0] Out_OFM;
//////////////////////////////////////////////////////////////////////
syn_XOR XOR_out_valid(.IN(out_valid1),.OUT(out_valid_wire),.TX_CLK(clk2),.RX_CLK(clk3),.RST_N(rst_n));

genvar q;
generate
	for (q = 0; q < 21; q = q+1)begin: gen_OFM
		syn_XOR XOR_OFM(.IN(Out_OFM1[q]),.OUT(Out_OFM_wire[q]),.TX_CLK(clk2),.RX_CLK(clk3),.RST_N(rst_n));
	end
endgenerate


always @(posedge clk3 or negedge rst_n) begin
    if (!rst_n) begin
        out_valid <= 0 ;
    end
    else if (out_valid_wire) begin
        out_valid <= out_valid_wire ;
    end
	else if (!out_valid_wire) begin
		out_valid <= 0 ;
	end
end

always @(posedge clk3 or negedge rst_n) begin
    if (!rst_n) begin
        Out_OFM <= 0 ;
    end
    else if (out_valid_wire) begin
        Out_OFM <= Out_OFM_wire ;
    end
end
endmodule