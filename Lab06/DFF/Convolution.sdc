set_false_path -from [get_clocks clk1] -to [get_clocks clk2]
set_false_path -from [get_clocks clk_operating] -to [get_clocks clk1]
set_false_path -from [get_clocks clk_operating] -to [get_clocks clk2]
set_false_path -from [get_clocks clk2] -to [get_clocks clk1]