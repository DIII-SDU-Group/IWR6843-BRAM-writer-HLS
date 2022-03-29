// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Version: 2020.2
// Copyright (C) Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="mmWBramWriter_mmWBramWriter,hls_ip_2020_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xczu3eg-sbva484-1-i,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=4.424000,HLS_SYN_LAT=164,HLS_SYN_TPT=none,HLS_SYN_MEM=4,HLS_SYN_DSP=0,HLS_SYN_FF=75,HLS_SYN_LUT=620,HLS_VERSION=2020_2}" *)

module mmWBramWriter (
        ap_clk,
        ap_rst_n,
        buffer_in_address0,
        buffer_in_ce0,
        buffer_in_q0,
        buffer_out_address0,
        buffer_out_ce0,
        buffer_out_we0,
        buffer_out_d0,
        s_axi_control_AWVALID,
        s_axi_control_AWREADY,
        s_axi_control_AWADDR,
        s_axi_control_WVALID,
        s_axi_control_WREADY,
        s_axi_control_WDATA,
        s_axi_control_WSTRB,
        s_axi_control_ARVALID,
        s_axi_control_ARREADY,
        s_axi_control_ARADDR,
        s_axi_control_RVALID,
        s_axi_control_RREADY,
        s_axi_control_RDATA,
        s_axi_control_RRESP,
        s_axi_control_BVALID,
        s_axi_control_BREADY,
        s_axi_control_BRESP,
        interrupt
);

parameter    ap_ST_fsm_state1 = 5'd1;
parameter    ap_ST_fsm_pp0_stage0 = 5'd2;
parameter    ap_ST_fsm_state4 = 5'd4;
parameter    ap_ST_fsm_pp1_stage0 = 5'd8;
parameter    ap_ST_fsm_state7 = 5'd16;
parameter    C_S_AXI_CONTROL_DATA_WIDTH = 32;
parameter    C_S_AXI_CONTROL_ADDR_WIDTH = 4;
parameter    C_S_AXI_DATA_WIDTH = 32;

parameter C_S_AXI_CONTROL_WSTRB_WIDTH = (32 / 8);
parameter C_S_AXI_WSTRB_WIDTH = (32 / 8);

input   ap_clk;
input   ap_rst_n;
output  [4:0] buffer_in_address0;
output   buffer_in_ce0;
input  [127:0] buffer_in_q0;
output  [6:0] buffer_out_address0;
output   buffer_out_ce0;
output   buffer_out_we0;
output  [31:0] buffer_out_d0;
input   s_axi_control_AWVALID;
output   s_axi_control_AWREADY;
input  [C_S_AXI_CONTROL_ADDR_WIDTH - 1:0] s_axi_control_AWADDR;
input   s_axi_control_WVALID;
output   s_axi_control_WREADY;
input  [C_S_AXI_CONTROL_DATA_WIDTH - 1:0] s_axi_control_WDATA;
input  [C_S_AXI_CONTROL_WSTRB_WIDTH - 1:0] s_axi_control_WSTRB;
input   s_axi_control_ARVALID;
output   s_axi_control_ARREADY;
input  [C_S_AXI_CONTROL_ADDR_WIDTH - 1:0] s_axi_control_ARADDR;
output   s_axi_control_RVALID;
input   s_axi_control_RREADY;
output  [C_S_AXI_CONTROL_DATA_WIDTH - 1:0] s_axi_control_RDATA;
output  [1:0] s_axi_control_RRESP;
output   s_axi_control_BVALID;
input   s_axi_control_BREADY;
output  [1:0] s_axi_control_BRESP;
output   interrupt;

reg buffer_in_ce0;
reg buffer_out_ce0;
reg buffer_out_we0;

 reg    ap_rst_n_inv;
