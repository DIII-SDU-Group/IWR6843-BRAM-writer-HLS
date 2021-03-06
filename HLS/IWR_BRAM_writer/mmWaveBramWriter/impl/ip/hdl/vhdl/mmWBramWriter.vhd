-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Version: 2020.2
-- Copyright (C) Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mmWBramWriter is
generic (
    C_S_AXI_CONTROL_ADDR_WIDTH : INTEGER := 4;
    C_S_AXI_CONTROL_DATA_WIDTH : INTEGER := 32 );
port (
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    buffer_in_address0 : OUT STD_LOGIC_VECTOR (4 downto 0);
    buffer_in_ce0 : OUT STD_LOGIC;
    buffer_in_q0 : IN STD_LOGIC_VECTOR (127 downto 0);
    buffer_out_address0 : OUT STD_LOGIC_VECTOR (7 downto 0);
    buffer_out_ce0 : OUT STD_LOGIC;
    buffer_out_we0 : OUT STD_LOGIC;
    buffer_out_d0 : OUT STD_LOGIC_VECTOR (31 downto 0);
    s_axi_control_AWVALID : IN STD_LOGIC;
    s_axi_control_AWREADY : OUT STD_LOGIC;
    s_axi_control_AWADDR : IN STD_LOGIC_VECTOR (C_S_AXI_CONTROL_ADDR_WIDTH-1 downto 0);
    s_axi_control_WVALID : IN STD_LOGIC;
    s_axi_control_WREADY : OUT STD_LOGIC;
    s_axi_control_WDATA : IN STD_LOGIC_VECTOR (C_S_AXI_CONTROL_DATA_WIDTH-1 downto 0);
    s_axi_control_WSTRB : IN STD_LOGIC_VECTOR (C_S_AXI_CONTROL_DATA_WIDTH/8-1 downto 0);
    s_axi_control_ARVALID : IN STD_LOGIC;
    s_axi_control_ARREADY : OUT STD_LOGIC;
    s_axi_control_ARADDR : IN STD_LOGIC_VECTOR (C_S_AXI_CONTROL_ADDR_WIDTH-1 downto 0);
    s_axi_control_RVALID : OUT STD_LOGIC;
    s_axi_control_RREADY : IN STD_LOGIC;
    s_axi_control_RDATA : OUT STD_LOGIC_VECTOR (C_S_AXI_CONTROL_DATA_WIDTH-1 downto 0);
    s_axi_control_RRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
    s_axi_control_BVALID : OUT STD_LOGIC;
    s_axi_control_BREADY : IN STD_LOGIC;
    s_axi_control_BRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
    interrupt : OUT STD_LOGIC );
end;


