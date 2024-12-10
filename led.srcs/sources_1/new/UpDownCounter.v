`timescale 1ns / 1ps



module UpDownCounter(
    input sys_clk,
    input [3:0] key,
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
                if (~key[2])
                    state <= UP;
                else if (~key[3])
                    state <= DOWN;
            end
            UP: begin
                cnt <= cnt + 1;
                if (cnt == (50000000 - 1)) begin
                    led <= led + {key[1],key[0]};
                    counter <= counter + 1;
                    cnt <= 0;  
                    state <= CHECK;
                end
            end
            DOWN: begin
                cnt <= cnt + 1;
                if (cnt == (50000000 - 1)) begin
                    led <= led - {key[1],key[0]};
                    counter <= counter + 1;
                    cnt <= 0;
                    state <= CHECK;
                end  
      
            end
        endcase
    end
endmodule