wire    ap_start;
reg    ap_done;
reg    ap_idle;
(* fsm_encoding = "none" *) reg   [4:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    ap_ready;
reg   [5:0] i_reg_118;
reg   [7:0] i_1_reg_129;
wire   [5:0] add_ln29_fu_141_p2;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_state2_pp0_stage0_iter0;
wire    ap_block_state3_pp0_stage0_iter1;
wire    ap_block_pp0_stage0_11001;
wire   [0:0] icmp_ln29_fu_147_p2;
reg   [0:0] icmp_ln29_reg_222;
wire   [63:0] i_cast_fu_153_p1;
reg   [63:0] i_cast_reg_226;
wire   [7:0] add_ln38_fu_158_p2;
reg   [7:0] add_ln38_reg_236;
wire    ap_CS_fsm_pp1_stage0;
reg    ap_enable_reg_pp1_iter0;
wire    ap_block_state5_pp1_stage0_iter0;
wire    ap_block_state6_pp1_stage0_iter1;
wire    ap_block_pp1_stage0_11001;
wire   [0:0] icmp_ln38_fu_164_p2;
reg   [0:0] icmp_ln38_reg_241;
wire    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state2;
reg    ap_enable_reg_pp0_iter1;
wire    ap_CS_fsm_state4;
wire    ap_block_pp1_stage0_subdone;
reg    ap_condition_pp1_exit_iter0_state5;
reg    ap_enable_reg_pp1_iter1;
reg   [4:0] buffer_address0;
reg    buffer_ce0;
reg    buffer_we0;
wire   [127:0] buffer_q0;
reg   [7:0] ap_phi_mux_i_1_phi_fu_133_p4;
wire    ap_block_pp1_stage0;
wire    ap_block_pp0_stage0;
wire   [63:0] zext_ln40_fu_180_p1;
wire   [63:0] i_1_cast1_fu_185_p1;
wire   [4:0] lshr_ln40_1_fu_170_p4;
wire   [1:0] trunc_ln40_fu_190_p1;
wire   [6:0] shl_ln40_1_fu_194_p3;
wire   [127:0] zext_ln40_1_fu_202_p1;
wire   [127:0] lshr_ln40_fu_206_p2;
wire    ap_CS_fsm_state7;
reg   [4:0] ap_NS_fsm;
reg    ap_idle_pp0;
wire    ap_enable_pp0;
reg    ap_idle_pp1;
wire    ap_enable_pp1;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 5'd1;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
#0 ap_enable_reg_pp1_iter0 = 1'b0;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp1_iter1 = 1'b0;
end

mmWBramWriter_control_s_axi #(
    .C_S_AXI_ADDR_WIDTH( C_S_AXI_CONTROL_ADDR_WIDTH ),
    .C_S_AXI_DATA_WIDTH( C_S_AXI_CONTROL_DATA_WIDTH ))
control_s_axi_U(
    .AWVALID(s_axi_control_AWVALID),
    .AWREADY(s_axi_control_AWREADY),
    .AWADDR(s_axi_control_AWADDR),
    .WVALID(s_axi_control_WVALID),
    .WREADY(s_axi_control_WREADY),
    .WDATA(s_axi_control_WDATA),
    .WSTRB(s_axi_control_WSTRB),
    .ARVALID(s_axi_control_ARVALID),
    .ARREADY(s_axi_control_ARREADY),
    .ARADDR(s_axi_control_ARADDR),
    .RVALID(s_axi_control_RVALID),
    .RREADY(s_axi_control_RREADY),
    .RDATA(s_axi_control_RDATA),
    .RRESP(s_axi_control_RRESP),
    .BVALID(s_axi_control_BVALID),
    .BREADY(s_axi_control_BREADY),
    .BRESP(s_axi_control_BRESP),
    .ACLK(ap_clk),
    .ARESET(ap_rst_n_inv),
    .ACLK_EN(1'b1),
    .ap_start(ap_start),
    .interrupt(interrupt),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_idle(ap_idle)
);

mmWBramWriter_buffer #(
    .DataWidth( 128 ),
    .AddressRange( 32 ),
    .AddressWidth( 5 ))
