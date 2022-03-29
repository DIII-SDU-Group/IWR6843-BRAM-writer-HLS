############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project IWR_BRAM_writer
set_top mmWBramWriter
add_files mmWaveBramWriter.cpp
open_solution "mmWaveBramWriter" -flow_target vivado
set_part {xczu3eg-sbva484-1-i}
create_clock -period 10 -name default
config_export -format ip_catalog -output /home/ffn/Nextcloud/Workspace/Projects/IWR6843-BRAM-writer-HLS/IP/mmWBramWriter.zip -rtl vhdl
source "./IWR_BRAM_writer/mmWaveBramWriter/directives.tcl"
#csim_design
csynth_design
#cosim_design
export_design -rtl vhdl -format ip_catalog -output /home/ffn/Nextcloud/Workspace/Projects/IWR6843-BRAM-writer-HLS/IP/mmWBramWriter.zip
