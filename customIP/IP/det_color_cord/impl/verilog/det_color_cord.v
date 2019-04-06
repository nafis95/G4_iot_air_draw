// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.2
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="det_color_cord,hls_ip_2018_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7a200tsbg484-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=7.782000,HLS_SYN_LAT=2,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=980,HLS_SYN_LUT=1835,HLS_VERSION=2018_2}" *)

module det_color_cord (
        ap_clk,
        ap_rst,
        frame_in_V_dout,
        frame_in_V_empty_n,
        frame_in_V_read,
        cord_out_V_din,
        cord_out_V_full_n,
        cord_out_V_write,
        target_threshold,
        other_threshold,
        target_color,
        width,
        height,
        reset,
        y_cord_out,
        y_cord_out_ap_vld,
        x_cord_out,
        x_cord_out_ap_vld,
        pixel_in_data_out,
        pixel_in_data_out_ap_vld,
        edgeout_val,
        edgeout_val_ap_vld
);

parameter    ap_ST_fsm_state1 = 3'd1;
parameter    ap_ST_fsm_state2 = 3'd2;
parameter    ap_ST_fsm_state3 = 3'd4;

input   ap_clk;
input   ap_rst;
input  [27:0] frame_in_V_dout;
input   frame_in_V_empty_n;
output   frame_in_V_read;
output  [96:0] cord_out_V_din;
input   cord_out_V_full_n;
output   cord_out_V_write;
input  [7:0] target_threshold;
input  [7:0] other_threshold;
input  [7:0] target_color;
input  [31:0] width;
input  [31:0] height;
input   reset;
output  [31:0] y_cord_out;
output   y_cord_out_ap_vld;
output  [31:0] x_cord_out;
output   x_cord_out_ap_vld;
output  [31:0] pixel_in_data_out;
output   pixel_in_data_out_ap_vld;
output  [63:0] edgeout_val;
output   edgeout_val_ap_vld;

reg frame_in_V_read;
reg cord_out_V_write;
reg y_cord_out_ap_vld;
reg x_cord_out_ap_vld;
reg pixel_in_data_out_ap_vld;
reg edgeout_val_ap_vld;