buffer_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .address0(buffer_address0),
    .ce0(buffer_ce0),
    .we0(buffer_we0),
    .d0(buffer_in_q0),
    .q0(buffer_q0)
);

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b1 == ap_condition_pp0_exit_iter0_state2))) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_condition_pp0_exit_iter0_state2))) begin
            ap_enable_reg_pp0_iter1 <= (1'b1 ^ ap_condition_pp0_exit_iter0_state2);
        end else if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp1_iter0 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp1_stage0_subdone) & (1'b1 == ap_condition_pp1_exit_iter0_state5) & (1'b1 == ap_CS_fsm_pp1_stage0))) begin
            ap_enable_reg_pp1_iter0 <= 1'b0;
        end else if ((1'b1 == ap_CS_fsm_state4)) begin
            ap_enable_reg_pp1_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp1_iter1 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp1_stage0_subdone) & (1'b1 == ap_condition_pp1_exit_iter0_state5))) begin
            ap_enable_reg_pp1_iter1 <= (1'b1 ^ ap_condition_pp1_exit_iter0_state5);
        end else if ((1'b0 == ap_block_pp1_stage0_subdone)) begin
            ap_enable_reg_pp1_iter1 <= ap_enable_reg_pp1_iter0;
        end else if ((1'b1 == ap_CS_fsm_state4)) begin
            ap_enable_reg_pp1_iter1 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        i_1_reg_129 <= 8'd0;
    end else if (((1'b0 == ap_block_pp1_stage0_11001) & (1'b1 == ap_CS_fsm_pp1_stage0) & (ap_enable_reg_pp1_iter1 == 1'b1) & (icmp_ln38_reg_241 == 1'd0))) begin
        i_1_reg_129 <= add_ln38_reg_236;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        i_reg_118 <= 6'd0;
    end else if (((icmp_ln29_fu_147_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        i_reg_118 <= add_ln29_fu_141_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp1_stage0_11001) & (1'b1 == ap_CS_fsm_pp1_stage0) & (ap_enable_reg_pp1_iter0 == 1'b1))) begin
        add_ln38_reg_236 <= add_ln38_fu_158_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln29_fu_147_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        i_cast_reg_226[5 : 0] <= i_cast_fu_153_p1[5 : 0];
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln29_reg_222 <= icmp_ln29_fu_147_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp1_stage0_11001) & (1'b1 == ap_CS_fsm_pp1_stage0))) begin
        icmp_ln38_reg_241 <= icmp_ln38_fu_164_p2;
    end
end

always @ (*) begin
    if ((icmp_ln29_fu_147_p2 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state2 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state2 = 1'b0;
    end
end

always @ (*) begin
    if ((icmp_ln38_fu_164_p2 == 1'd1)) begin
        ap_condition_pp1_exit_iter0_state5 = 1'b1;
    end else begin
        ap_condition_pp1_exit_iter0_state5 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp1_iter1 == 1'b0) & (ap_enable_reg_pp1_iter0 == 1'b0))) begin
        ap_idle_pp1 = 1'b1;
    end else begin
        ap_idle_pp1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp1_stage0) & (1'b1 == ap_CS_fsm_pp1_stage0) & (ap_enable_reg_pp1_iter1 == 1'b1) & (icmp_ln38_reg_241 == 1'd0))) begin
        ap_phi_mux_i_1_phi_fu_133_p4 = add_ln38_reg_236;
    end else begin
        ap_phi_mux_i_1_phi_fu_133_p4 = i_1_reg_129;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp1_stage0) & (1'b1 == ap_CS_fsm_pp1_stage0) & (ap_enable_reg_pp1_iter0 == 1'b1))) begin
        buffer_address0 = zext_ln40_fu_180_p1;
    end else if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        buffer_address0 = i_cast_reg_226;
    end else begin
        buffer_address0 = 'bx;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((1'b0 == ap_block_pp1_stage0_11001) & (1'b1 == ap_CS_fsm_pp1_stage0) & (ap_enable_reg_pp1_iter0 == 1'b1)))) begin
        buffer_ce0 = 1'b1;
    end else begin
        buffer_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        buffer_in_ce0 = 1'b1;
    end else begin
        buffer_in_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp1_stage0_11001) & (1'b1 == ap_CS_fsm_pp1_stage0) & (ap_enable_reg_pp1_iter1 == 1'b1))) begin
        buffer_out_ce0 = 1'b1;
    end else begin
        buffer_out_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp1_stage0_11001) & (1'b1 == ap_CS_fsm_pp1_stage0) & (ap_enable_reg_pp1_iter1 == 1'b1) & (icmp_ln38_reg_241 == 1'd0))) begin
        buffer_out_we0 = 1'b1;
    end else begin
        buffer_out_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln29_reg_222 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        buffer_we0 = 1'b1;
    end else begin
        buffer_we0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_pp0_stage0 : begin
            if (~((icmp_ln29_fu_147_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if (((icmp_ln29_fu_147_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_pp1_stage0;
        end
        ap_ST_fsm_pp1_stage0 : begin
            if (~((1'b0 == ap_block_pp1_stage0_subdone) & (icmp_ln38_fu_164_p2 == 1'd1) & (ap_enable_reg_pp1_iter0 == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_pp1_stage0;
            end else if (((1'b0 == ap_block_pp1_stage0_subdone) & (icmp_ln38_fu_164_p2 == 1'd1) & (ap_enable_reg_pp1_iter0 == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp1_stage0;
            end
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln29_fu_141_p2 = (i_reg_118 + 6'd1);

assign add_ln38_fu_158_p2 = (ap_phi_mux_i_1_phi_fu_133_p4 + 8'd1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_pp1_stage0 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd4];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp1_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp1_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp1_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp1_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state6_pp1_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_pp1 = (ap_idle_pp1 ^ 1'b1);

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign buffer_in_address0 = i_cast_fu_153_p1;

assign buffer_out_address0 = i_1_cast1_fu_185_p1;

assign buffer_out_d0 = lshr_ln40_fu_206_p2[31:0];

assign i_1_cast1_fu_185_p1 = i_1_reg_129;

assign i_cast_fu_153_p1 = i_reg_118;

assign icmp_ln29_fu_147_p2 = ((i_reg_118 == 6'd32) ? 1'b1 : 1'b0);

assign icmp_ln38_fu_164_p2 = ((ap_phi_mux_i_1_phi_fu_133_p4 == 8'd128) ? 1'b1 : 1'b0);

assign lshr_ln40_1_fu_170_p4 = {{ap_phi_mux_i_1_phi_fu_133_p4[6:2]}};

assign lshr_ln40_fu_206_p2 = buffer_q0 >> zext_ln40_1_fu_202_p1;

assign shl_ln40_1_fu_194_p3 = {{trunc_ln40_fu_190_p1}, {5'd0}};

assign trunc_ln40_fu_190_p1 = i_1_reg_129[1:0];

assign zext_ln40_1_fu_202_p1 = shl_ln40_1_fu_194_p3;

assign zext_ln40_fu_180_p1 = lshr_ln40_1_fu_170_p4;

always @ (posedge ap_clk) begin
    i_cast_reg_226[63:6] <= 58'b0000000000000000000000000000000000000000000000000000000000;
end

endmodule //mmWBramWriter