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

//////////////The output port shoud be registers///////////////////////
output reg out_valid;
output reg[35:0] Out_OFM;
//////////////////////////////////////////////////////////////////////


/////// 2 Buffer/////////////
//You have to sue these buffers for the 3-1 & 3-2 /////// 
reg [15:0]IFM_Buffer[0:6][0:6] ;   //  Use this buffer to store IFM
reg [15:0]Weight_Buffer[0:2][0:2];  //  Use this buffer to store Weight
/////////////////////////////////////

integer i , j ;

reg [5:0] cnt , cnt_out , cnt_standby;
reg [5:0] cnt_row , cnt_col;
reg [5:0] cnt_row_weight , cnt_col_weight;

reg [5:0] STATE , NEXT;

parameter ZERO = 'd0;
parameter STORE = 'd1;
parameter STANDBY = 'd2;
parameter OUT = 'd3;

wire [35:0] convolution [0:24];

always@(posedge clk or negedge rst_n) begin
	    if(!rst_n) STATE <= ZERO;
	    else STATE <= NEXT;
end

always@(*)begin
    case(STATE)
        ZERO:begin
            if(in_valid) NEXT = STORE;
            else NEXT = ZERO;
        end
        
		STORE:begin
    		if(!in_valid) NEXT = STANDBY;
            else NEXT = STORE;
        end

        STANDBY:begin
			if(cnt_standby == 3) NEXT = OUT;
            else NEXT = STANDBY;
        end

        OUT:begin
            if(cnt_out == 24) NEXT = ZERO;
            else NEXT = OUT;
        end

        default: NEXT = STATE;
    endcase
end