architecture behav of mmWBramWriter is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "mmWBramWriter_mmWBramWriter,hls_ip_2020_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xczu3eg-sbva484-1-i,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=4.950000,HLS_SYN_LAT=-1,HLS_SYN_TPT=none,HLS_SYN_MEM=4,HLS_SYN_DSP=0,HLS_SYN_FF=270,HLS_SYN_LUT=587,HLS_VERSION=2020_2}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (7 downto 0) := "00000001";
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (7 downto 0) := "00000010";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (7 downto 0) := "00000100";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (7 downto 0) := "00001000";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (7 downto 0) := "00010000";
    constant ap_ST_fsm_state7 : STD_LOGIC_VECTOR (7 downto 0) := "00100000";
    constant ap_ST_fsm_state8 : STD_LOGIC_VECTOR (7 downto 0) := "01000000";
    constant ap_ST_fsm_state9 : STD_LOGIC_VECTOR (7 downto 0) := "10000000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant C_S_AXI_DATA_WIDTH : INTEGER range 63 downto 0 := 20;
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv6_0 : STD_LOGIC_VECTOR (5 downto 0) := "000000";
    constant ap_const_lv32_20 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000100000";
    constant ap_const_lv32_7 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000111";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv64_0 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv32_5 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000101";
    constant ap_const_lv32_6 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000110";
    constant ap_const_lv6_1 : STD_LOGIC_VECTOR (5 downto 0) := "000001";
    constant ap_const_lv6_20 : STD_LOGIC_VECTOR (5 downto 0) := "100000";
    constant ap_const_lv128_lc_1 : STD_LOGIC_VECTOR (127 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv32_60 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001100000";
    constant ap_const_lv32_7F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001111111";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv8_1 : STD_LOGIC_VECTOR (7 downto 0) := "00000001";
    constant ap_const_lv32_40 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001000000";
    constant ap_const_lv32_5F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001011111";
    constant ap_const_lv32_3F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111111";
    constant ap_const_lv8_2 : STD_LOGIC_VECTOR (7 downto 0) := "00000010";
    constant ap_const_lv8_3 : STD_LOGIC_VECTOR (7 downto 0) := "00000011";
    constant ap_const_lv8_4 : STD_LOGIC_VECTOR (7 downto 0) := "00000100";

    signal ap_rst_n_inv : STD_LOGIC;
    signal ap_start : STD_LOGIC;
    signal ap_done : STD_LOGIC;
    signal ap_idle : STD_LOGIC;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (7 downto 0) := "00000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal ap_ready : STD_LOGIC;
    signal i_reg_170 : STD_LOGIC_VECTOR (5 downto 0);
    signal last_point_reg_182 : STD_LOGIC_VECTOR (0 downto 0);
    signal n_points_1_reg_194 : STD_LOGIC_VECTOR (31 downto 0);
    signal add_ln30_fu_218_p2 : STD_LOGIC_VECTOR (5 downto 0);
    signal add_ln30_reg_384 : STD_LOGIC_VECTOR (5 downto 0);
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC := '0';
    signal ap_block_state2_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state3_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal icmp_ln30_fu_224_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln30_reg_389 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cast_fu_230_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_cast_reg_393 : STD_LOGIC_VECTOR (63 downto 0);
    signal n_points_fu_257_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal last_point_1_fu_265_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal add_ln54_fu_280_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal add_ln54_reg_413 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal icmp_ln54_fu_291_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal trunc_ln60_fu_297_p1 : STD_LOGIC_VECTOR (5 downto 0);
    signal trunc_ln60_reg_426 : STD_LOGIC_VECTOR (5 downto 0);
    signal shl_ln_fu_312_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal shl_ln_reg_431 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_CS_fsm_state6 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state6 : signal is "none";
    signal p_Result_1_reg_438 : STD_LOGIC_VECTOR (31 downto 0);
    signal p_Result_2_reg_443 : STD_LOGIC_VECTOR (31 downto 0);
    signal trunc_ln708_fu_350_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal trunc_ln708_reg_448 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal ap_condition_pp0_exit_iter0_state2 : STD_LOGIC;
    signal buffer_V_address0 : STD_LOGIC_VECTOR (4 downto 0);
    signal buffer_V_ce0 : STD_LOGIC;
    signal buffer_V_we0 : STD_LOGIC;
    signal buffer_V_d0 : STD_LOGIC_VECTOR (127 downto 0);
    signal buffer_V_q0 : STD_LOGIC_VECTOR (127 downto 0);
    signal ap_phi_mux_i_phi_fu_174_p4 : STD_LOGIC_VECTOR (5 downto 0);
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal i_1_reg_207 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state9 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state9 : signal is "none";
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal zext_ln54_fu_286_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln57_fu_325_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln58_fu_359_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_CS_fsm_state7 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state7 : signal is "none";
    signal zext_ln59_fu_369_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_CS_fsm_state8 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state8 : signal is "none";
    signal zext_ln60_fu_379_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal trunc_ln32_fu_241_p1 : STD_LOGIC_VECTOR (4 downto 0);
    signal zext_ln32_fu_245_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal icmp_ln870_fu_235_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln32_fu_249_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal or_ln57_fu_319_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal or_ln58_fu_354_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal or_ln59_fu_364_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal add_ln60_fu_374_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component mmWBramWriter_buffer_V IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (4 downto 0);
        ce0 : IN STD_LOGIC;
        we0 : IN STD_LOGIC;
        d0 : IN STD_LOGIC_VECTOR (127 downto 0);
        q0 : OUT STD_LOGIC_VECTOR (127 downto 0) );
    end component;


    component mmWBramWriter_control_s_axi IS
    generic (
        C_S_AXI_ADDR_WIDTH : INTEGER;
        C_S_AXI_DATA_WIDTH : INTEGER );
    port (
        AWVALID : IN STD_LOGIC;
        AWREADY : OUT STD_LOGIC;
        AWADDR : IN STD_LOGIC_VECTOR (C_S_AXI_ADDR_WIDTH-1 downto 0);
        WVALID : IN STD_LOGIC;
        WREADY : OUT STD_LOGIC;
        WDATA : IN STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH-1 downto 0);
        WSTRB : IN STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH/8-1 downto 0);
        ARVALID : IN STD_LOGIC;
        ARREADY : OUT STD_LOGIC;
        ARADDR : IN STD_LOGIC_VECTOR (C_S_AXI_ADDR_WIDTH-1 downto 0);
        RVALID : OUT STD_LOGIC;
        RREADY : IN STD_LOGIC;
        RDATA : OUT STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH-1 downto 0);
        RRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
        BVALID : OUT STD_LOGIC;
        BREADY : IN STD_LOGIC;
        BRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
        ACLK : IN STD_LOGIC;
        ARESET : IN STD_LOGIC;
        ACLK_EN : IN STD_LOGIC;
        ap_start : OUT STD_LOGIC;
        interrupt : OUT STD_LOGIC;
        ap_ready : IN STD_LOGIC;
        ap_done : IN STD_LOGIC;
        ap_idle : IN STD_LOGIC );
    end component;



