`timescale 1ns / 1ps
module DDS(
    input aclk,
    output   m_axis_data_tvalid,
    output  [15:0] sin,
    output  [15:0] cos
       );
     wire [31:0] m_axis_data_tdata;
     assign sin=m_axis_data_tdata[31:16];
     assign cos=m_axis_data_tdata[15:0];
     
    dds_compiler_1 dds_ins (
      .aclk(aclk),                              // input wire aclk
      .m_axis_data_tvalid(m_axis_data_tvalid),  // output wire m_axis_data_tvalid
      .m_axis_data_tdata(m_axis_data_tdata)    // output wire [31 : 0] m_axis_data_tdata
    );
endmodule