////////Here just an example of how to use IFM_buffer & WEight_Buffer to store data////////
//The storage mechanism can be modified, but not the buffer size cannot be modified
always@(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		for (i = 0; i < 7; i = i + 1) begin 
			for( j = 0; j < 7; j = j + 1) begin	
				IFM_Buffer[i][j] <= 0;
			end
		end
	end
	else if (in_valid) IFM_Buffer[cnt_row][cnt_col] <= In_IFM_1;
end

always@(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		for (i = 0; i < 3; i = i + 1) begin 
			for( j = 0; j < 3; j = j + 1) begin	
				Weight_Buffer[i][j] <= 0;
			end
		end
	end
	else if (weight_valid) Weight_Buffer[cnt_row_weight][cnt_col_weight] <= In_Weight_1;
end

always@(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		cnt_col <= 0;
	end
	else if(cnt_col == 6)
		cnt_col <= 0;
	else if(in_valid)
		cnt_col <= cnt_col + 1;
	else 
		cnt_col <= 0;
end

always@(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		cnt_row <= 0;
	end
	else if(cnt_row == 6 && cnt_col == 6 )
		cnt_row <= 0;
	else if(cnt_col == 6)
		cnt_row <= cnt_row + 1;
end

always@(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		cnt_col_weight <= 0;
	end
	else if(cnt_col_weight == 2)
		cnt_col_weight <= 0;
	else if(weight_valid)
		cnt_col_weight <= cnt_col_weight + 1;
	else 
		cnt_col_weight <= 0;
end

always@(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		cnt_row_weight <= 0;
	end
	else if (cnt_row_weight == 2 && cnt_col_weight == 2)
		cnt_row_weight <= 0;
	else if(cnt_col_weight == 2)
		cnt_row_weight <= cnt_row_weight + 1;
end

//-----------------------------------------------------------------------------------------------------------------------------------------

assign convolution[0] =    IFM_Buffer[0][0] * Weight_Buffer [0][0] + IFM_Buffer[0][1] * Weight_Buffer [0][1] + IFM_Buffer[0][2] * Weight_Buffer [0][2]
						  +IFM_Buffer[1][0] * Weight_Buffer [1][0] + IFM_Buffer[1][1] * Weight_Buffer [1][1] + IFM_Buffer[1][2] * Weight_Buffer [1][2]
						  +IFM_Buffer[2][0] * Weight_Buffer [2][0] + IFM_Buffer[2][1] * Weight_Buffer [2][1] + IFM_Buffer[2][2] * Weight_Buffer [2][2];

assign convolution[1] =    IFM_Buffer[0][1] * Weight_Buffer [0][0] + IFM_Buffer[0][2] * Weight_Buffer [0][1] + IFM_Buffer[0][3] * Weight_Buffer [0][2]
						  +IFM_Buffer[1][1] * Weight_Buffer [1][0] + IFM_Buffer[1][2] * Weight_Buffer [1][1] + IFM_Buffer[1][3] * Weight_Buffer [1][2]
						  +IFM_Buffer[2][1] * Weight_Buffer [2][0] + IFM_Buffer[2][2] * Weight_Buffer [2][1] + IFM_Buffer[2][3] * Weight_Buffer [2][2];

assign convolution[2] =    IFM_Buffer[0][2] * Weight_Buffer [0][0] + IFM_Buffer[0][3] * Weight_Buffer [0][1] + IFM_Buffer[0][4] * Weight_Buffer [0][2]
						  +IFM_Buffer[1][2] * Weight_Buffer [1][0] + IFM_Buffer[1][3] * Weight_Buffer [1][1] + IFM_Buffer[1][4] * Weight_Buffer [1][2]
						  +IFM_Buffer[2][2] * Weight_Buffer [2][0] + IFM_Buffer[2][3] * Weight_Buffer [2][1] + IFM_Buffer[2][4] * Weight_Buffer [2][2];

assign convolution[3] =    IFM_Buffer[0][3] * Weight_Buffer [0][0] + IFM_Buffer[0][4] * Weight_Buffer [0][1] + IFM_Buffer[0][5] * Weight_Buffer [0][2]
						  +IFM_Buffer[1][3] * Weight_Buffer [1][0] + IFM_Buffer[1][4] * Weight_Buffer [1][1] + IFM_Buffer[1][5] * Weight_Buffer [1][2]
						  +IFM_Buffer[2][3] * Weight_Buffer [2][0] + IFM_Buffer[2][4] * Weight_Buffer [2][1] + IFM_Buffer[2][5] * Weight_Buffer [2][2];						  

assign convolution[4] =    IFM_Buffer[0][4] * Weight_Buffer [0][0] + IFM_Buffer[0][5] * Weight_Buffer [0][1] + IFM_Buffer[0][6] * Weight_Buffer [0][2]
						  +IFM_Buffer[1][4] * Weight_Buffer [1][0] + IFM_Buffer[1][5] * Weight_Buffer [1][1] + IFM_Buffer[1][6] * Weight_Buffer [1][2]
						  +IFM_Buffer[2][4] * Weight_Buffer [2][0] + IFM_Buffer[2][5] * Weight_Buffer [2][1] + IFM_Buffer[2][6] * Weight_Buffer [2][2];

//-----------------------------------------------------------------------------------------------------------------------------------------

assign convolution[5] =    IFM_Buffer[1][0] * Weight_Buffer [0][0] + IFM_Buffer[1][1] * Weight_Buffer [0][1] + IFM_Buffer[1][2] * Weight_Buffer [0][2]
						  +IFM_Buffer[2][0] * Weight_Buffer [1][0] + IFM_Buffer[2][1] * Weight_Buffer [1][1] + IFM_Buffer[2][2] * Weight_Buffer [1][2]
						  +IFM_Buffer[3][0] * Weight_Buffer [2][0] + IFM_Buffer[3][1] * Weight_Buffer [2][1] + IFM_Buffer[3][2] * Weight_Buffer [2][2];

assign convolution[6] =    IFM_Buffer[1][1] * Weight_Buffer [0][0] + IFM_Buffer[1][2] * Weight_Buffer [0][1] + IFM_Buffer[1][3] * Weight_Buffer [0][2]
						  +IFM_Buffer[2][1] * Weight_Buffer [1][0] + IFM_Buffer[2][2] * Weight_Buffer [1][1] + IFM_Buffer[2][3] * Weight_Buffer [1][2]
						  +IFM_Buffer[3][1] * Weight_Buffer [2][0] + IFM_Buffer[3][2] * Weight_Buffer [2][1] + IFM_Buffer[3][3] * Weight_Buffer [2][2];

assign convolution[7] =    IFM_Buffer[1][2] * Weight_Buffer [0][0] + IFM_Buffer[1][3] * Weight_Buffer [0][1] + IFM_Buffer[1][4] * Weight_Buffer [0][2]
						  +IFM_Buffer[2][2] * Weight_Buffer [1][0] + IFM_Buffer[2][3] * Weight_Buffer [1][1] + IFM_Buffer[2][4] * Weight_Buffer [1][2]
						  +IFM_Buffer[3][2] * Weight_Buffer [2][0] + IFM_Buffer[3][3] * Weight_Buffer [2][1] + IFM_Buffer[3][4] * Weight_Buffer [2][2];

assign convolution[8] =    IFM_Buffer[1][3] * Weight_Buffer [0][0] + IFM_Buffer[1][4] * Weight_Buffer [0][1] + IFM_Buffer[1][5] * Weight_Buffer [0][2]
						  +IFM_Buffer[2][3] * Weight_Buffer [1][0] + IFM_Buffer[2][4] * Weight_Buffer [1][1] + IFM_Buffer[2][5] * Weight_Buffer [1][2]
						  +IFM_Buffer[3][3] * Weight_Buffer [2][0] + IFM_Buffer[3][4] * Weight_Buffer [2][1] + IFM_Buffer[3][5] * Weight_Buffer [2][2];						  

assign convolution[9] =    IFM_Buffer[1][4] * Weight_Buffer [0][0] + IFM_Buffer[1][5] * Weight_Buffer [0][1] + IFM_Buffer[1][6] * Weight_Buffer [0][2]
						  +IFM_Buffer[2][4] * Weight_Buffer [1][0] + IFM_Buffer[2][5] * Weight_Buffer [1][1] + IFM_Buffer[2][6] * Weight_Buffer [1][2]
						  +IFM_Buffer[3][4] * Weight_Buffer [2][0] + IFM_Buffer[3][5] * Weight_Buffer [2][1] + IFM_Buffer[3][6] * Weight_Buffer [2][2];

//-----------------------------------------------------------------------------------------------------------------------------------------

assign convolution[10] =   IFM_Buffer[2][0] * Weight_Buffer [0][0] + IFM_Buffer[2][1] * Weight_Buffer [0][1] + IFM_Buffer[2][2] * Weight_Buffer [0][2]
						  +IFM_Buffer[3][0] * Weight_Buffer [1][0] + IFM_Buffer[3][1] * Weight_Buffer [1][1] + IFM_Buffer[3][2] * Weight_Buffer [1][2]
						  +IFM_Buffer[4][0] * Weight_Buffer [2][0] + IFM_Buffer[4][1] * Weight_Buffer [2][1] + IFM_Buffer[4][2] * Weight_Buffer [2][2];

assign convolution[11] =   IFM_Buffer[2][1] * Weight_Buffer [0][0] + IFM_Buffer[2][2] * Weight_Buffer [0][1] + IFM_Buffer[2][3] * Weight_Buffer [0][2]
						  +IFM_Buffer[3][1] * Weight_Buffer [1][0] + IFM_Buffer[3][2] * Weight_Buffer [1][1] + IFM_Buffer[3][3] * Weight_Buffer [1][2]
						  +IFM_Buffer[4][1] * Weight_Buffer [2][0] + IFM_Buffer[4][2] * Weight_Buffer [2][1] + IFM_Buffer[4][3] * Weight_Buffer [2][2];

assign convolution[12] =   IFM_Buffer[2][2] * Weight_Buffer [0][0] + IFM_Buffer[2][3] * Weight_Buffer [0][1] + IFM_Buffer[2][4] * Weight_Buffer [0][2]
						  +IFM_Buffer[3][2] * Weight_Buffer [1][0] + IFM_Buffer[3][3] * Weight_Buffer [1][1] + IFM_Buffer[3][4] * Weight_Buffer [1][2]
						  +IFM_Buffer[4][2] * Weight_Buffer [2][0] + IFM_Buffer[4][3] * Weight_Buffer [2][1] + IFM_Buffer[4][4] * Weight_Buffer [2][2];

assign convolution[13] =   IFM_Buffer[2][3] * Weight_Buffer [0][0] + IFM_Buffer[2][4] * Weight_Buffer [0][1] + IFM_Buffer[2][5] * Weight_Buffer [0][2]
						  +IFM_Buffer[3][3] * Weight_Buffer [1][0] + IFM_Buffer[3][4] * Weight_Buffer [1][1] + IFM_Buffer[3][5] * Weight_Buffer [1][2]
						  +IFM_Buffer[4][3] * Weight_Buffer [2][0] + IFM_Buffer[4][4] * Weight_Buffer [2][1] + IFM_Buffer[4][5] * Weight_Buffer [2][2];						  

assign convolution[14] =   IFM_Buffer[2][4] * Weight_Buffer [0][0] + IFM_Buffer[2][5] * Weight_Buffer [0][1] + IFM_Buffer[2][6] * Weight_Buffer [0][2]
						  +IFM_Buffer[3][4] * Weight_Buffer [1][0] + IFM_Buffer[3][5] * Weight_Buffer [1][1] + IFM_Buffer[3][6] * Weight_Buffer [1][2]
						  +IFM_Buffer[4][4] * Weight_Buffer [2][0] + IFM_Buffer[4][5] * Weight_Buffer [2][1] + IFM_Buffer[4][6] * Weight_Buffer [2][2];

//-----------------------------------------------------------------------------------------------------------------------------------------

assign convolution[15] =   IFM_Buffer[3][0] * Weight_Buffer [0][0] + IFM_Buffer[3][1] * Weight_Buffer [0][1] + IFM_Buffer[3][2] * Weight_Buffer [0][2]
						  +IFM_Buffer[4][0] * Weight_Buffer [1][0] + IFM_Buffer[4][1] * Weight_Buffer [1][1] + IFM_Buffer[4][2] * Weight_Buffer [1][2]
						  +IFM_Buffer[5][0] * Weight_Buffer [2][0] + IFM_Buffer[5][1] * Weight_Buffer [2][1] + IFM_Buffer[5][2] * Weight_Buffer [2][2];

assign convolution[16] =   IFM_Buffer[3][1] * Weight_Buffer [0][0] + IFM_Buffer[3][2] * Weight_Buffer [0][1] + IFM_Buffer[3][3] * Weight_Buffer [0][2]
						  +IFM_Buffer[4][1] * Weight_Buffer [1][0] + IFM_Buffer[4][2] * Weight_Buffer [1][1] + IFM_Buffer[4][3] * Weight_Buffer [1][2]
						  +IFM_Buffer[5][1] * Weight_Buffer [2][0] + IFM_Buffer[5][2] * Weight_Buffer [2][1] + IFM_Buffer[5][3] * Weight_Buffer [2][2];

assign convolution[17] =   IFM_Buffer[3][2] * Weight_Buffer [0][0] + IFM_Buffer[3][3] * Weight_Buffer [0][1] + IFM_Buffer[3][4] * Weight_Buffer [0][2]
						  +IFM_Buffer[4][2] * Weight_Buffer [1][0] + IFM_Buffer[4][3] * Weight_Buffer [1][1] + IFM_Buffer[4][4] * Weight_Buffer [1][2]
						  +IFM_Buffer[5][2] * Weight_Buffer [2][0] + IFM_Buffer[5][3] * Weight_Buffer [2][1] + IFM_Buffer[5][4] * Weight_Buffer [2][2];

assign convolution[18] =   IFM_Buffer[3][3] * Weight_Buffer [0][0] + IFM_Buffer[3][4] * Weight_Buffer [0][1] + IFM_Buffer[3][5] * Weight_Buffer [0][2]
						  +IFM_Buffer[4][3] * Weight_Buffer [1][0] + IFM_Buffer[4][4] * Weight_Buffer [1][1] + IFM_Buffer[4][5] * Weight_Buffer [1][2]
						  +IFM_Buffer[5][3] * Weight_Buffer [2][0] + IFM_Buffer[5][4] * Weight_Buffer [2][1] + IFM_Buffer[5][5] * Weight_Buffer [2][2];						  

assign convolution[19] =   IFM_Buffer[3][4] * Weight_Buffer [0][0] + IFM_Buffer[3][5] * Weight_Buffer [0][1] + IFM_Buffer[3][6] * Weight_Buffer [0][2]
						  +IFM_Buffer[4][4] * Weight_Buffer [1][0] + IFM_Buffer[4][5] * Weight_Buffer [1][1] + IFM_Buffer[4][6] * Weight_Buffer [1][2]
						  +IFM_Buffer[5][4] * Weight_Buffer [2][0] + IFM_Buffer[5][5] * Weight_Buffer [2][1] + IFM_Buffer[5][6] * Weight_Buffer [2][2];

//-----------------------------------------------------------------------------------------------------------------------------------------

assign convolution[20] =   IFM_Buffer[4][0] * Weight_Buffer [0][0] + IFM_Buffer[4][1] * Weight_Buffer [0][1] + IFM_Buffer[4][2] * Weight_Buffer [0][2]
						  +IFM_Buffer[5][0] * Weight_Buffer [1][0] + IFM_Buffer[5][1] * Weight_Buffer [1][1] + IFM_Buffer[5][2] * Weight_Buffer [1][2]
						  +IFM_Buffer[6][0] * Weight_Buffer [2][0] + IFM_Buffer[6][1] * Weight_Buffer [2][1] + IFM_Buffer[6][2] * Weight_Buffer [2][2];

assign convolution[21] =   IFM_Buffer[4][1] * Weight_Buffer [0][0] + IFM_Buffer[4][2] * Weight_Buffer [0][1] + IFM_Buffer[4][3] * Weight_Buffer [0][2]
						  +IFM_Buffer[5][1] * Weight_Buffer [1][0] + IFM_Buffer[5][2] * Weight_Buffer [1][1] + IFM_Buffer[5][3] * Weight_Buffer [1][2]
						  +IFM_Buffer[6][1] * Weight_Buffer [2][0] + IFM_Buffer[6][2] * Weight_Buffer [2][1] + IFM_Buffer[6][3] * Weight_Buffer [2][2];

assign convolution[22] =   IFM_Buffer[4][2] * Weight_Buffer [0][0] + IFM_Buffer[4][3] * Weight_Buffer [0][1] + IFM_Buffer[4][4] * Weight_Buffer [0][2]
						  +IFM_Buffer[5][2] * Weight_Buffer [1][0] + IFM_Buffer[5][3] * Weight_Buffer [1][1] + IFM_Buffer[5][4] * Weight_Buffer [1][2]
						  +IFM_Buffer[6][2] * Weight_Buffer [2][0] + IFM_Buffer[6][3] * Weight_Buffer [2][1] + IFM_Buffer[6][4] * Weight_Buffer [2][2];

assign convolution[23] =   IFM_Buffer[4][3] * Weight_Buffer [0][0] + IFM_Buffer[4][4] * Weight_Buffer [0][1] + IFM_Buffer[4][5] * Weight_Buffer [0][2]
						  +IFM_Buffer[5][3] * Weight_Buffer [1][0] + IFM_Buffer[5][4] * Weight_Buffer [1][1] + IFM_Buffer[5][5] * Weight_Buffer [1][2]
						  +IFM_Buffer[6][3] * Weight_Buffer [2][0] + IFM_Buffer[6][4] * Weight_Buffer [2][1] + IFM_Buffer[6][5] * Weight_Buffer [2][2];						  

assign convolution[24] =   IFM_Buffer[4][4] * Weight_Buffer [0][0] + IFM_Buffer[4][5] * Weight_Buffer [0][1] + IFM_Buffer[4][6] * Weight_Buffer [0][2]
						  +IFM_Buffer[5][4] * Weight_Buffer [1][0] + IFM_Buffer[5][5] * Weight_Buffer [1][1] + IFM_Buffer[5][6] * Weight_Buffer [1][2]
						  +IFM_Buffer[6][4] * Weight_Buffer [2][0] + IFM_Buffer[6][5] * Weight_Buffer [2][1] + IFM_Buffer[6][6] * Weight_Buffer [2][2];

//-----------------------------------------------------------------------------------------------------------------------------------------

always@(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		cnt_standby <= 0;
	end
	else if(STATE == STANDBY) cnt_standby <= cnt_standby + 1;
	else if(NEXT == ZERO) cnt_standby <= 0;
	else cnt_standby <= cnt_standby;
end

always@(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		cnt_out <= 0;
	end
	else if(STATE == OUT) cnt_out <= cnt_out + 1;
	else cnt_out <= 0;
end

always@(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		out_valid <= 0;
	end
	else if (STATE == OUT) out_valid <= 1;
	else out_valid <= 0;
end

always@(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		Out_OFM <= 0;
	end
	else if (STATE == OUT) Out_OFM <= convolution[cnt_out];
	else Out_OFM <= 0;
end



///////////////////////////////////////////////////////





endmodule