begin
    control_s_axi_U : component mmWBramWriter_control_s_axi
    generic map (
        C_S_AXI_ADDR_WIDTH => C_S_AXI_CONTROL_ADDR_WIDTH,
        C_S_AXI_DATA_WIDTH => C_S_AXI_CONTROL_DATA_WIDTH)
    port map (
        AWVALID => s_axi_control_AWVALID,
        AWREADY => s_axi_control_AWREADY,
        AWADDR => s_axi_control_AWADDR,
        WVALID => s_axi_control_WVALID,
        WREADY => s_axi_control_WREADY,
        WDATA => s_axi_control_WDATA,
        WSTRB => s_axi_control_WSTRB,
        ARVALID => s_axi_control_ARVALID,
        ARREADY => s_axi_control_ARREADY,
        ARADDR => s_axi_control_ARADDR,
        RVALID => s_axi_control_RVALID,
        RREADY => s_axi_control_RREADY,
        RDATA => s_axi_control_RDATA,
        RRESP => s_axi_control_RRESP,
        BVALID => s_axi_control_BVALID,
        BREADY => s_axi_control_BREADY,
        BRESP => s_axi_control_BRESP,
        ACLK => ap_clk,
        ARESET => ap_rst_n_inv,
        ACLK_EN => ap_const_logic_1,
        ap_start => ap_start,
        interrupt => interrupt,
        ap_ready => ap_ready,
        ap_done => ap_done,
        ap_idle => ap_idle);

    buffer_V_U : component mmWBramWriter_buffer_V
    generic map (
        DataWidth => 128,
        AddressRange => 32,
        AddressWidth => 5)
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        address0 => buffer_V_address0,
        ce0 => buffer_V_ce0,
        we0 => buffer_V_we0,
        d0 => buffer_V_d0,
        q0 => buffer_V_q0);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter0_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_enable_reg_pp0_iter0 <= ap_const_logic_0;
            else
                if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_logic_1 = ap_condition_pp0_exit_iter0_state2))) then 
                    ap_enable_reg_pp0_iter0 <= ap_const_logic_0;
                elsif (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                    ap_enable_reg_pp0_iter0 <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_condition_pp0_exit_iter0_state2))) then 
                    ap_enable_reg_pp0_iter1 <= (ap_const_logic_1 xor ap_condition_pp0_exit_iter0_state2);
                elsif ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
                elsif (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                    ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    i_1_reg_207_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
                i_1_reg_207 <= ap_const_lv32_0;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state9)) then 
                i_1_reg_207 <= add_ln54_reg_413;
            end if; 
        end if;
    end process;

    i_reg_170_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                i_reg_170 <= ap_const_lv6_0;
            elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (icmp_ln30_reg_389 = ap_const_lv1_0))) then 
                i_reg_170 <= add_ln30_reg_384;
            end if; 
        end if;
    end process;

    last_point_reg_182_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                last_point_reg_182 <= ap_const_lv1_0;
            elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (icmp_ln30_reg_389 = ap_const_lv1_0))) then 
                last_point_reg_182 <= last_point_1_fu_265_p2;
            end if; 
        end if;
    end process;

    n_points_1_reg_194_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                n_points_1_reg_194 <= ap_const_lv32_20;
            elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (icmp_ln30_reg_389 = ap_const_lv1_0))) then 
                n_points_1_reg_194 <= n_points_fu_257_p3;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                add_ln30_reg_384 <= add_ln30_fu_218_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state5)) then
                add_ln54_reg_413 <= add_ln54_fu_280_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (icmp_ln30_fu_224_p2 = ap_const_lv1_0))) then
                    i_cast_reg_393(5 downto 0) <= i_cast_fu_230_p1(5 downto 0);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                icmp_ln30_reg_389 <= icmp_ln30_fu_224_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state6)) then
                p_Result_1_reg_438 <= buffer_V_q0(95 downto 64);
                p_Result_2_reg_443 <= buffer_V_q0(63 downto 32);
                    shl_ln_reg_431(7 downto 2) <= shl_ln_fu_312_p3(7 downto 2);
                trunc_ln708_reg_448 <= trunc_ln708_fu_350_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state5) and (icmp_ln54_fu_291_p2 = ap_const_lv1_0))) then
                trunc_ln60_reg_426 <= trunc_ln60_fu_297_p1;
            end if;
        end if;
    end process;
    i_cast_reg_393(63 downto 6) <= "0000000000000000000000000000000000000000000000000000000000";
    shl_ln_reg_431(1 downto 0) <= "00";

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, ap_enable_reg_pp0_iter0, icmp_ln30_fu_224_p2, ap_CS_fsm_state5, icmp_ln54_fu_291_p2, ap_block_pp0_stage0_subdone)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_pp0_stage0 => 
                if (not(((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (icmp_ln30_fu_224_p2 = ap_const_lv1_1)))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (icmp_ln30_fu_224_p2 = ap_const_lv1_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state4;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                end if;
            when ap_ST_fsm_state4 => 
                ap_NS_fsm <= ap_ST_fsm_state5;
            when ap_ST_fsm_state5 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state5) and (icmp_ln54_fu_291_p2 = ap_const_lv1_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state6;
                end if;
            when ap_ST_fsm_state6 => 
                ap_NS_fsm <= ap_ST_fsm_state7;
            when ap_ST_fsm_state7 => 
                ap_NS_fsm <= ap_ST_fsm_state8;
            when ap_ST_fsm_state8 => 
                ap_NS_fsm <= ap_ST_fsm_state9;
            when ap_ST_fsm_state9 => 
                ap_NS_fsm <= ap_ST_fsm_state5;
            when others =>  
                ap_NS_fsm <= "XXXXXXXX";
        end case;
    end process;
    add_ln30_fu_218_p2 <= std_logic_vector(unsigned(ap_phi_mux_i_phi_fu_174_p4) + unsigned(ap_const_lv6_1));
    add_ln54_fu_280_p2 <= std_logic_vector(unsigned(i_1_reg_207) + unsigned(ap_const_lv32_1));
    add_ln60_fu_374_p2 <= std_logic_vector(unsigned(shl_ln_reg_431) + unsigned(ap_const_lv8_4));
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(1);
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state4 <= ap_CS_fsm(2);
    ap_CS_fsm_state5 <= ap_CS_fsm(3);
    ap_CS_fsm_state6 <= ap_CS_fsm(4);
    ap_CS_fsm_state7 <= ap_CS_fsm(5);
    ap_CS_fsm_state8 <= ap_CS_fsm(6);
    ap_CS_fsm_state9 <= ap_CS_fsm(7);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state2_pp0_stage0_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state3_pp0_stage0_iter1 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_condition_pp0_exit_iter0_state2_assign_proc : process(icmp_ln30_fu_224_p2)
    begin
        if ((icmp_ln30_fu_224_p2 = ap_const_lv1_1)) then 
            ap_condition_pp0_exit_iter0_state2 <= ap_const_logic_1;
        else 
            ap_condition_pp0_exit_iter0_state2 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_assign_proc : process(ap_CS_fsm_state5, icmp_ln54_fu_291_p2)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state5) and (icmp_ln54_fu_291_p2 = ap_const_lv1_1))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);

    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1)
    begin
        if (((ap_enable_reg_pp0_iter0 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_phi_mux_i_phi_fu_174_p4_assign_proc : process(i_reg_170, add_ln30_reg_384, ap_CS_fsm_pp0_stage0, icmp_ln30_reg_389, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (icmp_ln30_reg_389 = ap_const_lv1_0))) then 
            ap_phi_mux_i_phi_fu_174_p4 <= add_ln30_reg_384;
        else 
            ap_phi_mux_i_phi_fu_174_p4 <= i_reg_170;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state5, icmp_ln54_fu_291_p2)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state5) and (icmp_ln54_fu_291_p2 = ap_const_lv1_1))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_rst_n_inv_assign_proc : process(ap_rst_n)
    begin
                ap_rst_n_inv <= not(ap_rst_n);
    end process;


    buffer_V_address0_assign_proc : process(ap_CS_fsm_pp0_stage0, i_cast_reg_393, ap_enable_reg_pp0_iter1, ap_CS_fsm_state5, ap_block_pp0_stage0, zext_ln54_fu_286_p1)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
            buffer_V_address0 <= zext_ln54_fu_286_p1(5 - 1 downto 0);
        elsif (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
            buffer_V_address0 <= i_cast_reg_393(5 - 1 downto 0);
        else 
            buffer_V_address0 <= "XXXXX";
        end if; 
    end process;


    buffer_V_ce0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001, ap_enable_reg_pp0_iter1, ap_CS_fsm_state5)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state5) or ((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1)))) then 
            buffer_V_ce0 <= ap_const_logic_1;
        else 
            buffer_V_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    buffer_V_d0 <= 
        ap_const_lv128_lc_1 when (last_point_1_fu_265_p2(0) = '1') else 
        buffer_in_q0;

    buffer_V_we0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001, icmp_ln30_reg_389, ap_enable_reg_pp0_iter1)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (icmp_ln30_reg_389 = ap_const_lv1_0))) then 
            buffer_V_we0 <= ap_const_logic_1;
        else 
            buffer_V_we0 <= ap_const_logic_0;
        end if; 
    end process;

    buffer_in_address0 <= i_cast_fu_230_p1(5 - 1 downto 0);

    buffer_in_ce0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            buffer_in_ce0 <= ap_const_logic_1;
        else 
            buffer_in_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    buffer_out_address0_assign_proc : process(ap_CS_fsm_state6, ap_CS_fsm_state9, ap_CS_fsm_state4, zext_ln57_fu_325_p1, zext_ln58_fu_359_p1, ap_CS_fsm_state7, zext_ln59_fu_369_p1, ap_CS_fsm_state8, zext_ln60_fu_379_p1)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state9)) then 
            buffer_out_address0 <= zext_ln60_fu_379_p1(8 - 1 downto 0);
        elsif ((ap_const_logic_1 = ap_CS_fsm_state8)) then 
            buffer_out_address0 <= zext_ln59_fu_369_p1(8 - 1 downto 0);
        elsif ((ap_const_logic_1 = ap_CS_fsm_state7)) then 
            buffer_out_address0 <= zext_ln58_fu_359_p1(8 - 1 downto 0);
        elsif ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
            buffer_out_address0 <= zext_ln57_fu_325_p1(8 - 1 downto 0);
        elsif ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            buffer_out_address0 <= ap_const_lv64_0(8 - 1 downto 0);
        else 
            buffer_out_address0 <= "XXXXXXXX";
        end if; 
    end process;


    buffer_out_ce0_assign_proc : process(ap_CS_fsm_state6, ap_CS_fsm_state9, ap_CS_fsm_state4, ap_CS_fsm_state7, ap_CS_fsm_state8)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state8) or (ap_const_logic_1 = ap_CS_fsm_state7) or (ap_const_logic_1 = ap_CS_fsm_state4) or (ap_const_logic_1 = ap_CS_fsm_state9) or (ap_const_logic_1 = ap_CS_fsm_state6))) then 
            buffer_out_ce0 <= ap_const_logic_1;
        else 
            buffer_out_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    buffer_out_d0_assign_proc : process(n_points_1_reg_194, ap_CS_fsm_state6, p_Result_1_reg_438, p_Result_2_reg_443, trunc_ln708_reg_448, buffer_V_q0, ap_CS_fsm_state9, ap_CS_fsm_state4, ap_CS_fsm_state7, ap_CS_fsm_state8)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state9)) then 
            buffer_out_d0 <= trunc_ln708_reg_448;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state8)) then 
            buffer_out_d0 <= p_Result_2_reg_443;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state7)) then 
            buffer_out_d0 <= p_Result_1_reg_438;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
            buffer_out_d0 <= buffer_V_q0(127 downto 96);
        elsif ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            buffer_out_d0 <= n_points_1_reg_194;
        else 
            buffer_out_d0 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    buffer_out_we0_assign_proc : process(ap_CS_fsm_state6, ap_CS_fsm_state9, ap_CS_fsm_state4, ap_CS_fsm_state7, ap_CS_fsm_state8)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state8) or (ap_const_logic_1 = ap_CS_fsm_state7) or (ap_const_logic_1 = ap_CS_fsm_state4) or (ap_const_logic_1 = ap_CS_fsm_state9) or (ap_const_logic_1 = ap_CS_fsm_state6))) then 
            buffer_out_we0 <= ap_const_logic_1;
        else 
            buffer_out_we0 <= ap_const_logic_0;
        end if; 
    end process;

    i_cast_fu_230_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(ap_phi_mux_i_phi_fu_174_p4),64));
    icmp_ln30_fu_224_p2 <= "1" when (ap_phi_mux_i_phi_fu_174_p4 = ap_const_lv6_20) else "0";
    icmp_ln54_fu_291_p2 <= "1" when (i_1_reg_207 = n_points_1_reg_194) else "0";
    icmp_ln870_fu_235_p2 <= "1" when (buffer_in_q0 = ap_const_lv128_lc_1) else "0";
    last_point_1_fu_265_p2 <= (last_point_reg_182 or icmp_ln870_fu_235_p2);
    n_points_fu_257_p3 <= 
        select_ln32_fu_249_p3 when (icmp_ln870_fu_235_p2(0) = '1') else 
        n_points_1_reg_194;
    or_ln57_fu_319_p2 <= (shl_ln_fu_312_p3 or ap_const_lv8_1);
    or_ln58_fu_354_p2 <= (shl_ln_reg_431 or ap_const_lv8_2);
    or_ln59_fu_364_p2 <= (shl_ln_reg_431 or ap_const_lv8_3);
    select_ln32_fu_249_p3 <= 
        n_points_1_reg_194 when (last_point_reg_182(0) = '1') else 
        zext_ln32_fu_245_p1;
    shl_ln_fu_312_p3 <= (trunc_ln60_reg_426 & ap_const_lv2_0);
    trunc_ln32_fu_241_p1 <= i_reg_170(5 - 1 downto 0);
    trunc_ln60_fu_297_p1 <= i_1_reg_207(6 - 1 downto 0);
    trunc_ln708_fu_350_p1 <= buffer_V_q0(32 - 1 downto 0);
    zext_ln32_fu_245_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(trunc_ln32_fu_241_p1),32));
    zext_ln54_fu_286_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(i_1_reg_207),64));
    zext_ln57_fu_325_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(or_ln57_fu_319_p2),64));
    zext_ln58_fu_359_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(or_ln58_fu_354_p2),64));
    zext_ln59_fu_369_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(or_ln59_fu_364_p2),64));
    zext_ln60_fu_379_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(add_ln60_fu_374_p2),64));
end behav;
