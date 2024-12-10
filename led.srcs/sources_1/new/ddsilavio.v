`timescale 1ns / 1ps
module ddsilavio(
    input sys_clk
    );
    wire [15:0]probe_out0;
    wire [31:0] m_axis_data_tdata;
    vio_0 vio_test (
  .clk(sys_clk),                // input wire clk
  .probe_out0(probe_out0)  // output wire [15 : 0] probe_out0
);

ila_0 ila_test (
	.clk(sys_clk), // input wire clk
	.probe0(m_axis_data_tdata[15:0]), // input wire [15:0]  probe0  
	.probe1(m_axis_data_tdata[31:16]) // input wire [15:0]  probe1
);
    dds_compiler_1 dds_test (
  .aclk(sys_clk),                                // input wire aclk
  .s_axis_phase_tvalid(1),  // input wire s_axis_phase_tvalid
  .s_axis_phase_tdata(probe_out0),    // input wire [15 : 0] s_axis_phase_tdata
  .m_axis_data_tvalid(),    // output wire m_axis_data_tvalid
  .m_axis_data_tdata(m_axis_data_tdata),      // output wire [31 : 0] m_axis_data_tdata
  .m_axis_phase_tvalid(),  // output wire m_axis_phase_tvalid
  .m_axis_phase_tdata()    // output wire [15 : 0] m_axis_phase_tdata
);

    
endmodule