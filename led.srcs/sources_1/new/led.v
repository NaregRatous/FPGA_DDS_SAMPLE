/*`timescale 1ns / 1ps

module led(
    input sys_clk,
    input rst_n,
    (* MARK_DEBUG="true" *)output reg [3:0] led
    );
(* MARK_DEBUG="true" *)reg[31:0] timer_cnt;
always@(posedge sys_clk or negedge rst_n)
begin
    if (!rst_n)
    begin
        led <= 4'd0 ;
        timer_cnt <= 32'd0 ;
    end
    else if(timer_cnt >= 32'd49_999_999)
    begin
        led <= ~led;
        timer_cnt <= 32'd0;
    end
    else
    begin
        led <= led;
        timer_cnt <= timer_cnt + 32'd1;
    end
    
end

////Instantiate ila in source file
//ila ila_inst(
//  .clk(sys_clk),
//  .probe0(timer_cnt),
//  .probe1(led)
//  );

endmodule
*/
`timescale 1ns / 1ps
module LED(
    input sys_clk,
    input [1:0] key,
    output reg [3:0] led
);
    parameter CHECK = 0, UP = 1, DOWN = 2;
    reg [1:0] state = CHECK;
    reg [31:0] cnt=0;
    reg [2:0] counter = 0;
    reg led=4'b1111;
    always @(posedge sys_clk) begin
        case (state)
            CHECK: begin
                cnt     <= 0;
                counter <= 0;
                if (~key[0])
                    state <= UP;
                else if (~key[1])
                    state <= DOWN;
            end
            UP: begin
                cnt <= cnt + 1;
                if (cnt == (50000000 - 1)) begin
                    led <= led + 1;
                    counter <= counter + 1;
                    cnt <= 0;  
                    if (counter == 4)
                        state <= CHECK;
                end
            end
            DOWN: begin
                cnt <= cnt + 1;
                if (cnt == (50000000 - 1)) begin
                    led <= led - 1;
                    counter <= counter + 1;
                    cnt <= 0;
                end  
                if (counter == 4)
                    state <= CHECK;
            end
        endcase
    end
endmodule