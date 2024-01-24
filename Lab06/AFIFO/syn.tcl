#======================================================
#
# Synopsys Synthesis Scripts (Design Vision dctcl mode)
#
#======================================================

#======================================================
#  Set Libraries
#======================================================

set search_path {    ./../01_RTL \
                     ./ \
                    }
                               
set synthetic_library {dw_foundation.sldb}
set link_library {* dw_foundation.sldb standard.sldb asap7sc7p5t_AO_RVT_TT_08302018.db asap7sc7p5t_OA_RVT_TT_08302018.db asap7sc7p5t_INVBUF_RVT_TT_08302018.db asap7sc7p5t_SEQ_RVT_TT_08302018.db asap7sc7p5t_SIMPLE_RVT_TT_08302018.db asap7sc7p5t_AO_RVT_TT_08302018.db  asap7sc7p5t_OA_RVT_TT_08302018.db}
set target_library {asap7sc7p5t_INVBUF_RVT_TT_08302018.db asap7sc7p5t_SIMPLE_RVT_TT_08302018.db asap7sc7p5t_SEQ_RVT_TT_08302018.db} 

#======================================================
#  Global Parameters
#======================================================
set DESIGN "Convolution"
set CYCLE1 19000
set CYCLE2 11000
set CYCLE3 19000
set IN_DLY  [expr 0.5*$CYCLE1]
set OUT_DLY [expr 0.5*$CYCLE2]

#======================================================
#  Read RTL Code
#======================================================

analyze -f verilog $DESIGN\.v 
elaborate $DESIGN 
current_design $DESIGN


#read_sverilog $DESIGN.v
#current_design $DESIGN

#======================================================
#  Global Setting
#======================================================

set_wire_load_mode top

set sync_r2w_name "sync_r2w"
set sync_w2r_name "sync_w2r"

#======================================================
#  Set Design Constraints
#======================================================

create_clock -name "clk1" -period $CYCLE1 clk1 
create_clock -name "clk2" -period $CYCLE2 clk2 

read_sdc $DESIGN\.sdc

set_dont_touch [all_clocks]
set_ideal_network       [all_clocks]

set_output_delay [ expr $CYCLE2*0.5] -clock clk2 [all_outputs]  
set_input_delay [ expr $CYCLE1*0.5] -clock clk1 [all_inputs]

set_input_delay 0 -clock clk1 clk1
set_input_delay 0 -clock clk2 clk2
set_input_delay 0 -clock clk1 rst_n  
set_input_delay 0 -clock clk2 rst_n    

set_load 0.05 [all_outputs]

set_max_delay $CYCLE1 -from [all_inputs] -to [all_outputs]

#======================================================
#  Optimization
#======================================================
uniquify
check_design > Report/$DESIGN\.check
set_fix_multiple_port_nets -all -buffer_constants
set_fix_hold [all_clocks]


#analyze -f sverilog $synchronizer_module_name\.v 
#elaborate $synchronizer_module_name 
#compile
#set_dont_touch $synchronizer_module_name


#analyze -f sverilog $synchronizer_XOR_module_name\.v 
#elaborate $synchronizer_XOR_module_name 
#compile
#set_dont_touch $synchronizer_XOR_module_name

analyze -f sverilog $sync_r2w_name\.v 
elaborate $sync_r2w_name 
compile
set_dont_touch $sync_r2w_name


analyze -f sverilog $sync_w2r_name\.v 
elaborate $sync_w2r_name 
compile
set_dont_touch $sync_w2r_name

current_design $DESIGN

compile


#======================================================
#  Output Reports 
#======================================================
report_timing >  Report/$DESIGN\.timing
report_timing -delay_type min  >  Report/$DESIGN\.timing_hold
report_area >  Report/$DESIGN\.area
report_resource >  Report/$DESIGN\.resource

#======================================================
#  Change Naming Rule
#======================================================
set bus_inference_style "%s\[%d\]"
set bus_naming_style "%s\[%d\]"
set hdlout_internal_busses true
change_names -hierarchy -rule verilog
define_name_rules name_rule -allowed "a-z A-Z 0-9 _" -max_length 255 -type cell
define_name_rules name_rule -allowed "a-z A-Z 0-9 _[]" -max_length 255 -type net
define_name_rules name_rule -map {{"\\*cell\\*" "cell"}}
change_names -hierarchy -rules name_rule

#======================================================
#  Output Results
#======================================================

set verilogout_higher_designs_first true
write -format verilog -output Netlist/$DESIGN\_SYN.v -hierarchy

# set_annotated_delay 0 -cell -to [get_pins -filter "pin_direction == out" -of_objects [get_cells "GATED_*/U*" -filter "ref_name==OR2x2_ASAP7_75t_R"]]
# set_annotated_delay 0 -cell -to [get_pins -filter "pin_direction == out" -of_objects [get_cells "GATED_*/U*" -filter "ref_name==NAND2xp5_ASAP7_75t_R"]]
# set_annotated_delay 0 -cell -to [get_pins -filter "pin_direction == out" -of_objects [get_cells "GATED_*/U*" -filter "ref_name==INVx1_ASAP7_75t_R"]]

write_sdf -version 3.0 -context verilog -load_delay cell Netlist/$DESIGN\_SYN.sdf -significant_digits 6
write_sdc Netlist/$DESIGN\_SYN.sdc
#write_sdc Netlist/$DESIGN\_pt.sdc
#======================================================
#  Finish and Quit
#======================================================
report_area
report_timing
exit
