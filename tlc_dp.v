module tlc_dp (
    input clk , rst ,
    input [3:0] wait_cnt,
    output reg cntr_done 
);

reg [4:0] cntr;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        cntr <= 0;
        cntr_done <= 0;
    end
    else begin
        cntr <= cntr + 1;

        if (wait_cnt==cntr) begin
            cntr_done <= 1;  
        end
        else begin
            cntr_done <= 0;
        end
    end
end

endmodule //tlc_dp