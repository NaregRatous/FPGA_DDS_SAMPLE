// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
// Date        : Mon Dec  9 18:34:11 2024
// Host        : At112204-P1 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub {h:/Learning/2.Software/FPGA/FPGA
//               Excercise/01_led/led.srcs/sources_1/ip/dds_compiler_1/dds_compiler_1_stub.v}
// Design      : dds_compiler_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "dds_compiler_v6_0_21,Vivado 2021.2" *)
module dds_compiler_1(aclk, s_axis_phase_tvalid, 
  s_axis_phase_tdata, m_axis_data_tvalid, m_axis_data_tdata, m_axis_phase_tvalid, 
  m_axis_phase_tdata)
/* synthesis syn_black_box black_box_pad_pin="aclk,s_axis_phase_tvalid,s_axis_phase_tdata[15:0],m_axis_data_tvalid,m_axis_data_tdata[31:0],m_axis_phase_tvalid,m_axis_phase_tdata[15:0]" */;
  input aclk;
  input s_axis_phase_tvalid;
  input [15:0]s_axis_phase_tdata;
  output m_axis_data_tvalid;
  output [31:0]m_axis_data_tdata;
  output m_axis_phase_tvalid;
  output [15:0]m_axis_phase_tdata;
endmodule
