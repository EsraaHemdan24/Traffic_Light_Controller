module tlc_cont (
    input clk , rst , cntr_done,
    output reg red , yellow , green, cnt_rst, 
    output reg [3:0] wait_cnt    
);

parameter state_width = 3;
parameter [state_width-1 : 0] rr = 3'd0 ,
                              wr = 3'd1 ,
                              ry = 3'd2 ,
                              wy = 3'd3 ,
                              rg = 3'd4 ,
                              wg = 3'd5 ;

reg [state_width-1 : 0] curr_state , next_state;


always @(posedge clk) begin
    if (rst) begin
        curr_state <= rr;
    end
    else begin
       curr_state <= next_state; 
    end
end

always @(*) begin

    red = 0;
    yellow = 0;
    green = 0;
    wait_cnt = 0;
    cnt_rst = 0;

    case (curr_state)
        rr : begin
         cnt_rst = 1;
         wait_cnt = 28;
         red = 1;  
         next_state = wr ; 
        end

        wr : begin
            red = 1;

            if (cntr_done==1) begin
                next_state = ry;
            end
            else begin
                next_state = wr;
            end
        end

        ry : begin
         cnt_rst = 1;
         wait_cnt =3;
         yellow = 1;   
         next_state = wy ;
        end

        wy : begin
         yellow = 1;

         if (cntr_done==1) begin
                next_state = rg;
            end
            else begin
                next_state = wy;
            end

        end

        rg : begin
         cnt_rst = 1;
         wait_cnt = 28;
         green = 1;  
         next_state = wg ;
        end

        wg : begin
         green = 1;   

         if (cntr_done==1) begin
                next_state = rr;
            end
            else begin
                next_state = wg;
            end
        end

        default : next_state = rr;
            
    endcase
end

endmodule //tlc_cont