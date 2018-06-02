#!/bin/bash -f
#*********************************************************************************************************
# Vivado (TM) v2017.4 (64-bit)
#
# Filename    : design_1.sh
# Simulator   : Synopsys Verilog Compiler Simulator
# Description : Simulation script for compiling, elaborating and verifying the project source files.
#               The script will automatically create the design libraries sub-directories in the run
#               directory, add the library logical mappings in the simulator setup file, create default
#               'do/prj' file, execute compilation, elaboration and simulation steps.
#
# Generated by Vivado on Sat Jun 02 04:19:31 +0100 2018
# SW Build 2086221 on Fri Dec 15 20:55:39 MST 2017
#
# Copyright 1986-2017 Xilinx, Inc. All Rights Reserved. 
#
# usage: design_1.sh [-help]
# usage: design_1.sh [-lib_map_path]
# usage: design_1.sh [-noclean_files]
# usage: design_1.sh [-reset_run]
#
# Prerequisite:- To compile and run simulation, you must compile the Xilinx simulation libraries using the
# 'compile_simlib' TCL command. For more information about this command, run 'compile_simlib -help' in the
# Vivado Tcl Shell. Once the libraries have been compiled successfully, specify the -lib_map_path switch
# that points to these libraries and rerun export_simulation. For more information about this switch please
# type 'export_simulation -help' in the Tcl shell.
#
# You can also point to the simulation libraries by either replacing the <SPECIFY_COMPILED_LIB_PATH> in this
# script with the compiled library directory path or specify this path with the '-lib_map_path' switch when
# executing this script. Please type 'design_1.sh -help' for more information.
#
# Additional references - 'Xilinx Vivado Design Suite User Guide:Logic simulation (UG900)'
#
#*********************************************************************************************************

# Directory path for design sources and include directories (if any) wrt this path
ref_dir="."

# Override directory with 'export_sim_ref_dir' env path value if set in the shell
if [[ (! -z "$export_sim_ref_dir") && ($export_sim_ref_dir != "") ]]; then
  ref_dir="$export_sim_ref_dir"
fi

# Command line options
vlogan_opts="-full64"
vhdlan_opts="-full64"
vcs_elab_opts="-full64 -debug_pp -t ps -licqueue -l elaborate.log"
vcs_sim_opts="-ucli -licqueue -l simulate.log"

# Design libraries
design_libs=(xil_defaultlib xpm microblaze_v10_0_5 axi_lite_ipif_v3_0_4 axi_intc_v4_1_10 xlconcat_v2_1_1 mdm_v3_2_12 lib_cdc_v1_0_2 proc_sys_reset_v5_0_12 lib_pkg_v1_0_2 lib_srl_fifo_v1_0_2 emc_common_v3_0_5 axi_emc_v3_0_15 axi_uartlite_v2_0_19 mii_to_rmii_v2_0_17 blk_mem_gen_v8_4_1 lib_bmg_v1_0_10 fifo_generator_v13_2_1 lib_fifo_v1_0_10 axi_ethernetlite_v3_0_13 axi_timer_v2_0_17 smartconnect_v1_0 xlconstant_v1_1_3 generic_baseblocks_v2_1_0 axi_infrastructure_v1_1_0 axi_register_slice_v2_1_15 axi_data_fifo_v2_1_14 axi_crossbar_v2_1_16 lmb_v10_v3_0_9 lmb_bram_if_cntlr_v4_0_14)

# Simulation root library directory
sim_lib_dir="vcs_lib"

# Script info
echo -e "design_1.sh - Script generated by export_simulation (Vivado v2017.4 (64-bit)-id)\n"

# Main steps
run()
{
  check_args $# $1
  setup $1 $2
  compile
  elaborate
  simulate
}

