`timescale 1ns / 1ps
module dds_tb(  );
     reg clk;
     wire m_axis_data_tvalid;
     wire  [15:0] sin;
     wire  [15:0] cos;
     DDS uut(
        clk,
         m_axis_data_tvalid,
          sin,
          cos
           );
     initial clk=0;      
     always
         begin 
         #10 ;
         clk = ~clk;
         end
endmodule
