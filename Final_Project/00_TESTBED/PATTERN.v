//==============================================
//==============================================					
//												
//	File Name		:	PATTERN_Conv.v					
//	Module Name		:	PATTERN_Conv						
//	Release version	:	v1.0				
//												
//==============================================
//==============================================
`define clk_PERIOD 2//# the unit of the clk_PERIOD  in here is ns 
`define End_CYCLE 10000
module PATTERN	(
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

//------------------------------
//	I/O Pors
//------------------------------
input       out_valid;
input [12:0]Out_OFM;

output reg rst_n;
output reg clk;
output reg in_valid;
output reg weight_valid;
output reg [3:0] In_IFM_1 ;
output reg [3:0] In_IFM_2 ;
output reg [3:0] In_IFM_3 ;
output reg [3:0] In_IFM_4 ;
output reg [3:0] In_IFM_5 ;
output reg [3:0] In_IFM_6 ;
output reg [3:0] In_IFM_7 ;
output reg [3:0] In_IFM_8 ;	
output reg [3:0] In_IFM_9 ;
output reg [3:0]In_IFM_10 ;
output reg [3:0]In_IFM_11 ;
output reg [3:0]In_IFM_12 ;
output reg [3:0]In_IFM_13 ;
output reg [3:0]In_IFM_14 ;
output reg [3:0]In_IFM_15 ;
output reg [3:0]In_IFM_16 ;
output reg [3:0]In_IFM_17 ;	
output reg [3:0]In_IFM_18 ;
output reg [3:0]In_IFM_19 ;
output reg [3:0]In_IFM_20 ;
output reg [3:0]In_IFM_21 ;
output reg [3:0]In_IFM_22 ;
output reg [3:0]In_IFM_23 ;
output reg [3:0]In_IFM_24 ;
output reg [3:0]In_IFM_25 ;
output reg [3:0]In_IFM_26 ;	
output reg [3:0]In_IFM_27 ;
output reg [3:0]In_IFM_28 ;
output reg [3:0]In_IFM_29 ;
output reg [3:0]In_IFM_30 ;
output reg [3:0]In_IFM_31 ;	
output reg [3:0]In_IFM_32 ;

output reg [3:0] In_Weight_1 ;
output reg [3:0] In_Weight_2 ;
output reg [3:0] In_Weight_3 ;
output reg [3:0] In_Weight_4 ;
output reg [3:0] In_Weight_5 ;
output reg [3:0] In_Weight_6 ;
output reg [3:0] In_Weight_7 ;
output reg [3:0] In_Weight_8 ;	
output reg [3:0] In_Weight_9 ;
output reg [3:0]In_Weight_10 ;
output reg [3:0]In_Weight_11 ;
output reg [3:0]In_Weight_12 ;
output reg [3:0]In_Weight_13 ;
output reg [3:0]In_Weight_14 ;
output reg [3:0]In_Weight_15 ;
output reg [3:0]In_Weight_16 ;
output reg [3:0]In_Weight_17 ;	
output reg [3:0]In_Weight_18 ;
output reg [3:0]In_Weight_19 ;
output reg [3:0]In_Weight_20 ;
output reg [3:0]In_Weight_21 ;
output reg [3:0]In_Weight_22 ;
output reg [3:0]In_Weight_23 ;
output reg [3:0]In_Weight_24 ;
output reg [3:0]In_Weight_25 ;
output reg [3:0]In_Weight_26 ;	
output reg [3:0]In_Weight_27 ;
output reg [3:0]In_Weight_28 ;
output reg [3:0]In_Weight_29 ;
output reg [3:0]In_Weight_30 ;
output reg [3:0]In_Weight_31 ;	
output reg [3:0]In_Weight_32 ;
//------------------------------
//	Parameter & Integer
//------------------------------
real	CYCLE = `clk_PERIOD;
parameter Delay = 2.5;
parameter Pattern_num = 50;


integer seed = 2177;
integer j , m;
integer i;
integer k;
integer l;
integer pat;
integer input_In;
integer input_Weight;
integer input_Out;
integer ans_count;
integer ans_row, ans_col;
integer sparse;
//------------------------------
//	Register
//------------------------------
reg [3:0] Pattern_ifm [1:32][0:49];
reg [3:0] Pattern_weight [1:32];
reg [12:0] Pattern_ofm [0:49];


reg [12:0] Golden_OFM;

reg [30:0]latency;
reg [30:0]total_latency;
reg [30:0]in_lat;



//------------------------------
//	Clock
//------------------------------
initial clk = 0;
always #(CYCLE/2) clk = ~clk;

//------------------------------
//	Initial
//------------------------------
initial begin
	reset_task;
	@(negedge clk);
	get_input_In;
	@(negedge clk);
	get_input_Weight;
	@(negedge clk);
	get_input_Out;
	@(negedge clk);
	ans_count = 0;
	for(pat = 0; pat < Pattern_num; pat = pat + 1) begin
		//repeat($urandom_range(1,2)) @(negedge clk);
		//@(negedge clk);
		//#(CYCLE/2 + CYCLE/4)
			
		if(pat == 0) begin
			weight_valid = 1;
			In_Weight_1 =   Pattern_weight[1];
			In_Weight_2 =   Pattern_weight[2];
			In_Weight_3 =   Pattern_weight[3];
			In_Weight_4 =   Pattern_weight[4];
			In_Weight_5 =   Pattern_weight[5];
			In_Weight_6 =   Pattern_weight[6];
			In_Weight_7 =   Pattern_weight[7];
			In_Weight_8 =   Pattern_weight[8];
			In_Weight_9 =   Pattern_weight[9];
			In_Weight_10 = Pattern_weight[10];
			In_Weight_11 = Pattern_weight[11];
			In_Weight_12 = Pattern_weight[12];
			In_Weight_13 = Pattern_weight[13];
			In_Weight_14 = Pattern_weight[14];
			In_Weight_15 = Pattern_weight[15];
			In_Weight_16 = Pattern_weight[16];
			In_Weight_17 = Pattern_weight[17];
			In_Weight_18 = Pattern_weight[18];
			In_Weight_19 = Pattern_weight[19];
			In_Weight_20 = Pattern_weight[20];
			In_Weight_21 = Pattern_weight[21];
			In_Weight_22 = Pattern_weight[22];
			In_Weight_23 = Pattern_weight[23];
			In_Weight_24 = Pattern_weight[24];
			In_Weight_25 = Pattern_weight[25];
			In_Weight_26 = Pattern_weight[26];
			In_Weight_27 = Pattern_weight[27];
			In_Weight_28 = Pattern_weight[28];
			In_Weight_29 = Pattern_weight[29];
			In_Weight_30 = Pattern_weight[30];
			In_Weight_31 = Pattern_weight[31];
			In_Weight_32 = Pattern_weight[32];
		end
		else begin
			weight_valid = 0;
			In_Weight_1 =  'dx;
			In_Weight_2 =  'dx;
			In_Weight_3 =  'dx;
			In_Weight_4 =  'dx;
			In_Weight_5 =  'dx;
			In_Weight_6 =  'dx;
			In_Weight_7 =  'dx;
			In_Weight_8 =  'dx;
			In_Weight_9 =  'dx;
			In_Weight_10 = 'dx;
			In_Weight_11 = 'dx;
			In_Weight_12 = 'dx;
			In_Weight_13 = 'dx;
			In_Weight_14 = 'dx;
			In_Weight_15 = 'dx;
			In_Weight_16 = 'dx;
			In_Weight_17 = 'dx;
			In_Weight_18 = 'dx;
			In_Weight_19 = 'dx;
			In_Weight_20 = 'dx;
			In_Weight_21 = 'dx;
			In_Weight_22 = 'dx;
			In_Weight_23 = 'dx;
			In_Weight_24 = 'dx;
			In_Weight_25 = 'dx;
			In_Weight_26 = 'dx;
			In_Weight_27 = 'dx;
			In_Weight_28 = 'dx;
			In_Weight_29 = 'dx;
			In_Weight_30 = 'dx;
			In_Weight_31 = 'dx;
			In_Weight_32 = 'dx;
		end
		in_valid = 1;
		In_IFM_1 = 	 Pattern_ifm[1][pat];
		In_IFM_2 = 	 Pattern_ifm[2][pat];
		In_IFM_3 = 	 Pattern_ifm[3][pat];
		In_IFM_4 = 	 Pattern_ifm[4][pat];
		In_IFM_5 = 	 Pattern_ifm[5][pat];
		In_IFM_6 = 	 Pattern_ifm[6][pat];
		In_IFM_7 = 	 Pattern_ifm[7][pat];
		In_IFM_8 = 	 Pattern_ifm[8][pat];
		In_IFM_9 = 	 Pattern_ifm[9][pat];
		In_IFM_10 = Pattern_ifm[10][pat];
		In_IFM_11 = Pattern_ifm[11][pat];
		In_IFM_12 = Pattern_ifm[12][pat];
		In_IFM_13 = Pattern_ifm[13][pat];
		In_IFM_14 = Pattern_ifm[14][pat];
		In_IFM_15 = Pattern_ifm[15][pat];
		In_IFM_16 = Pattern_ifm[16][pat];
		In_IFM_17 = Pattern_ifm[17][pat];
		In_IFM_18 = Pattern_ifm[18][pat];
		In_IFM_19 = Pattern_ifm[19][pat];
		In_IFM_20 = Pattern_ifm[20][pat];
		In_IFM_21 = Pattern_ifm[21][pat];
		In_IFM_22 = Pattern_ifm[22][pat];
		In_IFM_23 = Pattern_ifm[23][pat];
		In_IFM_24 = Pattern_ifm[24][pat];
		In_IFM_25 = Pattern_ifm[25][pat];
		In_IFM_26 = Pattern_ifm[26][pat];
		In_IFM_27 = Pattern_ifm[27][pat];
		In_IFM_28 = Pattern_ifm[28][pat];
		In_IFM_29 = Pattern_ifm[29][pat];
		In_IFM_30 = Pattern_ifm[30][pat];
		In_IFM_31 = Pattern_ifm[31][pat];
		In_IFM_32 = Pattern_ifm[32][pat];
		
		@(negedge clk);
		//#(CYCLE)
		
		in_valid = 0;
		weight_valid = 0;
		In_IFM_1 = 	'dx;
		In_IFM_2 = 	'dx;
		In_IFM_3 = 	'dx;
		In_IFM_4 = 	'dx;
		In_IFM_5 = 	'dx;
		In_IFM_6 = 	'dx;
		In_IFM_7 = 	'dx;
		In_IFM_8 = 	'dx;
		In_IFM_9 = 	'dx;
		In_IFM_10 = 'dx;
		In_IFM_11 = 'dx;
		In_IFM_12 = 'dx;
		In_IFM_13 = 'dx;
		In_IFM_14 = 'dx;
		In_IFM_15 = 'dx;
		In_IFM_16 = 'dx;
		In_IFM_17 = 'dx;
		In_IFM_18 = 'dx;
		In_IFM_19 = 'dx;
		In_IFM_20 = 'dx;
		In_IFM_21 = 'dx;
		In_IFM_22 = 'dx;
		In_IFM_23 = 'dx;
		In_IFM_24 = 'dx;
		In_IFM_25 = 'dx;
		In_IFM_26 = 'dx;
		In_IFM_27 = 'dx;
		In_IFM_28 = 'dx;
		In_IFM_29 = 'dx;
		In_IFM_30 = 'dx;
		In_IFM_31 = 'dx;
		In_IFM_32 = 'dx;

		In_Weight_1 =  'dx;
		In_Weight_2 =  'dx;
		In_Weight_3 =  'dx;
		In_Weight_4 =  'dx;
		In_Weight_5 =  'dx;
		In_Weight_6 =  'dx;
		In_Weight_7 =  'dx;
		In_Weight_8 =  'dx;
		In_Weight_9 =  'dx;
		In_Weight_10 = 'dx;
		In_Weight_11 = 'dx;
		In_Weight_12 = 'dx;
		In_Weight_13 = 'dx;
		In_Weight_14 = 'dx;
		In_Weight_15 = 'dx;
		In_Weight_16 = 'dx;
		In_Weight_17 = 'dx;
		In_Weight_18 = 'dx;
		In_Weight_19 = 'dx;
		In_Weight_20 = 'dx;
		In_Weight_21 = 'dx;
		In_Weight_22 = 'dx;
		In_Weight_23 = 'dx;
		In_Weight_24 = 'dx;
		In_Weight_25 = 'dx;
		In_Weight_26 = 'dx;
		In_Weight_27 = 'dx;
		In_Weight_28 = 'dx;
		In_Weight_29 = 'dx;
		In_Weight_30 = 'dx;
		In_Weight_31 = 'dx;
		In_Weight_32 = 'dx;
	end
	repeat(10)@(negedge clk);
	PASS;
end


task reset_task; begin
	force clk = 0;
	rst_n = 1;
	in_valid = 0;
	weight_valid = 0;
	latency = 'd0;
	total_latency = 'd0;
	in_lat = 'd0;
	In_IFM_1 = 'd0;
	In_IFM_2 = 'd0;
	In_IFM_3 = 'd0;
	In_IFM_4 = 'd0;
	In_IFM_5 = 'd0;
	In_IFM_6 = 'd0;
	In_IFM_7 = 'd0;
	In_IFM_8 = 'd0;
	In_IFM_9 = 'd0;
	In_IFM_10 = 'd0;
	In_IFM_11 = 'd0;
	In_IFM_12 = 'd0;
	In_IFM_13 = 'd0;
	In_IFM_14 = 'd0;
	In_IFM_15 = 'd0;
	In_IFM_16 = 'd0;
	In_IFM_17 = 'd0;
	In_IFM_18 = 'd0;
	In_IFM_19 = 'd0;
	In_IFM_20 = 'd0;
	In_IFM_21 = 'd0;
	In_IFM_22 = 'd0;
	In_IFM_23 = 'd0;
	In_IFM_24 = 'd0;
	In_IFM_25 = 'd0;
	In_IFM_26 = 'd0;
	In_IFM_27 = 'd0;
	In_IFM_28 = 'd0;
	In_IFM_29 = 'd0;
	In_IFM_30 = 'd0;
	In_IFM_31 = 'd0;
	In_IFM_32 = 'd0;

	
	In_Weight_1 = 'd0;
	In_Weight_2 = 'd0;
	In_Weight_3 = 'd0;
	In_Weight_4 = 'd0;
	In_Weight_5 = 'd0;
	In_Weight_6 = 'd0;
	In_Weight_7 = 'd0;
	In_Weight_8 = 'd0;
	In_Weight_9 = 'd0;
	In_Weight_10 = 'd0;
	In_Weight_11 = 'd0;
	In_Weight_12 = 'd0;
	In_Weight_13 = 'd0;
	In_Weight_14 = 'd0;
	In_Weight_15 = 'd0;
	In_Weight_16 = 'd0;
	In_Weight_17 = 'd0;
	In_Weight_18 = 'd0;
	In_Weight_19 = 'd0;
	In_Weight_20 = 'd0;
	In_Weight_21 = 'd0;
	In_Weight_22 = 'd0;
	In_Weight_23 = 'd0;
	In_Weight_24 = 'd0;
	In_Weight_25 = 'd0;
	In_Weight_26 = 'd0;
	In_Weight_27 = 'd0;
	In_Weight_28 = 'd0;
	In_Weight_29 = 'd0;
	In_Weight_30 = 'd0;
	In_Weight_31 = 'd0;
	In_Weight_32 = 'd0;

	for(j = 0; j < 50; j = j + 1)begin
		for(m = 1; m < 33; m = m + 1)begin
			Pattern_ifm[m][j] = 0;
		end
	end

	for(m = 1; m < 33; m = m + 1)begin
		Pattern_weight[m] = 0;
	end

	for(j = 0; j < 50; j = j + 1)begin
		Pattern_ofm[j] = 0;
	end
	
	#(CYCLE*10) rst_n = 0;
    #(CYCLE*10) rst_n = 1;
	
	if (Out_OFM!==0) begin
        $display("                                                                                                     ");
        $display("                                                                                                     ");
        $display("                                _ .___.-''.-=-.                                                      ");
        $display("                    __.-- _ _.-'_)_  (''`'-._\\ `.                                                   ");
        $display("                 _.'  __ |.' .-' __)  .-     /. |                                                    ");
        $display("               .'_.--'   |     -'  _)/         `\\                                                   ");
        $display("             .'.'      .'       .-'_.`           :                                                   ");
        $display("             .'     .-'       .(.-(              :                                                   ");
        $display("                  .'       .-' .    _            ;                                                   ");
        $display("                 /        .-._/`---'            /                                                    ");
        $display("                /        (____)(----. )       .'                                                     ");
        $display("               /         (      `.__.     / \\ /.           Output signals should be 0               ");
        $display("              :           ;-.___         /__ \\/|                                                    ");
        $display("              |         .'      `--.      -. \\ |           after the reset singal is asserted ......");
        $display("              :        /            \\    .__/                                                       ");
        $display("               \\      (__            \\    |_               at %4d ps                               ", $time*1000);
        $display("                \\       .`-. *       /   _|.\                                                       ");
        $display("                 \\    .'   `-.     .'_.-'   \\                                                      ");
        $display("                (_\\.-'    .'\')--.'-'       __\\                                                    ");
        $display("                 \\       /  // .'|      .--'  `-.                                                   ");
        $display("                  `-.    `-/ \\'  |   _.'         `.                                                 ");
        $display("                     `-._ /      `--'/             \\                                                ");
        $display("                        .'           |              \\                                               ");
        $display("                       /             |               \\                                              ");
        $display("                    .-'              |               /                                               ");
        $display("                   /                 |             -'                                                ");
        $display("                                                                                                     ");
        $display("                                                                                                     ");
        repeat(5) #(CYCLE);
        $finish;
    end

    #(CYCLE/2.0) release clk;
end
endtask

initial begin
	#(`clk_PERIOD * `End_CYCLE);
	$display("-----------------------------------------------------");
	$display("Error!!! Somethings' wrong with your code ...!!");
	$display("Cycle = %d " , `End_CYCLE);
	$display("-------------------------FAIL------------------------");
	$display("-----------------------------------------------------");
	$finish;
end

always@(negedge clk) begin
	if(out_valid) begin
		Golden_OFM = Pattern_ofm[ans_count];
		if(Golden_OFM !== Out_OFM) begin
			$display("Your: %d, Golden: %d", Out_OFM, Golden_OFM);
			fail;
		end
		ans_count = ans_count + 1;
	end
end

always@(negedge clk) begin
	if(out_valid) begin
		latency = latency + 1;
	end
	if(in_valid && !out_valid)begin
		in_lat = in_lat + 1;
	end
	total_latency = latency + in_lat;
end


always@(negedge out_valid) begin
	if(ans_count >= 51) begin
		$display("-----------------------------------------------------");
		$display("Error!!! out_valid cycle is more than 50...!!");
		$display("-------------------------FAIL------------------------");
		$display("-----------------------------------------------------");
		$finish;
	end
end



integer row_in , col_in;
task get_input_In;begin
	input_In = $fopen("input_In.txt" , "r");
	@(negedge clk);
	for(row_in = 1; row_in < 33; row_in = row_in + 1) begin
		for(col_in = 0; col_in < 50; col_in = col_in + 1)begin
			$fscanf(input_In , "%d" , Pattern_ifm[row_in][col_in]);
			//$display(Pattern_ifm[row_in][col_in]);
		end
	end
	$fclose(input_In);
end endtask

integer col_weight;
task get_input_Weight;begin
	input_Weight = $fopen("input_weight.txt" , "r");
	@(negedge clk);
	for(col_weight = 1; col_weight < 33; col_weight = col_weight + 1)begin
		$fscanf(input_Weight , "%d" , Pattern_weight[col_weight]);
		//$display( Pattern_weight[col_weight]);
	end
	$fclose(input_Weight);
end endtask

integer col_out;
task get_input_Out;begin
	input_Out = $fopen("output.txt" , "r");
	@(negedge clk);
	for(col_out = 0; col_out < 50; col_out = col_out + 1)begin
		$fscanf(input_Out , "%d" , Pattern_ofm[col_out]);
		//$display(Pattern_ofm[col_out]);
	end
	$fclose(input_Out);
end endtask

task PASS;begin
$display("\033[37m                                                                                                                                          ");        
$display("\033[37m                                                                                \033[32m      :BBQvi.                                              ");        
$display("\033[37m                                                              .i7ssrvs7         \033[32m     BBBBBBBBQi                                           ");        
$display("\033[37m                        .:r7rrrr:::.        .::::::...   .i7vr:.      .B:       \033[32m    :BBBP :7BBBB.                                         ");        
$display("\033[37m                      .Kv.........:rrvYr7v7rr:.....:rrirJr.   .rgBBBBg  Bi      \033[32m    BBBB     BBBB                                         ");        
$display("\033[37m                     7Q  :rubEPUri:.       ..:irrii:..    :bBBBBBBBBBBB  B      \033[32m   iBBBv     BBBB       vBr                               ");        
$display("\033[37m                    7B  BBBBBBBBBBBBBBB::BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB :R     \033[32m   BBBBBKrirBBBB.     :BBBBBB:                            ");        
$display("\033[37m                   Jd .BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB: Bi    \033[32m  rBBBBBBBBBBBR.    .BBBM:BBB                             ");        
$display("\033[37m                  uZ .BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB .B    \033[32m  BBBB   .::.      EBBBi :BBU                             ");        
$display("\033[37m                 7B .BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB  B    \033[32m MBBBr           vBBBu   BBB.                             ");        
$display("\033[37m                .B  BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB: JJ   \033[32m i7PB          iBBBBB.  iBBB                              ");        
$display("\033[37m                B. BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB  Lu             \033[32m  vBBBBPBBBBPBBB7       .7QBB5i                ");        
$display("\033[37m               Y1 KBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBi XBBBBBBBi :B            \033[32m :RBBB.  .rBBBBB.      rBBBBBBBB7              ");        
$display("\033[37m              :B .BBBBBBBBBBBBBsRBBBBBBBBBBBrQBBBBB. UBBBRrBBBBBBr 1BBBBBBBBB  B.          \033[32m    .       BBBB       BBBB  :BBBB             ");        
$display("\033[37m              Bi BBBBBBBBBBBBBi :BBBBBBBBBBE .BBK.  .  .   QBBBBBBBBBBBBBBBBBB  Bi         \033[32m           rBBBr       BBBB    BBBU            ");        
$display("\033[37m             .B .BBBBBBBBBBBBBBQBBBBBBBBBBBB       \033[38;2;242;172;172mBBv \033[37m.LBBBBBBBBBBBBBBBBBBBBBB. B7.:ii:   \033[32m           vBBB        .BBBB   :7i.            ");        
$display("\033[37m            .B  PBBBBBBBBBBBBBBBBBBBBBBBBBBBBbYQB. \033[38;2;242;172;172mBB: \033[37mBBBBBBBBBBBBBBBBBBBBBBBBB  Jr:::rK7 \033[32m             .7  BBB7   iBBBg                  ");        
$display("\033[37m           7M  PBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB  \033[38;2;242;172;172mBB. \033[37mBBBBBBBBBBBBBBBBBBBBBBB..i   .   v1                  \033[32mdBBB.   5BBBr                 ");        
$display("\033[37m          sZ .BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB  \033[38;2;242;172;172mBB. \033[37mBBBBBBBBBBBBBBBBBBBBBBBBBBB iD2BBQL.                 \033[32m ZBBBr  EBBBv     YBBBBQi     ");        
$display("\033[37m  .7YYUSIX5 .BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB  \033[38;2;242;172;172mBB. \033[37mBBBBBBBBBBBBBBBBBBBBBBBBY.:.      :B                 \033[32m  iBBBBBBBBD     BBBBBBBBB.   ");        
$display("\033[37m LB.        ..BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB. \033[38;2;242;172;172mBB: \033[37mBBBBBBBBBBBBBBBBBBBBBBBBMBBB. BP17si                 \033[32m    :LBBBr      vBBBi  5BBB   ");        
$display("\033[37m  KvJPBBB :BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB: \033[38;2;242;172;172mZB: \033[37mBBBBBBBBBBBBBBBBBBBBBBBBBsiJr .i7ssr:                \033[32m          ...   :BBB:   BBBu  ");        
$display("\033[37m i7ii:.   ::BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBj \033[38;2;242;172;172muBi \033[37mQBBBBBBBBBBBBBBBBBBBBBBBBi.ir      iB                \033[32m         .BBBi   BBBB   iMBu  ");        
$display("\033[37mDB    .  vBdBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBg \033[38;2;242;172;172m7Bi \033[37mBBBBBBBBBBBBBBBBBBBBBBBBBBBBB rBrXPv.                \033[32m          BBBX   :BBBr        ");        
$display("\033[37m :vQBBB. BQBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBQ \033[38;2;242;172;172miB: \033[37mBBBBBBBBBBBBBBBBBBBBBBBBBBBBB .L:ii::irrrrrrrr7jIr   \033[32m          .BBBv  :BBBQ        ");        
$display("\033[37m :7:.   .. 5BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB  \033[38;2;242;172;172mBr \033[37mBBBBBBBBBBBBBBBBBBBBBBBBBBBB:            ..... ..YB. \033[32m           .BBBBBBBBB:        ");        
$display("\033[37mBU  .:. BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB  \033[38;2;242;172;172mB7 \033[37mgBBBBBBBBBBBBBBBBBBBBBBBBBB. gBBBBBBBBBBBBBBBBBB. BL \033[32m             rBBBBB1.         ");        
$display("\033[37m rY7iB: BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB: \033[38;2;242;172;172mB7 \033[37mBBBBBBBBBBBBBBBBBBBBBBBBBB. QBBBBBBBBBBBBBBBBBi  v5                                ");        
$display("\033[37m     us EBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB \033[38;2;242;172;172mIr \033[37mBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBgu7i.:BBBBBBBr Bu                                 ");        
$display("\033[37m      B  7BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB.\033[38;2;242;172;172m:i \033[37mBBBBBBBBBBBBBBBBBBBBBBBBBBBv:.  .. :::  .rr    rB                                  ");        
$display("\033[37m      us  .BBBBBBBBBBBBBQLXBBBBBBBBBBBBBBBBBBBBBBBBq  .BBBBBBBBBBBBBBBBBBBBBBBBBv  :iJ7vri:::1Jr..isJYr                                   ");        
$display("\033[37m      B  BBBBBBB  MBBBM      qBBBBBBBBBBBBBBBBBBBBBB: BBBBBBBBBBBBBBBBBBBBBBBBBB  B:           iir:                                       ");        
$display("\033[37m     iB iBBBBBBBL       BBBP. :BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB  B.                                                       ");        
$display("\033[37m     P: BBBBBBBBBBB5v7gBBBBBB  BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB: Br                                                        ");        
$display("\033[37m     B  BBBs 7BBBBBBBBBBBBBB7 :BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB .B                                                         ");        
$display("\033[37m    .B :BBBB.  EBBBBBQBBBBBJ .BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB. B.                                                         ");        
$display("\033[37m    ij qBBBBBg          ..  .BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB .B                                                          ");        
$display("\033[37m    UY QBBBBBBBBSUSPDQL...iBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBK EL                                                          ");        
$display("\033[37m    B7 BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB: B:                                                          ");        
$display("\033[37m    B  BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBYrBB vBBBBBBBBBBBBBBBBBBBBBBBB. Ls                                                          ");        
$display("\033[37m    B  BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBi_  /UBBBBBBBBBBBBBBBBBBBBBBBBB. :B:                                                        ");        
$display("\033[37m   rM .BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB  ..IBBBBBBBBBBBBBBBBQBBBBBBBBBB  B                                                        ");        
$display("\033[37m   B  BBBBBBBBBdZBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBPBBBBBBBBBBBBEji:..     sBBBBBBBr Br                                                       ");        
$display("\033[37m  7B 7BBBBBBBr     .:vXQBBBBBBBBBBBBBBBBBBBBBBBBBQqui::..  ...i:i7777vi  BBBBBBr Bi                                                       ");        
$display("\033[37m  Ki BBBBBBB  rY7vr:i....  .............:.....  ...:rii7vrr7r:..      7B  BBBBB  Bi                                                       ");        
$display("\033[37m  B. BBBBBB  B:    .::ir77rrYLvvriiiiiiirvvY7rr77ri:..                 bU  iQBB:..rI                                                      ");        
$display("\033[37m.S: 7BBBBP  B.                                                          vI7.  .:.  B.                                                     ");        
$display("\033[37mB: ir:.   :B.                                                             :rvsUjUgU.                                                      ");        
$display("\033[37mrMvrrirJKur                                                                                                                               \033[m");
$display ("-----------------------------------------------------------------------------------------------------------------------------------");
$display ("                                                  Congratulations!                						                          ");
$display ("                                           You have passed all patterns!          						                          ");
$display ("                                           Total latency: %f cycles                						             ", total_latency + 0.5);
$display ("-----------------------------------------------------------------------------------------------------------------------------------");

$finish;	
end endtask

task fail;begin
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8Oo::::ooOOO8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@o:   ..::..       .:o88@@@@@@@@@@@8OOoo:::..::oooOO8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8.   :8@@@@@@@@@@@@Oo..                   ..:.:..      .:O8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8.  .8@@@@@@@@@@@@@@@@@@@@@@88888888888@@@@@@@@@@@@@@@@@8.    :O@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@:. .@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8.   :8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@O  O@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8.   :o@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@o  8@@@@@@@@@@@@@8@@@@@@@@8o::o8@@@@@8ooO88@@@@@@@@@@@@@@@@@@@@@@@@8:.  .:ooO8@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@o  :@@@@@@@@@@O      :@@@O   ..  :O@@@:       :@@@@OoO8@@@@@@@@@@@@@@@@Oo...     ..:o@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  :8@@@@@@@@@:  .@@88@@@8:  o@@o  :@@@. 0@@@.  O@@@      .O8@@@@@@@@@@@@@@@@@@8OOo.    O8@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  o@@@@@@@@@@O.      :8@8:  o@@O. .@@8  000o  .8@@O  O8O:  .@@o .O@@@@@@@@@@@@@@@@@@@o.  .o@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@. :8@@@@@@@@@@@@@@@:  .o8:  o@@o. .@@O  ::  .O@@@O.  o0o.  :@@O. :8@8::8@@@@@@@@@@@@@@@8O  .:8@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  o8@@@@@@@@@@@OO@@8.  o@8   ''  .O@@o  O@:  :O@@:  ::   .8@@@O. .:   .8@@@@@@@@@@@@@@@@@@O   8@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@. .O@@@@@@@@@@O      .8@@@@Oo::oO@@@@O  8@8:  :@8  :@O. :O@@@@8:   .o@@@@@@@@@@@@@@@@@@@@@@o  :8@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8:  8@@@@@@@@@@@@8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@o:8@8:  :@@@@:  .O@@@@@@@@@@@@@@@@@@@@@@@@8:  o@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@:  .8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@OoO@@@O  :8@@@@@@@@@@@@@@@@@@@@@@@@@@8o  8@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8.   o8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@88@@@@@@@@@@@@@@@@@@@8::@@@@@88@@@@@@@@@@@@@@@@@@@@@@@  :8@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@O.  .:8@@@@@@@@@@@@@@@@@@@88OOoo::....:O88@@@@@@@@@@@@@@@@@@@@8o .8@@@@@@@@@@@@@@@@@@@@@@:  o@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@o.   ..:o8888888OO::.      ....:o:..     oO@@@@@@@@@@@@@@@@8O..@@ooO@@@@@@@@@@@@@@@@@@O. :@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@Oo::.          ..:OO@@@@@@@@@@@@@@@@O:  .o@@@@@@@@@@@@@@@@@@@O   8@@@@@@@@@@@@@@@@@. .O@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8O   .8@@@@@@@@@@@@@@@@@@@@@O  O@@@@@@@@@@@@@. o8@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@O    .O@@@@@@@@@@@@@@@@@@8..8@@@@@@@@@@@@@. .O@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@O:           ..:O88@888@@@@@@@@@@@@@@@@@@@@@@@O  O@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@o.                          ..:oO@@@@@@@@@@@@@@@o  @@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@.                      .o@@8O::.    o8@@@@@@@@@@@O  8@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@o                         :O@@@@@@@o.  :O8@@@@@@@@8  o8@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@88OO888@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8888OOOOO8@@8888@@@@@O.                          .@@@@@@@@@:.  :@@@@@@@@@. .O@");
$display("@@@@@@@@@@@@@@@@@@@@8o:           O8@@@@@@@@@@@@@@@@@@@8OO:.                     .::                            :8@@@@@@@@@.  .O@@@@@@@o. o@");
$display("@@@@@@@@@@@@@@@@@@.                 o8@@@@@@@@@@@O:.         .::oOOO8Oo:..::::..                                 o@@@@@@@@@@8:  8@@@@@@o. o@");
$display("@@@@@@@@@@@@@@@@:                    .@@@@@Oo.        .:OO@@@@@@@@@@@@@@@@@@@@@@@@@o.                            O@@@@@@@@@@@@  o8@@@@@O. o@");
$display("@@@@@@@@@@@@@@:                       o88.     ..O88@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@888O.                     .8@@@@@@@@@@@@  o8@@@@@: .O@");
$display("@@@@@@@@@@@@O:                             :o8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@:                  .8@@@@@@@@@@@8o  8@@@@@O  O@@");
$display("@@@@@@@@@@@O.                            :8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@o.              :8@@@@@@@@@@8.  .O@@@@o.  :@@@");
$display("@@@@@@@@@@@:                          :O8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@O:          .o@@@@@@@@@8o   .o@@@8:.  .@@@@@");
$display("@@@@@@@@@@@.                        O8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@O.    .o8@@@@@@@@@@O  :O@@8o:   .O@@@@@@@");
$display("@@@@@@@@@@@.                      :O@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@O:   o8@@@@@@@@8           oO@@@@@@@@@@");
$display("@@@@@@@@@@@:                     o@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@.   .@@@@@@@O.      .:o8@@@@@@@@@@@@@");
$display("@@@@@@@@@@@8o                   8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@o   :@@@@O     o8@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@8.               .O@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@:   .@@@8..:8@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@8:            .o@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@O.  :8@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@8O.        8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   :@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@8o   o@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@o   O@@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@O   O@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@O   :@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@8   :@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@:   8@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@8o  :8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@:..   .:o@@@@@@@@@@@@@@@@@@8.  O@@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@8o  :8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@O.         .:@@@@@@@@@@@@@@@@@:  :O@@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@O.  o@@@@@@@@@@@@@@@@@@@@@@8OOO8@@@@@@@@@@@@@@@@@@@@@@@@@@@8.             .@@@@@@@@@@@@@@@@.  .O@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@o.  .@@@@@@@@@@@@@@@@@@@8:.       :8@@@@@@@@@@@@@@@@@@@@@@@@8.               o8@@@@@@@@@@@@@o. .:@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@o.  :@@@@@@@@@@@@@@@@@O            .@@@@@@@@@@@@@@@@@@@@@@@@@:                .8@@@@@@@@@@@@O.  :@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@O.  .@@@@@@@@@@@@@@@@:             .8@@@@@@@@@@@@@@@@@@@@@@@@O:                o@@@@@@@@@@@@O:  .@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@O.  .@@@@@@@@@@@@@@8:               8@@@@@@@@@@@@@@@@@@@@@@@@@@.               o@@@@@@@@@@@@O:  .@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@O.  .@@@@@@@@@@@@@o.                8@@@@@@@@@@@@@@@@@@@@@@@@@@8o             .8@@@@@@@@@@@@O.  .@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@8:  .@@@@@@@@@@@@@                 :@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8:.        O8@@@@@@@@@@@@@@o.  :@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@o   8@@@@@@@@@@@@.               :8@@@@@@@@@          :8@@@@@@@@@@@8OoooO@@@@@@@@@@@@@@@@@@.  .o@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@88O:   O@@@@@@@@@@@@O:             .@@@@@@@@O             .8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8   :8@@@@@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@O:.       :O8@@@@@@@@@@8o           :O@@@@@@@8:             :@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8:       :o@@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@o              ..:8@@@@@@@@@8o:::.:O8@@@@@@@@@@@8.           :@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@O:.             o@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@8o                   :@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@:.     .o@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8                  o8@@@@@@@@@@@@@@@");
$display("8OOOooooOOoo:.                    :OOOOOOOOOO8888OOOOOOOOOOOoo:ooOOOo: .OOOOOOOOOO888OOooOO888OOOOOooO8:                   .:OOOOOOOOOOO88@@");
$display("            .                                                                                                                               ");
$display("@@@@@@@@@@@@@@8o                 .8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8                    :8@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@8O.             o8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8o                 .@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@::.       :O@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@O..         .:8@@@@@@@@@@@@@@@@@@");
$display("@@@@@@@@@@@@@@@@@@@@@@@@@88O8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@88@@@@@@@@@@@@@@@@@@@@@@@@@@");
$display ("--------------------------------------------------------------------------------------------------------------------------------------------");
$display ("                                                                        OUTPUT FAIL!                                                        ");
$display ("                                                           Ans(OUT): %d,  Your output : %4d  at %8t                           ",Golden_OFM,Out_OFM,$time);
$display ("--------------------------------------------------------------------------------------------------------------------------------------------");
$finish;
end
endtask


endmodule