# RUN_STEP: <compile>
compile()
{
  # Compile design files
  vlogan -work xil_defaultlib $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/4868" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
    "C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
    "C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
  2>&1 | tee -a vlogan.log

  vhdlan -work xpm $vhdlan_opts \
    "C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_VCOMP.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work microblaze_v10_0_5 $vhdlan_opts \
    "$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/4f30/hdl/microblaze_v10_0_vh_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work xil_defaultlib $vhdlan_opts \
    "$ref_dir/../../../bd/design_1/ip/design_1_microblaze_0_0/sim/design_1_microblaze_0_0.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work axi_lite_ipif_v3_0_4 $vhdlan_opts \
    "$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/cced/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work axi_intc_v4_1_10 $vhdlan_opts \
    "$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/cf04/hdl/axi_intc_v4_1_vh_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work xil_defaultlib $vhdlan_opts \
    "$ref_dir/../../../bd/design_1/ip/design_1_microblaze_0_axi_intc_0/sim/design_1_microblaze_0_axi_intc_0.vhd" \
  2>&1 | tee -a vhdlan.log

  vlogan -work xlconcat_v2_1_1 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/4868" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/2f66/hdl/xlconcat_v2_1_vl_rfs.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work xil_defaultlib $vlogan_opts +v2k +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/4868" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../bd/design_1/ip/design_1_microblaze_0_xlconcat_0/sim/design_1_microblaze_0_xlconcat_0.v" \
  2>&1 | tee -a vlogan.log

  vhdlan -work mdm_v3_2_12 $vhdlan_opts \
    "$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/8608/hdl/mdm_v3_2_vh_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work xil_defaultlib $vhdlan_opts \
    "$ref_dir/../../../bd/design_1/ip/design_1_mdm_1_0/sim/design_1_mdm_1_0.vhd" \
  2>&1 | tee -a vhdlan.log

  vlogan -work xil_defaultlib $vlogan_opts +v2k +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/4868" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../bd/design_1/ip/design_1_clk_wiz_1_0/design_1_clk_wiz_1_0_clk_wiz.v" \
    "$ref_dir/../../../bd/design_1/ip/design_1_clk_wiz_1_0/design_1_clk_wiz_1_0.v" \
  2>&1 | tee -a vlogan.log

  vhdlan -work lib_cdc_v1_0_2 $vhdlan_opts \
    "$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work proc_sys_reset_v5_0_12 $vhdlan_opts \
    "$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/f86a/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work xil_defaultlib $vhdlan_opts \
    "$ref_dir/../../../bd/design_1/ip/design_1_rst_clk_wiz_1_100M_0/sim/design_1_rst_clk_wiz_1_100M_0.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work lib_pkg_v1_0_2 $vhdlan_opts \
    "$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work lib_srl_fifo_v1_0_2 $vhdlan_opts \
    "$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work emc_common_v3_0_5 $vhdlan_opts \
    "$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/d806/hdl/emc_common_v3_0_vh_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work axi_emc_v3_0_15 $vhdlan_opts \
    "$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/187c/hdl/axi_emc_v3_0_vh_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work xil_defaultlib $vhdlan_opts \
    "$ref_dir/../../../bd/design_1/ip/design_1_axi_emc_0_0/sim/design_1_axi_emc_0_0.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work axi_uartlite_v2_0_19 $vhdlan_opts \
    "$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/c778/hdl/axi_uartlite_v2_0_vh_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work xil_defaultlib $vhdlan_opts \
    "$ref_dir/../../../bd/design_1/ip/design_1_axi_uartlite_0_0/sim/design_1_axi_uartlite_0_0.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work mii_to_rmii_v2_0_17 $vhdlan_opts \
    "$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/c9c6/hdl/mii_to_rmii_v2_0_vh_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work xil_defaultlib $vhdlan_opts \
    "$ref_dir/../../../bd/design_1/ip/design_1_mii_to_rmii_0_0/sim/design_1_mii_to_rmii_0_0.vhd" \
  2>&1 | tee -a vhdlan.log

  vlogan -work blk_mem_gen_v8_4_1 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/4868" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/67d8/simulation/blk_mem_gen_v8_4.v" \
  2>&1 | tee -a vlogan.log

  vhdlan -work lib_bmg_v1_0_10 $vhdlan_opts \
    "$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/9340/hdl/lib_bmg_v1_0_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vlogan -work fifo_generator_v13_2_1 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/4868" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/5c35/simulation/fifo_generator_vlog_beh.v" \
  2>&1 | tee -a vlogan.log

  vhdlan -work fifo_generator_v13_2_1 $vhdlan_opts \
    "$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/5c35/hdl/fifo_generator_v13_2_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vlogan -work fifo_generator_v13_2_1 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/4868" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/5c35/hdl/fifo_generator_v13_2_rfs.v" \
  2>&1 | tee -a vlogan.log

  vhdlan -work lib_fifo_v1_0_10 $vhdlan_opts \
    "$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/f10a/hdl/lib_fifo_v1_0_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work axi_ethernetlite_v3_0_13 $vhdlan_opts \
    "$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/aa69/hdl/axi_ethernetlite_v3_0_vh_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work xil_defaultlib $vhdlan_opts \
    "$ref_dir/../../../bd/design_1/ip/design_1_axi_ethernetlite_0_0/sim/design_1_axi_ethernetlite_0_0.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work axi_timer_v2_0_17 $vhdlan_opts \
    "$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/38c3/hdl/axi_timer_v2_0_vh_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work xil_defaultlib $vhdlan_opts \
    "$ref_dir/../../../bd/design_1/ip/design_1_axi_timer_0_0/sim/design_1_axi_timer_0_0.vhd" \
  2>&1 | tee -a vhdlan.log

  vlogan -work xil_defaultlib $vlogan_opts +v2k +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/4868" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/sim/bd_afc3.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work smartconnect_v1_0 $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/4868" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/sc_util_v1_0_vl_rfs.sv" \
    "$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/786b/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work xil_defaultlib $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/4868" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_10/sim/bd_afc3_s00a2s_0.sv" \
    "$ref_dir/../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_19/sim/bd_afc3_s01a2s_0.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work smartconnect_v1_0 $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/4868" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/92d2/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work xil_defaultlib $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/4868" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_22/sim/bd_afc3_m00s2a_0.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work smartconnect_v1_0 $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/4868" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/258c/hdl/sc_exit_v1_0_vl_rfs.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work xil_defaultlib $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/4868" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_28/sim/bd_afc3_m00e_0.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work smartconnect_v1_0 $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/4868" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/sc_node_v1_0_vl_rfs.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work xil_defaultlib $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/4868" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_23/sim/bd_afc3_m00arn_0.sv" \
    "$ref_dir/../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_24/sim/bd_afc3_m00rn_0.sv" \
    "$ref_dir/../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_25/sim/bd_afc3_m00awn_0.sv" \
    "$ref_dir/../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_26/sim/bd_afc3_m00wn_0.sv" \
    "$ref_dir/../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_27/sim/bd_afc3_m00bn_0.sv" \
    "$ref_dir/../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_20/sim/bd_afc3_sarn_1.sv" \
    "$ref_dir/../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_21/sim/bd_afc3_srn_1.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work smartconnect_v1_0 $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/4868" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/8ad6/hdl/sc_mmu_v1_0_vl_rfs.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work xil_defaultlib $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/4868" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_16/sim/bd_afc3_s01mmu_0.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work smartconnect_v1_0 $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/4868" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/0f5f/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work xil_defaultlib $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/4868" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_17/sim/bd_afc3_s01tr_0.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work smartconnect_v1_0 $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/4868" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/925a/hdl/sc_si_converter_v1_0_vl_rfs.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work xil_defaultlib $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/4868" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_18/sim/bd_afc3_s01sic_0.sv" \
    "$ref_dir/../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_11/sim/bd_afc3_sarn_0.sv" \
    "$ref_dir/../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_12/sim/bd_afc3_srn_0.sv" \
    "$ref_dir/../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_13/sim/bd_afc3_sawn_0.sv" \
    "$ref_dir/../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_14/sim/bd_afc3_swn_0.sv" \
    "$ref_dir/../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_15/sim/bd_afc3_sbn_0.sv" \
    "$ref_dir/../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_7/sim/bd_afc3_s00mmu_0.sv" \
    "$ref_dir/../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_8/sim/bd_afc3_s00tr_0.sv" \
    "$ref_dir/../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_9/sim/bd_afc3_s00sic_0.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work smartconnect_v1_0 $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/4868" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/1b0c/hdl/sc_switchboard_v1_0_vl_rfs.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work xil_defaultlib $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/4868" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_2/sim/bd_afc3_arsw_0.sv" \
    "$ref_dir/../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_3/sim/bd_afc3_rsw_0.sv" \
    "$ref_dir/../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_4/sim/bd_afc3_awsw_0.sv" \
    "$ref_dir/../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_5/sim/bd_afc3_wsw_0.sv" \
    "$ref_dir/../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_6/sim/bd_afc3_bsw_0.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work xlconstant_v1_1_3 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/4868" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/0750/hdl/xlconstant_v1_1_vl_rfs.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work xil_defaultlib $vlogan_opts +v2k +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/4868" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_0/sim/bd_afc3_one_0.v" \
  2>&1 | tee -a vlogan.log

  vhdlan -work xil_defaultlib $vhdlan_opts \
    "$ref_dir/../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_1/sim/bd_afc3_psr_aclk_0.vhd" \
    "$ref_dir/../../../bd/design_1/ip/design_1_axi_smc_0/sim/design_1_axi_smc_0.vhd" \
  2>&1 | tee -a vhdlan.log

  vlogan -work generic_baseblocks_v2_1_0 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/4868" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work axi_infrastructure_v1_1_0 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/4868" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work axi_register_slice_v2_1_15 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/4868" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/3ed1/hdl/axi_register_slice_v2_1_vl_rfs.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work axi_data_fifo_v2_1_14 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/4868" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/9909/hdl/axi_data_fifo_v2_1_vl_rfs.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work axi_crossbar_v2_1_16 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/4868" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/c631/hdl/axi_crossbar_v2_1_vl_rfs.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work xil_defaultlib $vlogan_opts +v2k +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/4868" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../bd/design_1/ip/design_1_xbar_0/sim/design_1_xbar_0.v" \
  2>&1 | tee -a vlogan.log

  vhdlan -work lmb_v10_v3_0_9 $vhdlan_opts \
    "$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/78eb/hdl/lmb_v10_v3_0_vh_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work xil_defaultlib $vhdlan_opts \
    "$ref_dir/../../../bd/design_1/ip/design_1_dlmb_v10_0/sim/design_1_dlmb_v10_0.vhd" \
    "$ref_dir/../../../bd/design_1/ip/design_1_ilmb_v10_0/sim/design_1_ilmb_v10_0.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work lmb_bram_if_cntlr_v4_0_14 $vhdlan_opts \
    "$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/226d/hdl/lmb_bram_if_cntlr_v4_0_vh_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work xil_defaultlib $vhdlan_opts \
    "$ref_dir/../../../bd/design_1/ip/design_1_dlmb_bram_if_cntlr_0/sim/design_1_dlmb_bram_if_cntlr_0.vhd" \
    "$ref_dir/../../../bd/design_1/ip/design_1_ilmb_bram_if_cntlr_0/sim/design_1_ilmb_bram_if_cntlr_0.vhd" \
  2>&1 | tee -a vhdlan.log

  vlogan -work xil_defaultlib $vlogan_opts +v2k +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/4868" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../FPGAMiner.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" +incdir+"C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../bd/design_1/ip/design_1_lmb_bram_0/sim/design_1_lmb_bram_0.v" \
  2>&1 | tee -a vlogan.log

  vhdlan -work xil_defaultlib $vhdlan_opts \
    "$ref_dir/../../../bd/design_1/sim/design_1.vhd" \
    "$ref_dir/../../../bd/design_1/ipshared/3944/hdl/MinerCoprocessor_v1_0_S00_AXIS.vhd" \
    "$ref_dir/../../../bd/design_1/ipshared/3944/src/sha256_functions.vhd" \
    "$ref_dir/../../../bd/design_1/ipshared/3944/hdl/MinerCoprocessor_v1_0_M00_AXIS.vhd" \
    "$ref_dir/../../../bd/design_1/ipshared/3944/hdl/MinerCoprocessor_v1_0.vhd" \
    "$ref_dir/../../../bd/design_1/ip/design_1_MinerCoprocessor_0_0/sim/design_1_MinerCoprocessor_0_0.vhd" \
  2>&1 | tee -a vhdlan.log


  vlogan -work xil_defaultlib $vlogan_opts +v2k \
    glbl.v \
  2>&1 | tee -a vlogan.log

}

