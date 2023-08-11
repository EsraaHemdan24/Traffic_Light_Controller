`timescale 1ns/100ps

module tlc_tb;

reg clk_tb =0;
parameter clk_period =2;
always #(clk_period/2) clk_tb = ~clk_tb;

reg rst_tb;
wire red_tb , yellow_tb , green_tb;

tlc_top dut (
    .clk(clk_tb),
    .rst(rst_tb),
    .red(red_tb),
    .yellow(yellow_tb),
    .green(green_tb)
);

initial begin
    rst_tb = 1 ;
    #(clk_period);
    rst_tb = 0;
    #(clk_period); $finish;
end

endmodule