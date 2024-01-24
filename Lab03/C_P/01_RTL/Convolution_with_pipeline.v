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

wire [7:0] index_conv;

reg [5:0] cnt , cnt_out , cnt_standby , cnt_pip;
reg [5:0] cnt_row , cnt_col;
reg [5:0] cnt_row_comp , cnt_col_comp;
reg [5:0] cnt_row_weight , cnt_col_weight;

reg [5:0] STATE , NEXT;

parameter ZERO = 'd0;
parameter STORE = 'd1;
parameter STANDBY = 'd2;
parameter PIP = 'd3;
parameter OUT = 'd4;

wire [32:0] convolution [0:8];
reg [32:0] result [0:8][0:24];

wire [35:0] add_result;
reg [35:0] add_reg [0:24];

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
			if(cnt_standby == 30) NEXT = PIP;
            else NEXT = STANDBY;
        end

		PIP:begin
			if(cnt_pip == 30) NEXT = OUT;
			else NEXT = PIP;
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

always@(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		cnt_col_comp <= 0;
	end
	else if(cnt_col_comp == 4)
		cnt_col_comp <= 0;
	else if(STATE == STANDBY)
		cnt_col_comp <= cnt_col_comp + 1;
	else 
		cnt_col_comp <= 0;
end

always@(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		cnt_row_comp <= 0;
	end
	else if(cnt_row_comp == 4 && cnt_col_comp == 4 )
		cnt_row_comp <= cnt_row_comp;
	else if(cnt_col_comp == 4)
		cnt_row_comp <= cnt_row_comp + 1;
	else if(STATE == ZERO)
		cnt_row_comp <= 0;
	else 
		cnt_row_comp <= cnt_row_comp;
end


//-----------------------------------------------------------------------------------------------------------------------------------------

assign convolution [0] = IFM_Buffer[cnt_row_comp 	][cnt_col_comp] * Weight_Buffer [0][0] ;

assign convolution [1] = IFM_Buffer[cnt_row_comp 	][cnt_col_comp + 1] * Weight_Buffer [0][1];

assign convolution [2] = IFM_Buffer[cnt_row_comp 	][cnt_col_comp + 2] * Weight_Buffer [0][2];

assign convolution [3] = IFM_Buffer[cnt_row_comp + 1][cnt_col_comp] * Weight_Buffer [1][0] ;

assign convolution [4] = IFM_Buffer[cnt_row_comp + 1][cnt_col_comp + 1] * Weight_Buffer [1][1];

assign convolution [5] = IFM_Buffer[cnt_row_comp + 1][cnt_col_comp + 2] * Weight_Buffer [1][2];

assign convolution [6] = IFM_Buffer[cnt_row_comp + 2][cnt_col_comp] * Weight_Buffer [2][0] ;

assign convolution [7] = IFM_Buffer[cnt_row_comp + 2][cnt_col_comp + 1] * Weight_Buffer [2][1];

assign convolution [8] = IFM_Buffer[cnt_row_comp + 2][cnt_col_comp + 2] * Weight_Buffer [2][2];
//-----------------------------------------------------------------------------------------------------------------------------------------

assign index_conv = 5 * cnt_row_comp + cnt_col_comp;

always@(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		for (i = 0; i < 9; i = i + 1) begin 
			for (j = 0; j < 25; j = j + 1) begin 
				result[i][j] <= 0;
			end
		end
	end
	else if (STATE == STANDBY) begin 
		result[0][index_conv] <= convolution [0];
		result[1][index_conv] <= convolution [1];
		result[2][index_conv] <= convolution [2];
		result[3][index_conv] <= convolution [3];
		result[4][index_conv] <= convolution [4];
		result[5][index_conv] <= convolution [5];
		result[6][index_conv] <= convolution [6];
		result[7][index_conv] <= convolution [7];
		result[8][index_conv] <= convolution [8];
	end
	else if (STATE == ZERO) begin
		for (i = 0; i < 9; i = i + 1) begin 
			for (j = 0; j < 25; j = j + 1) begin 
				result[i][j] <= 0;
			end
		end
	end
	else begin
		for (i = 0; i < 9; i = i + 1) begin 
			for (j = 0; j < 25; j = j + 1) begin 
				result[i][j] <= result[i][j];
			end
		end
	end
end

assign add_result = result[0][cnt_pip] + result[1][cnt_pip] + result[2][cnt_pip] + result[3][cnt_pip] + result[4][cnt_pip] + result[5][cnt_pip] + result[6][cnt_pip] + result[7][cnt_pip] + result[8][cnt_pip];

always@(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		cnt_pip <= 0;
	end
	else if(STATE == PIP) cnt_pip <= cnt_pip + 1;
	else if(NEXT == ZERO) cnt_pip <= 0;
	else cnt_pip <= cnt_pip;
end

always@(posedge clk or negedge rst_n) begin
	if(!rst_n) begin 
		for (j = 0; j < 25; j = j + 1) begin 
			add_reg[j] <= 0;
		end
	end
	else if (STATE == PIP) begin 
		add_reg [cnt_pip] <= add_result;
	end
	else if (STATE == ZERO) begin
		for (j = 0; j < 25; j = j + 1) begin 
			add_reg[j] <= 0;
		end
	end
	else begin
		for (j = 0; j < 25; j = j + 1) begin 
			add_reg[j] <= add_reg[j];
		end
	end
end

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
	else if (STATE == OUT) Out_OFM <= add_reg[cnt_out];
	else Out_OFM <= 0;
end



///////////////////////////////////////////////////////





endmodule