reg   [31:0] current_x_cord;
reg   [31:0] current_y_cord;
reg   [31:0] left_edge;
reg   [31:0] upper_edge;
reg   [31:0] bottom_edge;
reg   [31:0] right_edge;
reg   [0:0] led_exist;
reg    frame_in_V_blk_n;
(* fsm_encoding = "none" *) reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [0:0] tmp_nbreadreq_fu_154_p3;
reg    cord_out_V_blk_n;
wire    ap_CS_fsm_state3;
reg   [0:0] tmp_reg_1168;
reg   [0:0] tmp_5_reg_1176;
reg   [0:0] tmp_10_reg_1181;
reg    ap_block_state1;
wire   [31:0] p_current_x_cord_load_fu_466_p3;
reg   [31:0] p_current_x_cord_load_reg_1099;
wire   [31:0] p_current_y_cord_load_fu_474_p3;
reg   [31:0] p_current_y_cord_load_reg_1111;
wire   [0:0] tmp_4_fu_488_p2;
reg   [0:0] tmp_4_reg_1124;
wire   [31:0] width_left_edge_load_fu_510_p3;
reg   [31:0] width_left_edge_load_reg_1140;
wire   [31:0] height_upper_edge_lo_fu_518_p3;
reg   [31:0] height_upper_edge_lo_reg_1147;
wire   [31:0] p_bottom_edge_load_fu_526_p3;
reg   [31:0] p_bottom_edge_load_reg_1154;
wire   [31:0] p_right_edge_load_fu_534_p3;
reg   [31:0] p_right_edge_load_reg_1161;
wire   [0:0] or_cond_7_fu_687_p2;
reg   [0:0] or_cond_7_reg_1172;
wire   [0:0] tmp_5_fu_810_p2;
wire    ap_CS_fsm_state2;
wire   [0:0] grp_fu_453_p2;
reg   [0:0] led_exist_load_reg_1185;
wire   [31:0] tmp_11_fu_819_p2;
reg   [31:0] tmp_11_reg_1190;
wire   [31:0] tmp_14_fu_825_p2;
reg   [31:0] tmp_14_reg_1197;
wire   [63:0] p_4_fu_867_p3;
reg   [63:0] p_4_reg_1204;
wire   [0:0] left_edge_flag_1_fu_728_p2;
reg   [0:0] left_edge_flag_2_reg_203;
wire   [31:0] width_assign_fu_734_p3;
reg   [31:0] left_edge_new_2_reg_213;
wire   [31:0] left_edge_loc_1_fu_741_p3;
reg   [31:0] ap_phi_mux_left_edge_loc_2_phi_fu_226_p4;
reg   [31:0] left_edge_loc_2_reg_223;
wire   [0:0] upper_edge_flag_1_fu_777_p2;
reg   [0:0] upper_edge_flag_2_reg_232;
wire   [31:0] height_assign_fu_783_p3;
reg   [31:0] upper_edge_new_2_reg_242;
wire   [31:0] upper_edge_loc_1_fu_790_p3;
reg   [31:0] ap_phi_mux_upper_edge_loc_2_phi_fu_255_p4;
reg   [31:0] upper_edge_loc_2_reg_252;
wire   [0:0] p_left_edge_flag1_fu_752_p2;
reg   [0:0] bottom_edge_flag_2_reg_261;
wire   [31:0] p_current_y_cord_load_1_fu_758_p3;
reg   [31:0] bottom_edge_new_2_reg_271;
wire   [31:0] p_current_y_cord_load_2_fu_766_p3;
reg   [31:0] ap_phi_mux_bottom_edge_loc_2_phi_fu_286_p4;
reg   [31:0] bottom_edge_loc_2_reg_283;
wire   [0:0] p_left_edge_flag_fu_703_p2;
reg   [0:0] right_edge_flag_2_reg_292;
wire   [31:0] p_current_x_cord_load_1_fu_709_p3;
reg   [31:0] right_edge_new_2_reg_302;
wire   [31:0] p_current_x_cord_load_2_fu_717_p3;
reg   [31:0] ap_phi_mux_right_edge_loc_2_phi_fu_317_p4;
reg   [31:0] right_edge_loc_2_reg_314;
reg   [0:0] ap_phi_mux_current_x_cord_flag_1_phi_fu_326_p4;
reg   [0:0] current_x_cord_flag_1_reg_323;
reg    ap_predicate_op141_write_state3;
reg    ap_block_state3;
wire   [31:0] storemerge_fu_1030_p3;
reg   [31:0] ap_phi_mux_current_x_cord_new_1_phi_fu_337_p4;
reg   [31:0] current_x_cord_new_1_reg_333;
wire   [0:0] current_y_cord_flag_1_fu_1007_p2;
reg   [0:0] ap_phi_mux_current_y_cord_flag_2_phi_fu_347_p4;
reg   [0:0] current_y_cord_flag_2_reg_344;
wire   [31:0] current_y_cord_new_1_fu_1013_p3;
reg   [31:0] ap_phi_mux_current_y_cord_new_2_phi_fu_357_p4;
reg   [31:0] current_y_cord_new_2_reg_353;
reg   [0:0] ap_phi_mux_left_edge_flag_3_phi_fu_367_p4;
reg   [0:0] left_edge_flag_3_reg_364;
reg   [31:0] ap_phi_mux_left_edge_new_3_phi_fu_377_p4;
reg   [31:0] left_edge_new_3_reg_374;
reg   [0:0] ap_phi_mux_upper_edge_flag_3_phi_fu_387_p4;
reg   [0:0] upper_edge_flag_3_reg_384;
reg   [31:0] ap_phi_mux_upper_edge_new_3_phi_fu_397_p4;
reg   [31:0] upper_edge_new_3_reg_394;
reg   [0:0] ap_phi_mux_bottom_edge_flag_3_phi_fu_407_p4;
reg   [0:0] bottom_edge_flag_3_reg_404;
reg   [31:0] ap_phi_mux_bottom_edge_new_3_phi_fu_418_p4;
reg   [31:0] bottom_edge_new_3_reg_414;
reg   [0:0] ap_phi_mux_right_edge_flag_3_phi_fu_429_p4;
reg   [0:0] right_edge_flag_3_reg_426;
reg   [31:0] ap_phi_mux_right_edge_new_3_phi_fu_440_p4;
reg   [31:0] right_edge_new_3_reg_436;
wire   [31:0] grp_fu_448_p2;
wire   [0:0] p_current_x_cord_load_fu_466_p0;
wire   [0:0] p_current_y_cord_load_fu_474_p0;
wire   [31:0] tmp_3_fu_482_p2;
wire   [23:0] tmp_21_fu_542_p1;
wire   [0:0] sel_tmp4_fu_587_p2;
wire   [7:0] r_V_cast_fu_555_p4;
wire   [7:0] r_V_fu_565_p4;
wire   [0:0] sel_tmp2_fu_581_p2;
wire   [0:0] sel_tmp_fu_575_p2;
wire   [7:0] r_V_1_fu_551_p1;
wire   [0:0] or_cond_fu_601_p2;
wire   [7:0] newSel_fu_593_p3;
wire   [7:0] newSel1_fu_607_p3;
wire   [7:0] newSel3_fu_623_p3;
wire   [7:0] newSel4_fu_631_p3;
wire   [7:0] tmp_1_fu_647_p3;
wire   [7:0] r_V_3_fu_655_p3;
wire   [7:0] r_V_2_fu_639_p3;
wire   [7:0] newSel2_fu_615_p3;
wire   [0:0] other2_below_fu_663_p2;
wire   [0:0] target_above_fu_675_p2;
wire   [0:0] tmp1_fu_681_p2;
wire   [0:0] other1_below_fu_669_p2;
wire   [0:0] tmp_s_fu_699_p2;
wire   [0:0] tmp_6_fu_724_p2;
wire   [0:0] tmp_7_fu_748_p2;
wire   [0:0] tmp_8_fu_773_p2;
wire   [31:0] tmp_9_fu_805_p2;
wire   [15:0] tmp_34_fu_835_p1;
wire   [15:0] tmp_29_fu_797_p1;
wire   [31:0] tmp_22_fu_839_p3;
wire   [15:0] tmp_33_fu_831_p1;
wire   [15:0] tmp_30_fu_801_p1;
wire   [63:0] tmp_23_fu_851_p4;
wire  signed [63:0] ud_edge_fu_847_p1;
wire   [63:0] val_assign_fu_861_p2;
wire   [31:0] p_neg1_fu_882_p2;
wire   [15:0] tmp_12_fu_887_p4;
wire   [0:0] tmp_31_fu_875_p3;
wire   [15:0] tmp_13_fu_897_p2;
wire   [15:0] tmp_15_fu_903_p4;
wire   [31:0] p_neg_fu_927_p2;
wire   [15:0] tmp_17_fu_932_p4;
wire   [0:0] tmp_32_fu_920_p3;
wire   [15:0] tmp_18_fu_942_p2;
wire   [15:0] tmp_19_fu_948_p4;
wire   [15:0] tmp_16_fu_912_p3;
wire   [15:0] tmp_20_fu_957_p3;
wire   [31:0] data_center_V_fu_965_p3;
wire   [31:0] p_0_fu_973_p3;
wire   [31:0] tmp_26_fu_990_p2;
wire   [0:0] current_y_cord_flag_1_fu_1007_p1;
wire   [31:0] storemerge1_fu_995_p3;
wire   [31:0] tmp_27_fu_1002_p2;
reg   [2:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 current_x_cord = 32'd0;
#0 current_y_cord = 32'd0;
#0 left_edge = 32'd0;
#0 upper_edge = 32'd0;
#0 bottom_edge = 32'd0;
#0 right_edge = 32'd0;
#0 led_exist = 1'd0;
#0 ap_CS_fsm = 3'd1;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if ((~((tmp_nbreadreq_fu_154_p3 == 1'd1) & (frame_in_V_empty_n == 1'b0)) & (tmp_nbreadreq_fu_154_p3 == 1'd1) & (or_cond_7_fu_687_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        bottom_edge_flag_2_reg_261 <= tmp_4_fu_488_p2;
    end else if (((or_cond_7_reg_1172 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        bottom_edge_flag_2_reg_261 <= p_left_edge_flag1_fu_752_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((~((tmp_nbreadreq_fu_154_p3 == 1'd1) & (frame_in_V_empty_n == 1'b0)) & (tmp_nbreadreq_fu_154_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        bottom_edge_flag_3_reg_404 <= tmp_4_fu_488_p2;
    end else if ((~((ap_predicate_op141_write_state3 == 1'b1) & (cord_out_V_full_n == 1'b0)) & (tmp_reg_1168 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        bottom_edge_flag_3_reg_404 <= bottom_edge_flag_2_reg_261;
    end
end

always @ (posedge ap_clk) begin
    if ((~((tmp_nbreadreq_fu_154_p3 == 1'd1) & (frame_in_V_empty_n == 1'b0)) & (tmp_nbreadreq_fu_154_p3 == 1'd1) & (or_cond_7_fu_687_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        bottom_edge_loc_2_reg_283 <= p_bottom_edge_load_fu_526_p3;
    end else if (((or_cond_7_reg_1172 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        bottom_edge_loc_2_reg_283 <= p_current_y_cord_load_2_fu_766_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((~((tmp_nbreadreq_fu_154_p3 == 1'd1) & (frame_in_V_empty_n == 1'b0)) & (tmp_nbreadreq_fu_154_p3 == 1'd1) & (or_cond_7_fu_687_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        bottom_edge_new_2_reg_271 <= 32'd0;
    end else if (((or_cond_7_reg_1172 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        bottom_edge_new_2_reg_271 <= p_current_y_cord_load_1_fu_758_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((~((tmp_nbreadreq_fu_154_p3 == 1'd1) & (frame_in_V_empty_n == 1'b0)) & (tmp_nbreadreq_fu_154_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        bottom_edge_new_3_reg_414 <= 32'd0;
    end else if ((~((ap_predicate_op141_write_state3 == 1'b1) & (cord_out_V_full_n == 1'b0)) & (tmp_reg_1168 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        bottom_edge_new_3_reg_414 <= bottom_edge_new_2_reg_271;
    end
end

always @ (posedge ap_clk) begin
    if ((~((tmp_nbreadreq_fu_154_p3 == 1'd1) & (frame_in_V_empty_n == 1'b0)) & (tmp_nbreadreq_fu_154_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        current_x_cord_flag_1_reg_323 <= reset;
    end else if ((~((ap_predicate_op141_write_state3 == 1'b1) & (cord_out_V_full_n == 1'b0)) & (tmp_reg_1168 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        current_x_cord_flag_1_reg_323 <= 1'd1;
    end
end

always @ (posedge ap_clk) begin
    if ((~((tmp_nbreadreq_fu_154_p3 == 1'd1) & (frame_in_V_empty_n == 1'b0)) & (tmp_nbreadreq_fu_154_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        current_x_cord_new_1_reg_333 <= 32'd0;
    end else if ((~((ap_predicate_op141_write_state3 == 1'b1) & (cord_out_V_full_n == 1'b0)) & (tmp_reg_1168 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        current_x_cord_new_1_reg_333 <= storemerge_fu_1030_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((~((tmp_nbreadreq_fu_154_p3 == 1'd1) & (frame_in_V_empty_n == 1'b0)) & (tmp_nbreadreq_fu_154_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        current_y_cord_flag_2_reg_344 <= reset;
    end else if ((~((ap_predicate_op141_write_state3 == 1'b1) & (cord_out_V_full_n == 1'b0)) & (tmp_reg_1168 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        current_y_cord_flag_2_reg_344 <= current_y_cord_flag_1_fu_1007_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((~((tmp_nbreadreq_fu_154_p3 == 1'd1) & (frame_in_V_empty_n == 1'b0)) & (tmp_nbreadreq_fu_154_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        current_y_cord_new_2_reg_353 <= 32'd0;
    end else if ((~((ap_predicate_op141_write_state3 == 1'b1) & (cord_out_V_full_n == 1'b0)) & (tmp_reg_1168 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        current_y_cord_new_2_reg_353 <= current_y_cord_new_1_fu_1013_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((~((tmp_nbreadreq_fu_154_p3 == 1'd1) & (frame_in_V_empty_n == 1'b0)) & (tmp_nbreadreq_fu_154_p3 == 1'd1) & (or_cond_7_fu_687_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        left_edge_flag_2_reg_203 <= tmp_4_fu_488_p2;
    end else if (((or_cond_7_reg_1172 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        left_edge_flag_2_reg_203 <= left_edge_flag_1_fu_728_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((~((tmp_nbreadreq_fu_154_p3 == 1'd1) & (frame_in_V_empty_n == 1'b0)) & (tmp_nbreadreq_fu_154_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        left_edge_flag_3_reg_364 <= tmp_4_fu_488_p2;
    end else if ((~((ap_predicate_op141_write_state3 == 1'b1) & (cord_out_V_full_n == 1'b0)) & (tmp_reg_1168 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        left_edge_flag_3_reg_364 <= left_edge_flag_2_reg_203;
    end
end

always @ (posedge ap_clk) begin
    if ((~((tmp_nbreadreq_fu_154_p3 == 1'd1) & (frame_in_V_empty_n == 1'b0)) & (tmp_nbreadreq_fu_154_p3 == 1'd1) & (or_cond_7_fu_687_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        left_edge_loc_2_reg_223 <= width_left_edge_load_fu_510_p3;
    end else if (((or_cond_7_reg_1172 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        left_edge_loc_2_reg_223 <= left_edge_loc_1_fu_741_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((~((tmp_nbreadreq_fu_154_p3 == 1'd1) & (frame_in_V_empty_n == 1'b0)) & (tmp_nbreadreq_fu_154_p3 == 1'd1) & (or_cond_7_fu_687_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        left_edge_new_2_reg_213 <= width;
    end else if (((or_cond_7_reg_1172 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        left_edge_new_2_reg_213 <= width_assign_fu_734_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((~((tmp_nbreadreq_fu_154_p3 == 1'd1) & (frame_in_V_empty_n == 1'b0)) & (tmp_nbreadreq_fu_154_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        left_edge_new_3_reg_374 <= width;
    end else if ((~((ap_predicate_op141_write_state3 == 1'b1) & (cord_out_V_full_n == 1'b0)) & (tmp_reg_1168 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        left_edge_new_3_reg_374 <= left_edge_new_2_reg_213;
    end
end

always @ (posedge ap_clk) begin
    if ((~((tmp_nbreadreq_fu_154_p3 == 1'd1) & (frame_in_V_empty_n == 1'b0)) & (tmp_nbreadreq_fu_154_p3 == 1'd1) & (or_cond_7_fu_687_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        right_edge_flag_2_reg_292 <= tmp_4_fu_488_p2;
    end else if (((or_cond_7_reg_1172 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        right_edge_flag_2_reg_292 <= p_left_edge_flag_fu_703_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((~((tmp_nbreadreq_fu_154_p3 == 1'd1) & (frame_in_V_empty_n == 1'b0)) & (tmp_nbreadreq_fu_154_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        right_edge_flag_3_reg_426 <= tmp_4_fu_488_p2;
    end else if ((~((ap_predicate_op141_write_state3 == 1'b1) & (cord_out_V_full_n == 1'b0)) & (tmp_reg_1168 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        right_edge_flag_3_reg_426 <= right_edge_flag_2_reg_292;
    end
end

always @ (posedge ap_clk) begin
    if ((~((tmp_nbreadreq_fu_154_p3 == 1'd1) & (frame_in_V_empty_n == 1'b0)) & (tmp_nbreadreq_fu_154_p3 == 1'd1) & (or_cond_7_fu_687_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        right_edge_loc_2_reg_314 <= p_right_edge_load_fu_534_p3;
    end else if (((or_cond_7_reg_1172 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        right_edge_loc_2_reg_314 <= p_current_x_cord_load_2_fu_717_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((~((tmp_nbreadreq_fu_154_p3 == 1'd1) & (frame_in_V_empty_n == 1'b0)) & (tmp_nbreadreq_fu_154_p3 == 1'd1) & (or_cond_7_fu_687_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        right_edge_new_2_reg_302 <= 32'd0;
    end else if (((or_cond_7_reg_1172 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        right_edge_new_2_reg_302 <= p_current_x_cord_load_1_fu_709_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((~((tmp_nbreadreq_fu_154_p3 == 1'd1) & (frame_in_V_empty_n == 1'b0)) & (tmp_nbreadreq_fu_154_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        right_edge_new_3_reg_436 <= 32'd0;
    end else if ((~((ap_predicate_op141_write_state3 == 1'b1) & (cord_out_V_full_n == 1'b0)) & (tmp_reg_1168 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        right_edge_new_3_reg_436 <= right_edge_new_2_reg_302;
    end
end

always @ (posedge ap_clk) begin
    if ((~((tmp_nbreadreq_fu_154_p3 == 1'd1) & (frame_in_V_empty_n == 1'b0)) & (tmp_nbreadreq_fu_154_p3 == 1'd1) & (or_cond_7_fu_687_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        upper_edge_flag_2_reg_232 <= tmp_4_fu_488_p2;
    end else if (((or_cond_7_reg_1172 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        upper_edge_flag_2_reg_232 <= upper_edge_flag_1_fu_777_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((~((tmp_nbreadreq_fu_154_p3 == 1'd1) & (frame_in_V_empty_n == 1'b0)) & (tmp_nbreadreq_fu_154_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        upper_edge_flag_3_reg_384 <= tmp_4_fu_488_p2;
    end else if ((~((ap_predicate_op141_write_state3 == 1'b1) & (cord_out_V_full_n == 1'b0)) & (tmp_reg_1168 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        upper_edge_flag_3_reg_384 <= upper_edge_flag_2_reg_232;
    end
end

always @ (posedge ap_clk) begin
    if ((~((tmp_nbreadreq_fu_154_p3 == 1'd1) & (frame_in_V_empty_n == 1'b0)) & (tmp_nbreadreq_fu_154_p3 == 1'd1) & (or_cond_7_fu_687_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        upper_edge_loc_2_reg_252 <= height_upper_edge_lo_fu_518_p3;
    end else if (((or_cond_7_reg_1172 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        upper_edge_loc_2_reg_252 <= upper_edge_loc_1_fu_790_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((~((tmp_nbreadreq_fu_154_p3 == 1'd1) & (frame_in_V_empty_n == 1'b0)) & (tmp_nbreadreq_fu_154_p3 == 1'd1) & (or_cond_7_fu_687_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        upper_edge_new_2_reg_242 <= height;
    end else if (((or_cond_7_reg_1172 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        upper_edge_new_2_reg_242 <= height_assign_fu_783_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((~((tmp_nbreadreq_fu_154_p3 == 1'd1) & (frame_in_V_empty_n == 1'b0)) & (tmp_nbreadreq_fu_154_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        upper_edge_new_3_reg_394 <= height;
    end else if ((~((ap_predicate_op141_write_state3 == 1'b1) & (cord_out_V_full_n == 1'b0)) & (tmp_reg_1168 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        upper_edge_new_3_reg_394 <= upper_edge_new_2_reg_242;
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_predicate_op141_write_state3 == 1'b1) & (cord_out_V_full_n == 1'b0)) & (ap_phi_mux_bottom_edge_flag_3_phi_fu_407_p4 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        bottom_edge <= ap_phi_mux_bottom_edge_new_3_phi_fu_418_p4;
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_predicate_op141_write_state3 == 1'b1) & (cord_out_V_full_n == 1'b0)) & (ap_phi_mux_current_x_cord_flag_1_phi_fu_326_p4 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        current_x_cord <= ap_phi_mux_current_x_cord_new_1_phi_fu_337_p4;
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_predicate_op141_write_state3 == 1'b1) & (cord_out_V_full_n == 1'b0)) & (ap_phi_mux_current_y_cord_flag_2_phi_fu_347_p4 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        current_y_cord <= ap_phi_mux_current_y_cord_new_2_phi_fu_357_p4;
    end
end

always @ (posedge ap_clk) begin
    if ((~((tmp_nbreadreq_fu_154_p3 == 1'd1) & (frame_in_V_empty_n == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        height_upper_edge_lo_reg_1147 <= height_upper_edge_lo_fu_518_p3;
        p_bottom_edge_load_reg_1154 <= p_bottom_edge_load_fu_526_p3;
        p_current_x_cord_load_reg_1099 <= p_current_x_cord_load_fu_466_p3;
        p_current_y_cord_load_reg_1111 <= p_current_y_cord_load_fu_474_p3;
        p_right_edge_load_reg_1161 <= p_right_edge_load_fu_534_p3;
        tmp_4_reg_1124 <= tmp_4_fu_488_p2;
        tmp_reg_1168 <= frame_in_V_empty_n;
        width_left_edge_load_reg_1140 <= width_left_edge_load_fu_510_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((~((tmp_nbreadreq_fu_154_p3 == 1'd1) & (frame_in_V_empty_n == 1'b0)) & (or_cond_7_fu_687_p2 == 1'd1) & (tmp_nbreadreq_fu_154_p3 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        led_exist <= 1'd1;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_5_fu_810_p2 == 1'd1) & (grp_fu_453_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        led_exist_load_reg_1185 <= led_exist;
        p_4_reg_1204 <= p_4_fu_867_p3;
        tmp_11_reg_1190 <= tmp_11_fu_819_p2;
        tmp_14_reg_1197 <= tmp_14_fu_825_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_predicate_op141_write_state3 == 1'b1) & (cord_out_V_full_n == 1'b0)) & (ap_phi_mux_left_edge_flag_3_phi_fu_367_p4 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        left_edge <= ap_phi_mux_left_edge_new_3_phi_fu_377_p4;
    end
end

always @ (posedge ap_clk) begin
    if ((~((tmp_nbreadreq_fu_154_p3 == 1'd1) & (frame_in_V_empty_n == 1'b0)) & (tmp_nbreadreq_fu_154_p3 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        or_cond_7_reg_1172 <= or_cond_7_fu_687_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_predicate_op141_write_state3 == 1'b1) & (cord_out_V_full_n == 1'b0)) & (ap_phi_mux_right_edge_flag_3_phi_fu_429_p4 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        right_edge <= ap_phi_mux_right_edge_new_3_phi_fu_440_p4;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_5_fu_810_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        tmp_10_reg_1181 <= grp_fu_453_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        tmp_5_reg_1176 <= tmp_5_fu_810_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_predicate_op141_write_state3 == 1'b1) & (cord_out_V_full_n == 1'b0)) & (ap_phi_mux_upper_edge_flag_3_phi_fu_387_p4 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        upper_edge <= ap_phi_mux_upper_edge_new_3_phi_fu_397_p4;
    end
end

always @ (*) begin
    if (((tmp_reg_1168 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        ap_phi_mux_bottom_edge_flag_3_phi_fu_407_p4 = bottom_edge_flag_2_reg_261;
    end else begin
        ap_phi_mux_bottom_edge_flag_3_phi_fu_407_p4 = bottom_edge_flag_3_reg_404;
    end
end

always @ (*) begin
    if (((or_cond_7_reg_1172 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_phi_mux_bottom_edge_loc_2_phi_fu_286_p4 = p_current_y_cord_load_2_fu_766_p3;
    end else begin
        ap_phi_mux_bottom_edge_loc_2_phi_fu_286_p4 = bottom_edge_loc_2_reg_283;
    end
end

always @ (*) begin
    if (((tmp_reg_1168 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        ap_phi_mux_bottom_edge_new_3_phi_fu_418_p4 = bottom_edge_new_2_reg_271;
    end else begin
        ap_phi_mux_bottom_edge_new_3_phi_fu_418_p4 = bottom_edge_new_3_reg_414;
    end
end

always @ (*) begin
    if (((tmp_reg_1168 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        ap_phi_mux_current_x_cord_flag_1_phi_fu_326_p4 = 1'd1;
    end else begin
        ap_phi_mux_current_x_cord_flag_1_phi_fu_326_p4 = current_x_cord_flag_1_reg_323;
    end
end

always @ (*) begin
    if (((tmp_reg_1168 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        ap_phi_mux_current_x_cord_new_1_phi_fu_337_p4 = storemerge_fu_1030_p3;
    end else begin
        ap_phi_mux_current_x_cord_new_1_phi_fu_337_p4 = current_x_cord_new_1_reg_333;
    end
end

always @ (*) begin
    if (((tmp_reg_1168 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        ap_phi_mux_current_y_cord_flag_2_phi_fu_347_p4 = current_y_cord_flag_1_fu_1007_p2;
    end else begin
        ap_phi_mux_current_y_cord_flag_2_phi_fu_347_p4 = current_y_cord_flag_2_reg_344;
    end
end

always @ (*) begin
    if (((tmp_reg_1168 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        ap_phi_mux_current_y_cord_new_2_phi_fu_357_p4 = current_y_cord_new_1_fu_1013_p3;
    end else begin
        ap_phi_mux_current_y_cord_new_2_phi_fu_357_p4 = current_y_cord_new_2_reg_353;
    end
end

always @ (*) begin
    if (((tmp_reg_1168 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        ap_phi_mux_left_edge_flag_3_phi_fu_367_p4 = left_edge_flag_2_reg_203;
    end else begin
        ap_phi_mux_left_edge_flag_3_phi_fu_367_p4 = left_edge_flag_3_reg_364;
    end
end

always @ (*) begin
    if (((or_cond_7_reg_1172 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_phi_mux_left_edge_loc_2_phi_fu_226_p4 = left_edge_loc_1_fu_741_p3;
    end else begin
        ap_phi_mux_left_edge_loc_2_phi_fu_226_p4 = left_edge_loc_2_reg_223;
    end
end

always @ (*) begin
    if (((tmp_reg_1168 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        ap_phi_mux_left_edge_new_3_phi_fu_377_p4 = left_edge_new_2_reg_213;
    end else begin
        ap_phi_mux_left_edge_new_3_phi_fu_377_p4 = left_edge_new_3_reg_374;
    end
end

always @ (*) begin
    if (((tmp_reg_1168 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        ap_phi_mux_right_edge_flag_3_phi_fu_429_p4 = right_edge_flag_2_reg_292;
    end else begin
        ap_phi_mux_right_edge_flag_3_phi_fu_429_p4 = right_edge_flag_3_reg_426;
    end
end

always @ (*) begin
    if (((or_cond_7_reg_1172 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_phi_mux_right_edge_loc_2_phi_fu_317_p4 = p_current_x_cord_load_2_fu_717_p3;
    end else begin
        ap_phi_mux_right_edge_loc_2_phi_fu_317_p4 = right_edge_loc_2_reg_314;
    end
end

always @ (*) begin
    if (((tmp_reg_1168 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        ap_phi_mux_right_edge_new_3_phi_fu_440_p4 = right_edge_new_2_reg_302;
    end else begin
        ap_phi_mux_right_edge_new_3_phi_fu_440_p4 = right_edge_new_3_reg_436;
    end
end

always @ (*) begin
    if (((tmp_reg_1168 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        ap_phi_mux_upper_edge_flag_3_phi_fu_387_p4 = upper_edge_flag_2_reg_232;
    end else begin
        ap_phi_mux_upper_edge_flag_3_phi_fu_387_p4 = upper_edge_flag_3_reg_384;
    end
end

always @ (*) begin
    if (((or_cond_7_reg_1172 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_phi_mux_upper_edge_loc_2_phi_fu_255_p4 = upper_edge_loc_1_fu_790_p3;
    end else begin
        ap_phi_mux_upper_edge_loc_2_phi_fu_255_p4 = upper_edge_loc_2_reg_252;
    end
end

always @ (*) begin
    if (((tmp_reg_1168 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        ap_phi_mux_upper_edge_new_3_phi_fu_397_p4 = upper_edge_new_2_reg_242;
    end else begin
        ap_phi_mux_upper_edge_new_3_phi_fu_397_p4 = upper_edge_new_3_reg_394;
    end
end

always @ (*) begin
    if (((tmp_10_reg_1181 == 1'd1) & (tmp_5_reg_1176 == 1'd1) & (tmp_reg_1168 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        cord_out_V_blk_n = cord_out_V_full_n;
    end else begin
        cord_out_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_predicate_op141_write_state3 == 1'b1) & (cord_out_V_full_n == 1'b0)) & (ap_predicate_op141_write_state3 == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
        cord_out_V_write = 1'b1;
    end else begin
        cord_out_V_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_predicate_op141_write_state3 == 1'b1) & (cord_out_V_full_n == 1'b0)) & (ap_predicate_op141_write_state3 == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
        edgeout_val_ap_vld = 1'b1;
    end else begin
        edgeout_val_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_nbreadreq_fu_154_p3 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        frame_in_V_blk_n = frame_in_V_empty_n;
    end else begin
        frame_in_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((tmp_nbreadreq_fu_154_p3 == 1'd1) & (frame_in_V_empty_n == 1'b0)) & (tmp_nbreadreq_fu_154_p3 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        frame_in_V_read = 1'b1;
    end else begin
        frame_in_V_read = 1'b0;
    end
end

always @ (*) begin
    if ((~((tmp_nbreadreq_fu_154_p3 == 1'd1) & (frame_in_V_empty_n == 1'b0)) & (tmp_nbreadreq_fu_154_p3 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        pixel_in_data_out_ap_vld = 1'b1;
    end else begin
        pixel_in_data_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_predicate_op141_write_state3 == 1'b1) & (cord_out_V_full_n == 1'b0)) & (tmp_reg_1168 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        x_cord_out_ap_vld = 1'b1;
    end else begin
        x_cord_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_predicate_op141_write_state3 == 1'b1) & (cord_out_V_full_n == 1'b0)) & (tmp_reg_1168 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        y_cord_out_ap_vld = 1'b1;
    end else begin
        y_cord_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((tmp_nbreadreq_fu_154_p3 == 1'd1) & (frame_in_V_empty_n == 1'b0)) & (tmp_nbreadreq_fu_154_p3 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else if ((~((tmp_nbreadreq_fu_154_p3 == 1'd1) & (frame_in_V_empty_n == 1'b0)) & (tmp_nbreadreq_fu_154_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            if ((~((ap_predicate_op141_write_state3 == 1'b1) & (cord_out_V_full_n == 1'b0)) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

always @ (*) begin
    ap_block_state1 = ((tmp_nbreadreq_fu_154_p3 == 1'd1) & (frame_in_V_empty_n == 1'b0));
end

always @ (*) begin
    ap_block_state3 = ((ap_predicate_op141_write_state3 == 1'b1) & (cord_out_V_full_n == 1'b0));
end

always @ (*) begin
    ap_predicate_op141_write_state3 = ((tmp_10_reg_1181 == 1'd1) & (tmp_5_reg_1176 == 1'd1) & (tmp_reg_1168 == 1'd1));
end

assign cord_out_V_din = {{{{1'd1}, {p_4_reg_1204}}}, {p_0_fu_973_p3}};

assign current_y_cord_flag_1_fu_1007_p1 = reset;

assign current_y_cord_flag_1_fu_1007_p2 = (grp_fu_453_p2 | current_y_cord_flag_1_fu_1007_p1);

assign current_y_cord_new_1_fu_1013_p3 = ((grp_fu_453_p2[0:0] === 1'b1) ? storemerge1_fu_995_p3 : 32'd0);

assign data_center_V_fu_965_p3 = {{tmp_16_fu_912_p3}, {tmp_20_fu_957_p3}};

assign edgeout_val = p_4_reg_1204;

assign grp_fu_448_p2 = ($signed(width) + $signed(32'd4294967295));

assign grp_fu_453_p2 = ((p_current_x_cord_load_reg_1099 == grp_fu_448_p2) ? 1'b1 : 1'b0);

assign height_assign_fu_783_p3 = ((tmp_8_fu_773_p2[0:0] === 1'b1) ? p_current_y_cord_load_reg_1111 : height);

assign height_upper_edge_lo_fu_518_p3 = ((tmp_4_fu_488_p2[0:0] === 1'b1) ? height : upper_edge);

assign left_edge_flag_1_fu_728_p2 = (tmp_6_fu_724_p2 | tmp_4_reg_1124);

assign left_edge_loc_1_fu_741_p3 = ((tmp_6_fu_724_p2[0:0] === 1'b1) ? p_current_x_cord_load_reg_1099 : width_left_edge_load_reg_1140);

assign newSel1_fu_607_p3 = ((sel_tmp_fu_575_p2[0:0] === 1'b1) ? r_V_1_fu_551_p1 : r_V_cast_fu_555_p4);

assign newSel2_fu_615_p3 = ((or_cond_fu_601_p2[0:0] === 1'b1) ? newSel_fu_593_p3 : newSel1_fu_607_p3);

assign newSel3_fu_623_p3 = ((sel_tmp4_fu_587_p2[0:0] === 1'b1) ? r_V_fu_565_p4 : r_V_cast_fu_555_p4);

assign newSel4_fu_631_p3 = ((sel_tmp_fu_575_p2[0:0] === 1'b1) ? r_V_cast_fu_555_p4 : r_V_fu_565_p4);

assign newSel_fu_593_p3 = ((sel_tmp4_fu_587_p2[0:0] === 1'b1) ? r_V_cast_fu_555_p4 : r_V_fu_565_p4);

assign or_cond_7_fu_687_p2 = (tmp1_fu_681_p2 & other1_below_fu_669_p2);

assign or_cond_fu_601_p2 = (sel_tmp4_fu_587_p2 | sel_tmp2_fu_581_p2);

assign other1_below_fu_669_p2 = ((r_V_2_fu_639_p3 < other_threshold) ? 1'b1 : 1'b0);

assign other2_below_fu_663_p2 = ((r_V_3_fu_655_p3 < other_threshold) ? 1'b1 : 1'b0);

assign p_0_fu_973_p3 = ((led_exist_load_reg_1185[0:0] === 1'b1) ? data_center_V_fu_965_p3 : 32'd4294967295);

assign p_4_fu_867_p3 = ((led_exist[0:0] === 1'b1) ? val_assign_fu_861_p2 : 64'd4294967295);

assign p_bottom_edge_load_fu_526_p3 = ((tmp_4_fu_488_p2[0:0] === 1'b1) ? 32'd0 : bottom_edge);

assign p_current_x_cord_load_1_fu_709_p3 = ((tmp_s_fu_699_p2[0:0] === 1'b1) ? p_current_x_cord_load_reg_1099 : 32'd0);

assign p_current_x_cord_load_2_fu_717_p3 = ((tmp_s_fu_699_p2[0:0] === 1'b1) ? p_current_x_cord_load_reg_1099 : p_right_edge_load_reg_1161);

assign p_current_x_cord_load_fu_466_p0 = reset;

assign p_current_x_cord_load_fu_466_p3 = ((p_current_x_cord_load_fu_466_p0[0:0] === 1'b1) ? 32'd0 : current_x_cord);

assign p_current_y_cord_load_1_fu_758_p3 = ((tmp_7_fu_748_p2[0:0] === 1'b1) ? p_current_y_cord_load_reg_1111 : 32'd0);

assign p_current_y_cord_load_2_fu_766_p3 = ((tmp_7_fu_748_p2[0:0] === 1'b1) ? p_current_y_cord_load_reg_1111 : p_bottom_edge_load_reg_1154);

assign p_current_y_cord_load_fu_474_p0 = reset;

assign p_current_y_cord_load_fu_474_p3 = ((p_current_y_cord_load_fu_474_p0[0:0] === 1'b1) ? 32'd0 : current_y_cord);

assign p_left_edge_flag1_fu_752_p2 = (tmp_7_fu_748_p2 | tmp_4_reg_1124);

assign p_left_edge_flag_fu_703_p2 = (tmp_s_fu_699_p2 | tmp_4_reg_1124);

assign p_neg1_fu_882_p2 = (32'd0 - tmp_11_reg_1190);

assign p_neg_fu_927_p2 = (32'd0 - tmp_14_reg_1197);

assign p_right_edge_load_fu_534_p3 = ((tmp_4_fu_488_p2[0:0] === 1'b1) ? 32'd0 : right_edge);

assign pixel_in_data_out = tmp_21_fu_542_p1;

assign r_V_1_fu_551_p1 = frame_in_V_dout[7:0];

assign r_V_2_fu_639_p3 = ((or_cond_fu_601_p2[0:0] === 1'b1) ? newSel3_fu_623_p3 : newSel4_fu_631_p3);

assign r_V_3_fu_655_p3 = ((or_cond_fu_601_p2[0:0] === 1'b1) ? r_V_1_fu_551_p1 : tmp_1_fu_647_p3);

assign r_V_cast_fu_555_p4 = {{frame_in_V_dout[23:16]}};

assign r_V_fu_565_p4 = {{frame_in_V_dout[15:8]}};

assign sel_tmp2_fu_581_p2 = ((target_color == 8'd2) ? 1'b1 : 1'b0);

assign sel_tmp4_fu_587_p2 = ((target_color == 8'd1) ? 1'b1 : 1'b0);

assign sel_tmp_fu_575_p2 = ((target_color == 8'd3) ? 1'b1 : 1'b0);

assign storemerge1_fu_995_p3 = ((tmp_5_reg_1176[0:0] === 1'b1) ? 32'd0 : tmp_26_fu_990_p2);

assign storemerge_fu_1030_p3 = ((grp_fu_453_p2[0:0] === 1'b1) ? 32'd0 : tmp_27_fu_1002_p2);

assign target_above_fu_675_p2 = ((newSel2_fu_615_p3 > target_threshold) ? 1'b1 : 1'b0);

assign tmp1_fu_681_p2 = (target_above_fu_675_p2 & other2_below_fu_663_p2);

assign tmp_11_fu_819_p2 = (ap_phi_mux_right_edge_loc_2_phi_fu_317_p4 + ap_phi_mux_left_edge_loc_2_phi_fu_226_p4);

assign tmp_12_fu_887_p4 = {{p_neg1_fu_882_p2[16:1]}};

assign tmp_13_fu_897_p2 = (16'd0 - tmp_12_fu_887_p4);

assign tmp_14_fu_825_p2 = (ap_phi_mux_bottom_edge_loc_2_phi_fu_286_p4 + ap_phi_mux_upper_edge_loc_2_phi_fu_255_p4);

assign tmp_15_fu_903_p4 = {{tmp_11_reg_1190[16:1]}};

assign tmp_16_fu_912_p3 = ((tmp_31_fu_875_p3[0:0] === 1'b1) ? tmp_13_fu_897_p2 : tmp_15_fu_903_p4);

assign tmp_17_fu_932_p4 = {{p_neg_fu_927_p2[16:1]}};

assign tmp_18_fu_942_p2 = (16'd0 - tmp_17_fu_932_p4);

assign tmp_19_fu_948_p4 = {{tmp_14_reg_1197[16:1]}};

assign tmp_1_fu_647_p3 = ((sel_tmp_fu_575_p2[0:0] === 1'b1) ? r_V_fu_565_p4 : r_V_1_fu_551_p1);

assign tmp_20_fu_957_p3 = ((tmp_32_fu_920_p3[0:0] === 1'b1) ? tmp_18_fu_942_p2 : tmp_19_fu_948_p4);

assign tmp_21_fu_542_p1 = frame_in_V_dout[23:0];

assign tmp_22_fu_839_p3 = {{tmp_34_fu_835_p1}, {tmp_29_fu_797_p1}};

assign tmp_23_fu_851_p4 = {{{tmp_33_fu_831_p1}, {tmp_30_fu_801_p1}}, {32'd0}};

assign tmp_26_fu_990_p2 = (p_current_y_cord_load_reg_1111 + 32'd1);

assign tmp_27_fu_1002_p2 = (p_current_x_cord_load_reg_1099 + 32'd1);

assign tmp_29_fu_797_p1 = ap_phi_mux_bottom_edge_loc_2_phi_fu_286_p4[15:0];

assign tmp_30_fu_801_p1 = ap_phi_mux_right_edge_loc_2_phi_fu_317_p4[15:0];

assign tmp_31_fu_875_p3 = tmp_11_reg_1190[32'd31];

assign tmp_32_fu_920_p3 = tmp_14_reg_1197[32'd31];

assign tmp_33_fu_831_p1 = ap_phi_mux_left_edge_loc_2_phi_fu_226_p4[15:0];

assign tmp_34_fu_835_p1 = ap_phi_mux_upper_edge_loc_2_phi_fu_255_p4[15:0];

assign tmp_3_fu_482_p2 = (p_current_y_cord_load_fu_474_p3 | p_current_x_cord_load_fu_466_p3);

assign tmp_4_fu_488_p2 = ((tmp_3_fu_482_p2 == 32'd0) ? 1'b1 : 1'b0);

assign tmp_5_fu_810_p2 = ((p_current_y_cord_load_reg_1111 == tmp_9_fu_805_p2) ? 1'b1 : 1'b0);

assign tmp_6_fu_724_p2 = (($signed(p_current_x_cord_load_reg_1099) < $signed(width_left_edge_load_reg_1140)) ? 1'b1 : 1'b0);

assign tmp_7_fu_748_p2 = (($signed(p_current_y_cord_load_reg_1111) > $signed(p_bottom_edge_load_reg_1154)) ? 1'b1 : 1'b0);

assign tmp_8_fu_773_p2 = (($signed(p_current_y_cord_load_reg_1111) < $signed(height_upper_edge_lo_reg_1147)) ? 1'b1 : 1'b0);

assign tmp_9_fu_805_p2 = ($signed(32'd4294967295) + $signed(height));

assign tmp_nbreadreq_fu_154_p3 = frame_in_V_empty_n;

assign tmp_s_fu_699_p2 = (($signed(p_current_x_cord_load_reg_1099) > $signed(p_right_edge_load_reg_1161)) ? 1'b1 : 1'b0);

assign ud_edge_fu_847_p1 = $signed(tmp_22_fu_839_p3);

assign upper_edge_flag_1_fu_777_p2 = (tmp_8_fu_773_p2 | tmp_4_reg_1124);

assign upper_edge_loc_1_fu_790_p3 = ((tmp_8_fu_773_p2[0:0] === 1'b1) ? p_current_y_cord_load_reg_1111 : height_upper_edge_lo_reg_1147);

assign val_assign_fu_861_p2 = (ud_edge_fu_847_p1 | tmp_23_fu_851_p4);

assign width_assign_fu_734_p3 = ((tmp_6_fu_724_p2[0:0] === 1'b1) ? p_current_x_cord_load_reg_1099 : width);

assign width_left_edge_load_fu_510_p3 = ((tmp_4_fu_488_p2[0:0] === 1'b1) ? width : left_edge);

assign x_cord_out = ((grp_fu_453_p2[0:0] === 1'b1) ? 32'd0 : tmp_27_fu_1002_p2);

assign y_cord_out = ((grp_fu_453_p2[0:0] === 1'b1) ? storemerge1_fu_995_p3 : p_current_y_cord_load_reg_1111);

endmodule //det_color_cord
