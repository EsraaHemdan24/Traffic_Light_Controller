module tlc_top (
    input rst , clk , 
    output red , yellow , green
);

wire [3:0] wait_cnt ;
wire cnt_rst , cntr_done;

tlc_cont cntroller (
    .clk(clk) ,
    .rst(rst) , 
    .cntr_done(cntr_done),
    .red(red) , 
    .yellow(yellow) , 
    .green(green), 
    .cnt_rst(cnt_rst),
    .wait_cnt(wait_cnt)
);

tlc_dp dp (
    .clk(clk),
    .rst(cnt_rst),
    .wait_cnt(wait_cnt),
    .cntr_done(cntr_done)
);


endmodule //tlc_top