# RUN_STEP: <elaborate>
elaborate()
{
  vcs $vcs_elab_opts xil_defaultlib.design_1 xil_defaultlib.glbl -o design_1_simv
}

# RUN_STEP: <simulate>
simulate()
{
  ./design_1_simv $vcs_sim_opts -do simulate.do
}

# STEP: setup
setup()
{
  case $1 in
    "-lib_map_path" )
      if [[ ($2 == "") ]]; then
        echo -e "ERROR: Simulation library directory path not specified (type \"./design_1.sh -help\" for more information)\n"
        exit 1
      fi
      create_lib_mappings $2
    ;;
    "-reset_run" )
      reset_run
      echo -e "INFO: Simulation run files deleted.\n"
      exit 0
    ;;
    "-noclean_files" )
      # do not remove previous data
    ;;
    * )
      create_lib_mappings $2
  esac

  create_lib_dir

  # Add any setup/initialization commands here:-

  # <user specific commands>

}

# Define design library mappings
create_lib_mappings()
{
  file="synopsys_sim.setup"
  if [[ -e $file ]]; then
    if [[ ($1 == "") ]]; then
      return
    else
      rm -rf $file
    fi
  fi

  touch $file

  lib_map_path=""
  if [[ ($1 != "") ]]; then
    lib_map_path="$1"
  fi

  for (( i=0; i<${#design_libs[*]}; i++ )); do
    lib="${design_libs[i]}"
    mapping="$lib:$sim_lib_dir/$lib"
    echo $mapping >> $file
  done

  if [[ ($lib_map_path != "") ]]; then
    incl_ref="OTHERS=$lib_map_path/synopsys_sim.setup"
    echo $incl_ref >> $file
  fi
}

# Create design library directory paths
create_lib_dir()
{
  if [[ -e $sim_lib_dir ]]; then
    rm -rf $sim_lib_dir
  fi

  for (( i=0; i<${#design_libs[*]}; i++ )); do
    lib="${design_libs[i]}"
    lib_dir="$sim_lib_dir/$lib"
    if [[ ! -e $lib_dir ]]; then
      mkdir -p $lib_dir
    fi
  done
}

# Delete generated data from the previous run
reset_run()
{
  files_to_remove=(ucli.key design_1_simv vlogan.log vhdlan.log compile.log elaborate.log simulate.log .vlogansetup.env .vlogansetup.args .vcs_lib_lock scirocco_command.log 64 AN.DB csrc design_1_simv.daidir)
  for (( i=0; i<${#files_to_remove[*]}; i++ )); do
    file="${files_to_remove[i]}"
    if [[ -e $file ]]; then
      rm -rf $file
    fi
  done

  create_lib_dir
}

# Check command line arguments
check_args()
{
  if [[ ($1 == 1 ) && ($2 != "-lib_map_path" && $2 != "-noclean_files" && $2 != "-reset_run" && $2 != "-help" && $2 != "-h") ]]; then
    echo -e "ERROR: Unknown option specified '$2' (type \"./design_1.sh -help\" for more information)\n"
    exit 1
  fi

  if [[ ($2 == "-help" || $2 == "-h") ]]; then
    usage
  fi
}

# Script usage
usage()
{
  msg="Usage: design_1.sh [-help]\n\
Usage: design_1.sh [-lib_map_path]\n\
Usage: design_1.sh [-reset_run]\n\
Usage: design_1.sh [-noclean_files]\n\n\
[-help] -- Print help information for this script\n\n\
[-lib_map_path <path>] -- Compiled simulation library directory path. The simulation library is compiled\n\
using the compile_simlib tcl command. Please see 'compile_simlib -help' for more information.\n\n\
[-reset_run] -- Recreate simulator setup files and library mappings for a clean run. The generated files\n\
from the previous run will be removed. If you don't want to remove the simulator generated files, use the\n\
-noclean_files switch.\n\n\
[-noclean_files] -- Reset previous run, but do not remove simulator generated files from the previous run.\n\n"
  echo -e $msg
  exit 1
}

# Launch script
run $1 $2
