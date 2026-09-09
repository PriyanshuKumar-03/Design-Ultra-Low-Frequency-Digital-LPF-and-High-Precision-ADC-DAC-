# ####################################################################

#  Created by Genus(TM) Synthesis Solution 22.13-s093_1 on Tue Sep 08 23:03:04 EEST 2026

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design wrapper

create_clock -name "clk" -period 100.0 -waveform {0.0 50.0} [get_ports clk]
set_clock_transition 0.2 [get_clocks clk]
set_load -pin_load -min 0.05 [get_ports en_adc]
set_load -pin_load -max 0.3 [get_ports en_adc]
set_load -pin_load -min 0.05 [get_ports en_dac]
set_load -pin_load -max 0.3 [get_ports en_dac]
set_load -pin_load -min 0.05 [get_ports en_comp]
set_load -pin_load -max 0.3 [get_ports en_comp]
set_load -pin_load -min 0.05 [get_ports sample_in]
set_load -pin_load -max 0.3 [get_ports sample_in]
set_load -pin_load -min 0.05 [get_ports sample_out]
set_load -pin_load -max 0.3 [get_ports sample_out]
set_load -pin_load -min 0.05 [get_ports {vdac[18]}]
set_load -pin_load -max 0.3 [get_ports {vdac[18]}]
set_load -pin_load -min 0.05 [get_ports {vdac[17]}]
set_load -pin_load -max 0.3 [get_ports {vdac[17]}]
set_load -pin_load -min 0.05 [get_ports {vdac[16]}]
set_load -pin_load -max 0.3 [get_ports {vdac[16]}]
set_load -pin_load -min 0.05 [get_ports {vdac[15]}]
set_load -pin_load -max 0.3 [get_ports {vdac[15]}]
set_load -pin_load -min 0.05 [get_ports {vdac[14]}]
set_load -pin_load -max 0.3 [get_ports {vdac[14]}]
set_load -pin_load -min 0.05 [get_ports {vdac[13]}]
set_load -pin_load -max 0.3 [get_ports {vdac[13]}]
set_load -pin_load -min 0.05 [get_ports {vdac[12]}]
set_load -pin_load -max 0.3 [get_ports {vdac[12]}]
set_load -pin_load -min 0.05 [get_ports {vdac[11]}]
set_load -pin_load -max 0.3 [get_ports {vdac[11]}]
set_load -pin_load -min 0.05 [get_ports {vdac[10]}]
set_load -pin_load -max 0.3 [get_ports {vdac[10]}]
set_load -pin_load -min 0.05 [get_ports {vdac[9]}]
set_load -pin_load -max 0.3 [get_ports {vdac[9]}]
set_load -pin_load -min 0.05 [get_ports {vdac[8]}]
set_load -pin_load -max 0.3 [get_ports {vdac[8]}]
set_load -pin_load -min 0.05 [get_ports {vdac[7]}]
set_load -pin_load -max 0.3 [get_ports {vdac[7]}]
set_load -pin_load -min 0.05 [get_ports {vdac[6]}]
set_load -pin_load -max 0.3 [get_ports {vdac[6]}]
set_load -pin_load -min 0.05 [get_ports {vdac[5]}]
set_load -pin_load -max 0.3 [get_ports {vdac[5]}]
set_load -pin_load -min 0.05 [get_ports {vdac[4]}]
set_load -pin_load -max 0.3 [get_ports {vdac[4]}]
set_load -pin_load -min 0.05 [get_ports {vdac[3]}]
set_load -pin_load -max 0.3 [get_ports {vdac[3]}]
set_load -pin_load -min 0.05 [get_ports {vdac[2]}]
set_load -pin_load -max 0.3 [get_ports {vdac[2]}]
set_load -pin_load -min 0.05 [get_ports {vdac[1]}]
set_load -pin_load -max 0.3 [get_ports {vdac[1]}]
set_load -pin_load -min 0.05 [get_ports {vdac[0]}]
set_load -pin_load -max 0.3 [get_ports {vdac[0]}]
group_path -name I2O_group -from [list \
  [get_ports clk]  \
  [get_ports rst]  \
  [get_ports bypass]  \
  [get_ports vout_p]  \
  [get_ports vout_n]  \
  [get_ports {mode_sel[2]}]  \
  [get_ports {mode_sel[1]}]  \
  [get_ports {mode_sel[0]}]  \
  [get_ports {slope_sel[1]}]  \
  [get_ports {slope_sel[0]}] ] -to [list \
  [get_ports en_adc]  \
  [get_ports en_dac]  \
  [get_ports en_comp]  \
  [get_ports sample_in]  \
  [get_ports sample_out]  \
  [get_ports {vdac[18]}]  \
  [get_ports {vdac[17]}]  \
  [get_ports {vdac[16]}]  \
  [get_ports {vdac[15]}]  \
  [get_ports {vdac[14]}]  \
  [get_ports {vdac[13]}]  \
  [get_ports {vdac[12]}]  \
  [get_ports {vdac[11]}]  \
  [get_ports {vdac[10]}]  \
  [get_ports {vdac[9]}]  \
  [get_ports {vdac[8]}]  \
  [get_ports {vdac[7]}]  \
  [get_ports {vdac[6]}]  \
  [get_ports {vdac[5]}]  \
  [get_ports {vdac[4]}]  \
  [get_ports {vdac[3]}]  \
  [get_ports {vdac[2]}]  \
  [get_ports {vdac[1]}]  \
  [get_ports {vdac[0]}] ]
group_path -name I2R_group -from [list \
  [get_ports clk]  \
  [get_ports rst]  \
  [get_ports bypass]  \
  [get_ports vout_p]  \
  [get_ports vout_n]  \
  [get_ports {mode_sel[2]}]  \
  [get_ports {mode_sel[1]}]  \
  [get_ports {mode_sel[0]}]  \
  [get_ports {slope_sel[1]}]  \
  [get_ports {slope_sel[0]}] ] -to [list \
  [get_cells u_core_RC_CG_HIER_INST0/RC_CGIC_INST]  \
  [get_cells u_core_RC_CG_HIER_INST1/RC_CGIC_INST]  \
  [get_cells u_core_RC_CG_HIER_INST2/RC_CGIC_INST]  \
  [get_cells u_sar_RC_CG_HIER_INST3/RC_CGIC_INST]  \
  [get_cells u_sar_RC_CG_HIER_INST4/RC_CGIC_INST]  \
  [get_cells u_sar_RC_CG_HIER_INST5/RC_CGIC_INST]  \
  [get_cells u_sar_RC_CG_HIER_INST6/RC_CGIC_INST]  \
  [get_cells RC_CG_HIER_INST7/RC_CGIC_INST]  \
  [get_cells RC_CG_HIER_INST8/RC_CGIC_INST]  \
  [get_cells RC_CG_HIER_INST9/RC_CGIC_INST]  \
  [get_cells {slow_cnt_reg[1]}]  \
  [get_cells {slow_cnt_reg[2]}]  \
  [get_cells {slow_cnt_reg[3]}]  \
  [get_cells {u_core_y1_reg[0]}]  \
  [get_cells {u_core_y1_reg[1]}]  \
  [get_cells {u_core_y1_reg[2]}]  \
  [get_cells {u_core_y1_reg[3]}]  \
  [get_cells {u_core_y1_reg[4]}]  \
  [get_cells {u_core_y1_reg[5]}]  \
  [get_cells {u_core_y1_reg[6]}]  \
  [get_cells {u_core_y1_reg[7]}]  \
  [get_cells {u_core_y1_reg[8]}]  \
  [get_cells {u_core_y1_reg[9]}]  \
  [get_cells {u_core_y1_reg[10]}]  \
  [get_cells {u_core_y1_reg[11]}]  \
  [get_cells {u_core_y1_reg[12]}]  \
  [get_cells {u_core_y1_reg[13]}]  \
  [get_cells {u_core_y1_reg[14]}]  \
  [get_cells {u_core_y1_reg[15]}]  \
  [get_cells {u_core_y1_reg[31]}]  \
  [get_cells {u_core_y2_reg[0]}]  \
  [get_cells {u_core_y2_reg[31]}]  \
  [get_cells {u_core_y3_reg[0]}]  \
  [get_cells {u_core_y3_reg[31]}]  \
  [get_cells u_dec_cnt_e_reg]  \
  [get_cells {u_dec_cnt_m_reg[0]}]  \
  [get_cells {u_dec_cnt_m_reg[1]}]  \
  [get_cells {u_dec_cnt_m_reg[2]}]  \
  [get_cells {u_dec_cnt_m_reg[3]}]  \
  [get_cells {u_dec_cnt_m_reg[4]}]  \
  [get_cells {u_dec_cnt_m_reg[5]}]  \
  [get_cells {u_dec_cnt_m_reg[6]}]  \
  [get_cells {u_dec_div_cnt_reg[1]}]  \
  [get_cells {u_dec_div_cnt_reg[2]}]  \
  [get_cells {u_dec_div_cnt_reg[3]}]  \
  [get_cells {u_dec_div_cnt_reg[4]}]  \
  [get_cells {u_dec_div_cnt_reg[5]}]  \
  [get_cells {u_sar_cnt_reg[0]}]  \
  [get_cells {u_sar_cnt_reg[1]}]  \
  [get_cells {u_sar_cnt_reg[3]}]  \
  [get_cells {u_sar_cnt_reg[4]}]  \
  [get_cells {u_sar_current_bit_reg[0]}]  \
  [get_cells {u_sar_current_bit_reg[3]}]  \
  [get_cells u_sar_done_conv_reg]  \
  [get_cells u_sar_en_comp_reg]  \
  [get_cells {u_sar_hold_reg[0]}]  \
  [get_cells {u_sar_hold_reg[1]}]  \
  [get_cells {u_sar_vin_dac_reg[0]}]  \
  [get_cells {u_sar_vin_dac_reg[1]}]  \
  [get_cells {u_sar_vin_dac_reg[2]}]  \
  [get_cells {u_sar_vin_dac_reg[3]}]  \
  [get_cells {u_sar_vin_dac_reg[4]}]  \
  [get_cells {u_sar_vin_dac_reg[5]}]  \
  [get_cells {u_sar_vin_dac_reg[6]}]  \
  [get_cells {u_sar_vin_dac_reg[7]}]  \
  [get_cells {u_sar_vin_dac_reg[8]}]  \
  [get_cells {u_sar_vin_dac_reg[9]}]  \
  [get_cells {u_sar_vin_dac_reg[10]}]  \
  [get_cells {u_core_slope_sel_q_reg[0]}]  \
  [get_cells {u_core_slope_sel_q_reg[1]}]  \
  [get_cells u_dec_ce_reg]  \
  [get_cells u_sar_en_dac_reg]  \
  [get_cells u_sar_sample_out_reg]  \
  [get_cells {u_sar_vsample_reg[0]}]  \
  [get_cells {u_sar_vsample_reg[1]}]  \
  [get_cells {u_sar_vsample_reg[2]}]  \
  [get_cells {u_sar_vsample_reg[3]}]  \
  [get_cells {u_sar_vsample_reg[4]}]  \
  [get_cells {u_sar_vsample_reg[5]}]  \
  [get_cells {u_sar_vsample_reg[6]}]  \
  [get_cells {u_sar_vsample_reg[7]}]  \
  [get_cells {u_sar_vsample_reg[8]}]  \
  [get_cells {u_sar_vsample_reg[9]}]  \
  [get_cells {u_sar_vsample_reg[10]}]  \
  [get_cells {u_sar_vsample_reg[11]}]  \
  [get_cells {slow_cnt_reg[0]}]  \
  [get_cells {u_dec_div_cnt_reg[0]}]  \
  [get_cells {u_sar_current_bit_reg[1]}]  \
  [get_cells u_sar_en_adc_reg]  \
  [get_cells {u_sar_vin_dac_reg[11]}]  \
  [get_cells {u_sar_current_bit_reg[2]}]  \
  [get_cells {u_sar_cnt_reg[2]}]  \
  [get_cells {u_sar_current_state_reg[0]}]  \
  [get_cells {u_core_y1_reg[29]}]  \
  [get_cells {u_core_y1_reg[20]}]  \
  [get_cells {u_core_y1_reg[18]}]  \
  [get_cells {u_core_y1_reg[21]}]  \
  [get_cells {u_core_y1_reg[23]}]  \
  [get_cells {u_core_y1_reg[17]}]  \
  [get_cells {u_core_y1_reg[28]}]  \
  [get_cells {u_core_y1_reg[16]}]  \
  [get_cells {u_core_y1_reg[19]}]  \
  [get_cells {u_core_y1_reg[26]}]  \
  [get_cells {u_core_y1_reg[25]}]  \
  [get_cells {u_core_y1_reg[27]}]  \
  [get_cells {u_core_y1_reg[22]}]  \
  [get_cells {u_core_y1_reg[24]}]  \
  [get_cells {u_core_y1_reg[30]}]  \
  [get_cells {u_core_y3_reg[1]}]  \
  [get_cells {u_core_y3_reg[10]}]  \
  [get_cells {u_core_y3_reg[13]}]  \
  [get_cells {u_core_y3_reg[2]}]  \
  [get_cells {u_core_y3_reg[30]}]  \
  [get_cells {u_core_y3_reg[14]}]  \
  [get_cells {u_core_y3_reg[15]}]  \
  [get_cells {u_core_y3_reg[20]}]  \
  [get_cells {u_core_y3_reg[5]}]  \
  [get_cells {u_core_y3_reg[4]}]  \
  [get_cells {u_core_y3_reg[23]}]  \
  [get_cells {u_core_y3_reg[18]}]  \
  [get_cells {u_core_y3_reg[11]}]  \
  [get_cells {u_core_y3_reg[26]}]  \
  [get_cells {u_core_y3_reg[27]}]  \
  [get_cells {u_core_y3_reg[9]}]  \
  [get_cells {u_core_y3_reg[21]}]  \
  [get_cells {u_core_y3_reg[6]}]  \
  [get_cells {u_core_y3_reg[29]}]  \
  [get_cells {u_core_y3_reg[12]}]  \
  [get_cells {u_core_y3_reg[7]}]  \
  [get_cells {u_core_y3_reg[25]}]  \
  [get_cells {u_core_y3_reg[28]}]  \
  [get_cells {u_core_y3_reg[24]}]  \
  [get_cells {u_core_y3_reg[16]}]  \
  [get_cells {u_core_y3_reg[3]}]  \
  [get_cells {u_core_y3_reg[17]}]  \
  [get_cells {u_core_y3_reg[22]}]  \
  [get_cells {u_core_y3_reg[19]}]  \
  [get_cells {u_core_y3_reg[8]}]  \
  [get_cells {u_core_y2_reg[1]}]  \
  [get_cells {u_core_y2_reg[10]}]  \
  [get_cells {u_core_y2_reg[13]}]  \
  [get_cells {u_core_y2_reg[2]}]  \
  [get_cells {u_core_y2_reg[30]}]  \
  [get_cells {u_core_y2_reg[14]}]  \
  [get_cells {u_core_y2_reg[15]}]  \
  [get_cells {u_core_y2_reg[20]}]  \
  [get_cells {u_core_y2_reg[5]}]  \
  [get_cells {u_core_y2_reg[4]}]  \
  [get_cells {u_core_y2_reg[23]}]  \
  [get_cells {u_core_y2_reg[18]}]  \
  [get_cells {u_core_y2_reg[11]}]  \
  [get_cells {u_core_y2_reg[26]}]  \
  [get_cells {u_core_y2_reg[27]}]  \
  [get_cells {u_core_y2_reg[9]}]  \
  [get_cells {u_core_y2_reg[21]}]  \
  [get_cells {u_core_y2_reg[6]}]  \
  [get_cells {u_core_y2_reg[29]}]  \
  [get_cells {u_core_y2_reg[12]}]  \
  [get_cells {u_core_y2_reg[7]}]  \
  [get_cells {u_core_y2_reg[25]}]  \
  [get_cells {u_core_y2_reg[28]}]  \
  [get_cells {u_core_y2_reg[24]}]  \
  [get_cells {u_core_y2_reg[16]}]  \
  [get_cells {u_core_y2_reg[3]}]  \
  [get_cells {u_core_y2_reg[17]}]  \
  [get_cells {u_core_y2_reg[22]}]  \
  [get_cells {u_core_y2_reg[19]}]  \
  [get_cells {u_core_y2_reg[8]}] ]
group_path -name R2O_group -from [list \
  [get_cells {slow_cnt_reg[1]}]  \
  [get_cells {slow_cnt_reg[2]}]  \
  [get_cells {slow_cnt_reg[3]}]  \
  [get_cells {u_core_y1_reg[0]}]  \
  [get_cells {u_core_y1_reg[1]}]  \
  [get_cells {u_core_y1_reg[2]}]  \
  [get_cells {u_core_y1_reg[3]}]  \
  [get_cells {u_core_y1_reg[4]}]  \
  [get_cells {u_core_y1_reg[5]}]  \
  [get_cells {u_core_y1_reg[6]}]  \
  [get_cells {u_core_y1_reg[7]}]  \
  [get_cells {u_core_y1_reg[8]}]  \
  [get_cells {u_core_y1_reg[9]}]  \
  [get_cells {u_core_y1_reg[10]}]  \
  [get_cells {u_core_y1_reg[11]}]  \
  [get_cells {u_core_y1_reg[12]}]  \
  [get_cells {u_core_y1_reg[13]}]  \
  [get_cells {u_core_y1_reg[14]}]  \
  [get_cells {u_core_y1_reg[15]}]  \
  [get_cells {u_core_y1_reg[31]}]  \
  [get_cells {u_core_y2_reg[0]}]  \
  [get_cells {u_core_y2_reg[31]}]  \
  [get_cells {u_core_y3_reg[0]}]  \
  [get_cells {u_core_y3_reg[31]}]  \
  [get_cells u_dec_cnt_e_reg]  \
  [get_cells {u_dec_cnt_m_reg[0]}]  \
  [get_cells {u_dec_cnt_m_reg[1]}]  \
  [get_cells {u_dec_cnt_m_reg[2]}]  \
  [get_cells {u_dec_cnt_m_reg[3]}]  \
  [get_cells {u_dec_cnt_m_reg[4]}]  \
  [get_cells {u_dec_cnt_m_reg[5]}]  \
  [get_cells {u_dec_cnt_m_reg[6]}]  \
  [get_cells {u_dec_div_cnt_reg[1]}]  \
  [get_cells {u_dec_div_cnt_reg[2]}]  \
  [get_cells {u_dec_div_cnt_reg[3]}]  \
  [get_cells {u_dec_div_cnt_reg[4]}]  \
  [get_cells {u_dec_div_cnt_reg[5]}]  \
  [get_cells {u_sar_cnt_reg[0]}]  \
  [get_cells {u_sar_cnt_reg[1]}]  \
  [get_cells {u_sar_cnt_reg[3]}]  \
  [get_cells {u_sar_cnt_reg[4]}]  \
  [get_cells {u_sar_current_bit_reg[0]}]  \
  [get_cells {u_sar_current_bit_reg[3]}]  \
  [get_cells u_sar_done_conv_reg]  \
  [get_cells u_sar_en_comp_reg]  \
  [get_cells {u_sar_hold_reg[0]}]  \
  [get_cells {u_sar_hold_reg[1]}]  \
  [get_cells {u_sar_vin_dac_reg[0]}]  \
  [get_cells {u_sar_vin_dac_reg[1]}]  \
  [get_cells {u_sar_vin_dac_reg[2]}]  \
  [get_cells {u_sar_vin_dac_reg[3]}]  \
  [get_cells {u_sar_vin_dac_reg[4]}]  \
  [get_cells {u_sar_vin_dac_reg[5]}]  \
  [get_cells {u_sar_vin_dac_reg[6]}]  \
  [get_cells {u_sar_vin_dac_reg[7]}]  \
  [get_cells {u_sar_vin_dac_reg[8]}]  \
  [get_cells {u_sar_vin_dac_reg[9]}]  \
  [get_cells {u_sar_vin_dac_reg[10]}]  \
  [get_cells {u_core_slope_sel_q_reg[0]}]  \
  [get_cells {u_core_slope_sel_q_reg[1]}]  \
  [get_cells u_dec_ce_reg]  \
  [get_cells u_sar_en_dac_reg]  \
  [get_cells u_sar_sample_out_reg]  \
  [get_cells {u_sar_vsample_reg[0]}]  \
  [get_cells {u_sar_vsample_reg[1]}]  \
  [get_cells {u_sar_vsample_reg[2]}]  \
  [get_cells {u_sar_vsample_reg[3]}]  \
  [get_cells {u_sar_vsample_reg[4]}]  \
  [get_cells {u_sar_vsample_reg[5]}]  \
  [get_cells {u_sar_vsample_reg[6]}]  \
  [get_cells {u_sar_vsample_reg[7]}]  \
  [get_cells {u_sar_vsample_reg[8]}]  \
  [get_cells {u_sar_vsample_reg[9]}]  \
  [get_cells {u_sar_vsample_reg[10]}]  \
  [get_cells {u_sar_vsample_reg[11]}]  \
  [get_cells {slow_cnt_reg[0]}]  \
  [get_cells {u_dec_div_cnt_reg[0]}]  \
  [get_cells {u_sar_current_bit_reg[1]}]  \
  [get_cells u_sar_en_adc_reg]  \
  [get_cells {u_sar_vin_dac_reg[11]}]  \
  [get_cells {u_sar_current_bit_reg[2]}]  \
  [get_cells {u_sar_cnt_reg[2]}]  \
  [get_cells {u_sar_current_state_reg[0]}]  \
  [get_cells {u_core_y1_reg[29]}]  \
  [get_cells {u_core_y1_reg[20]}]  \
  [get_cells {u_core_y1_reg[18]}]  \
  [get_cells {u_core_y1_reg[21]}]  \
  [get_cells {u_core_y1_reg[23]}]  \
  [get_cells {u_core_y1_reg[17]}]  \
  [get_cells {u_core_y1_reg[28]}]  \
  [get_cells {u_core_y1_reg[16]}]  \
  [get_cells {u_core_y1_reg[19]}]  \
  [get_cells {u_core_y1_reg[26]}]  \
  [get_cells {u_core_y1_reg[25]}]  \
  [get_cells {u_core_y1_reg[27]}]  \
  [get_cells {u_core_y1_reg[22]}]  \
  [get_cells {u_core_y1_reg[24]}]  \
  [get_cells {u_core_y1_reg[30]}]  \
  [get_cells {u_core_y3_reg[1]}]  \
  [get_cells {u_core_y3_reg[10]}]  \
  [get_cells {u_core_y3_reg[13]}]  \
  [get_cells {u_core_y3_reg[2]}]  \
  [get_cells {u_core_y3_reg[30]}]  \
  [get_cells {u_core_y3_reg[14]}]  \
  [get_cells {u_core_y3_reg[15]}]  \
  [get_cells {u_core_y3_reg[20]}]  \
  [get_cells {u_core_y3_reg[5]}]  \
  [get_cells {u_core_y3_reg[4]}]  \
  [get_cells {u_core_y3_reg[23]}]  \
  [get_cells {u_core_y3_reg[18]}]  \
  [get_cells {u_core_y3_reg[11]}]  \
  [get_cells {u_core_y3_reg[26]}]  \
  [get_cells {u_core_y3_reg[27]}]  \
  [get_cells {u_core_y3_reg[9]}]  \
  [get_cells {u_core_y3_reg[21]}]  \
  [get_cells {u_core_y3_reg[6]}]  \
  [get_cells {u_core_y3_reg[29]}]  \
  [get_cells {u_core_y3_reg[12]}]  \
  [get_cells {u_core_y3_reg[7]}]  \
  [get_cells {u_core_y3_reg[25]}]  \
  [get_cells {u_core_y3_reg[28]}]  \
  [get_cells {u_core_y3_reg[24]}]  \
  [get_cells {u_core_y3_reg[16]}]  \
  [get_cells {u_core_y3_reg[3]}]  \
  [get_cells {u_core_y3_reg[17]}]  \
  [get_cells {u_core_y3_reg[22]}]  \
  [get_cells {u_core_y3_reg[19]}]  \
  [get_cells {u_core_y3_reg[8]}]  \
  [get_cells {u_core_y2_reg[1]}]  \
  [get_cells {u_core_y2_reg[10]}]  \
  [get_cells {u_core_y2_reg[13]}]  \
  [get_cells {u_core_y2_reg[2]}]  \
  [get_cells {u_core_y2_reg[30]}]  \
  [get_cells {u_core_y2_reg[14]}]  \
  [get_cells {u_core_y2_reg[15]}]  \
  [get_cells {u_core_y2_reg[20]}]  \
  [get_cells {u_core_y2_reg[5]}]  \
  [get_cells {u_core_y2_reg[4]}]  \
  [get_cells {u_core_y2_reg[23]}]  \
  [get_cells {u_core_y2_reg[18]}]  \
  [get_cells {u_core_y2_reg[11]}]  \
  [get_cells {u_core_y2_reg[26]}]  \
  [get_cells {u_core_y2_reg[27]}]  \
  [get_cells {u_core_y2_reg[9]}]  \
  [get_cells {u_core_y2_reg[21]}]  \
  [get_cells {u_core_y2_reg[6]}]  \
  [get_cells {u_core_y2_reg[29]}]  \
  [get_cells {u_core_y2_reg[12]}]  \
  [get_cells {u_core_y2_reg[7]}]  \
  [get_cells {u_core_y2_reg[25]}]  \
  [get_cells {u_core_y2_reg[28]}]  \
  [get_cells {u_core_y2_reg[24]}]  \
  [get_cells {u_core_y2_reg[16]}]  \
  [get_cells {u_core_y2_reg[3]}]  \
  [get_cells {u_core_y2_reg[17]}]  \
  [get_cells {u_core_y2_reg[22]}]  \
  [get_cells {u_core_y2_reg[19]}]  \
  [get_cells {u_core_y2_reg[8]}] ] -to [list \
  [get_ports en_adc]  \
  [get_ports en_dac]  \
  [get_ports en_comp]  \
  [get_ports sample_in]  \
  [get_ports sample_out]  \
  [get_ports {vdac[18]}]  \
  [get_ports {vdac[17]}]  \
  [get_ports {vdac[16]}]  \
  [get_ports {vdac[15]}]  \
  [get_ports {vdac[14]}]  \
  [get_ports {vdac[13]}]  \
  [get_ports {vdac[12]}]  \
  [get_ports {vdac[11]}]  \
  [get_ports {vdac[10]}]  \
  [get_ports {vdac[9]}]  \
  [get_ports {vdac[8]}]  \
  [get_ports {vdac[7]}]  \
  [get_ports {vdac[6]}]  \
  [get_ports {vdac[5]}]  \
  [get_ports {vdac[4]}]  \
  [get_ports {vdac[3]}]  \
  [get_ports {vdac[2]}]  \
  [get_ports {vdac[1]}]  \
  [get_ports {vdac[0]}] ]
group_path -name R2R_group -from [list \
  [get_cells {slow_cnt_reg[1]}]  \
  [get_cells {slow_cnt_reg[2]}]  \
  [get_cells {slow_cnt_reg[3]}]  \
  [get_cells {u_core_y1_reg[0]}]  \
  [get_cells {u_core_y1_reg[1]}]  \
  [get_cells {u_core_y1_reg[2]}]  \
  [get_cells {u_core_y1_reg[3]}]  \
  [get_cells {u_core_y1_reg[4]}]  \
  [get_cells {u_core_y1_reg[5]}]  \
  [get_cells {u_core_y1_reg[6]}]  \
  [get_cells {u_core_y1_reg[7]}]  \
  [get_cells {u_core_y1_reg[8]}]  \
  [get_cells {u_core_y1_reg[9]}]  \
  [get_cells {u_core_y1_reg[10]}]  \
  [get_cells {u_core_y1_reg[11]}]  \
  [get_cells {u_core_y1_reg[12]}]  \
  [get_cells {u_core_y1_reg[13]}]  \
  [get_cells {u_core_y1_reg[14]}]  \
  [get_cells {u_core_y1_reg[15]}]  \
  [get_cells {u_core_y1_reg[31]}]  \
  [get_cells {u_core_y2_reg[0]}]  \
  [get_cells {u_core_y2_reg[31]}]  \
  [get_cells {u_core_y3_reg[0]}]  \
  [get_cells {u_core_y3_reg[31]}]  \
  [get_cells u_dec_cnt_e_reg]  \
  [get_cells {u_dec_cnt_m_reg[0]}]  \
  [get_cells {u_dec_cnt_m_reg[1]}]  \
  [get_cells {u_dec_cnt_m_reg[2]}]  \
  [get_cells {u_dec_cnt_m_reg[3]}]  \
  [get_cells {u_dec_cnt_m_reg[4]}]  \
  [get_cells {u_dec_cnt_m_reg[5]}]  \
  [get_cells {u_dec_cnt_m_reg[6]}]  \
  [get_cells {u_dec_div_cnt_reg[1]}]  \
  [get_cells {u_dec_div_cnt_reg[2]}]  \
  [get_cells {u_dec_div_cnt_reg[3]}]  \
  [get_cells {u_dec_div_cnt_reg[4]}]  \
  [get_cells {u_dec_div_cnt_reg[5]}]  \
  [get_cells {u_sar_cnt_reg[0]}]  \
  [get_cells {u_sar_cnt_reg[1]}]  \
  [get_cells {u_sar_cnt_reg[3]}]  \
  [get_cells {u_sar_cnt_reg[4]}]  \
  [get_cells {u_sar_current_bit_reg[0]}]  \
  [get_cells {u_sar_current_bit_reg[3]}]  \
  [get_cells u_sar_done_conv_reg]  \
  [get_cells u_sar_en_comp_reg]  \
  [get_cells {u_sar_hold_reg[0]}]  \
  [get_cells {u_sar_hold_reg[1]}]  \
  [get_cells {u_sar_vin_dac_reg[0]}]  \
  [get_cells {u_sar_vin_dac_reg[1]}]  \
  [get_cells {u_sar_vin_dac_reg[2]}]  \
  [get_cells {u_sar_vin_dac_reg[3]}]  \
  [get_cells {u_sar_vin_dac_reg[4]}]  \
  [get_cells {u_sar_vin_dac_reg[5]}]  \
  [get_cells {u_sar_vin_dac_reg[6]}]  \
  [get_cells {u_sar_vin_dac_reg[7]}]  \
  [get_cells {u_sar_vin_dac_reg[8]}]  \
  [get_cells {u_sar_vin_dac_reg[9]}]  \
  [get_cells {u_sar_vin_dac_reg[10]}]  \
  [get_cells {u_core_slope_sel_q_reg[0]}]  \
  [get_cells {u_core_slope_sel_q_reg[1]}]  \
  [get_cells u_dec_ce_reg]  \
  [get_cells u_sar_en_dac_reg]  \
  [get_cells u_sar_sample_out_reg]  \
  [get_cells {u_sar_vsample_reg[0]}]  \
  [get_cells {u_sar_vsample_reg[1]}]  \
  [get_cells {u_sar_vsample_reg[2]}]  \
  [get_cells {u_sar_vsample_reg[3]}]  \
  [get_cells {u_sar_vsample_reg[4]}]  \
  [get_cells {u_sar_vsample_reg[5]}]  \
  [get_cells {u_sar_vsample_reg[6]}]  \
  [get_cells {u_sar_vsample_reg[7]}]  \
  [get_cells {u_sar_vsample_reg[8]}]  \
  [get_cells {u_sar_vsample_reg[9]}]  \
  [get_cells {u_sar_vsample_reg[10]}]  \
  [get_cells {u_sar_vsample_reg[11]}]  \
  [get_cells {slow_cnt_reg[0]}]  \
  [get_cells {u_dec_div_cnt_reg[0]}]  \
  [get_cells {u_sar_current_bit_reg[1]}]  \
  [get_cells u_sar_en_adc_reg]  \
  [get_cells {u_sar_vin_dac_reg[11]}]  \
  [get_cells {u_sar_current_bit_reg[2]}]  \
  [get_cells {u_sar_cnt_reg[2]}]  \
  [get_cells {u_sar_current_state_reg[0]}]  \
  [get_cells {u_core_y1_reg[29]}]  \
  [get_cells {u_core_y1_reg[20]}]  \
  [get_cells {u_core_y1_reg[18]}]  \
  [get_cells {u_core_y1_reg[21]}]  \
  [get_cells {u_core_y1_reg[23]}]  \
  [get_cells {u_core_y1_reg[17]}]  \
  [get_cells {u_core_y1_reg[28]}]  \
  [get_cells {u_core_y1_reg[16]}]  \
  [get_cells {u_core_y1_reg[19]}]  \
  [get_cells {u_core_y1_reg[26]}]  \
  [get_cells {u_core_y1_reg[25]}]  \
  [get_cells {u_core_y1_reg[27]}]  \
  [get_cells {u_core_y1_reg[22]}]  \
  [get_cells {u_core_y1_reg[24]}]  \
  [get_cells {u_core_y1_reg[30]}]  \
  [get_cells {u_core_y3_reg[1]}]  \
  [get_cells {u_core_y3_reg[10]}]  \
  [get_cells {u_core_y3_reg[13]}]  \
  [get_cells {u_core_y3_reg[2]}]  \
  [get_cells {u_core_y3_reg[30]}]  \
  [get_cells {u_core_y3_reg[14]}]  \
  [get_cells {u_core_y3_reg[15]}]  \
  [get_cells {u_core_y3_reg[20]}]  \
  [get_cells {u_core_y3_reg[5]}]  \
  [get_cells {u_core_y3_reg[4]}]  \
  [get_cells {u_core_y3_reg[23]}]  \
  [get_cells {u_core_y3_reg[18]}]  \
  [get_cells {u_core_y3_reg[11]}]  \
  [get_cells {u_core_y3_reg[26]}]  \
  [get_cells {u_core_y3_reg[27]}]  \
  [get_cells {u_core_y3_reg[9]}]  \
  [get_cells {u_core_y3_reg[21]}]  \
  [get_cells {u_core_y3_reg[6]}]  \
  [get_cells {u_core_y3_reg[29]}]  \
  [get_cells {u_core_y3_reg[12]}]  \
  [get_cells {u_core_y3_reg[7]}]  \
  [get_cells {u_core_y3_reg[25]}]  \
  [get_cells {u_core_y3_reg[28]}]  \
  [get_cells {u_core_y3_reg[24]}]  \
  [get_cells {u_core_y3_reg[16]}]  \
  [get_cells {u_core_y3_reg[3]}]  \
  [get_cells {u_core_y3_reg[17]}]  \
  [get_cells {u_core_y3_reg[22]}]  \
  [get_cells {u_core_y3_reg[19]}]  \
  [get_cells {u_core_y3_reg[8]}]  \
  [get_cells {u_core_y2_reg[1]}]  \
  [get_cells {u_core_y2_reg[10]}]  \
  [get_cells {u_core_y2_reg[13]}]  \
  [get_cells {u_core_y2_reg[2]}]  \
  [get_cells {u_core_y2_reg[30]}]  \
  [get_cells {u_core_y2_reg[14]}]  \
  [get_cells {u_core_y2_reg[15]}]  \
  [get_cells {u_core_y2_reg[20]}]  \
  [get_cells {u_core_y2_reg[5]}]  \
  [get_cells {u_core_y2_reg[4]}]  \
  [get_cells {u_core_y2_reg[23]}]  \
  [get_cells {u_core_y2_reg[18]}]  \
  [get_cells {u_core_y2_reg[11]}]  \
  [get_cells {u_core_y2_reg[26]}]  \
  [get_cells {u_core_y2_reg[27]}]  \
  [get_cells {u_core_y2_reg[9]}]  \
  [get_cells {u_core_y2_reg[21]}]  \
  [get_cells {u_core_y2_reg[6]}]  \
  [get_cells {u_core_y2_reg[29]}]  \
  [get_cells {u_core_y2_reg[12]}]  \
  [get_cells {u_core_y2_reg[7]}]  \
  [get_cells {u_core_y2_reg[25]}]  \
  [get_cells {u_core_y2_reg[28]}]  \
  [get_cells {u_core_y2_reg[24]}]  \
  [get_cells {u_core_y2_reg[16]}]  \
  [get_cells {u_core_y2_reg[3]}]  \
  [get_cells {u_core_y2_reg[17]}]  \
  [get_cells {u_core_y2_reg[22]}]  \
  [get_cells {u_core_y2_reg[19]}]  \
  [get_cells {u_core_y2_reg[8]}] ] -to [list \
  [get_cells u_core_RC_CG_HIER_INST0/RC_CGIC_INST]  \
  [get_cells u_core_RC_CG_HIER_INST1/RC_CGIC_INST]  \
  [get_cells u_core_RC_CG_HIER_INST2/RC_CGIC_INST]  \
  [get_cells u_sar_RC_CG_HIER_INST3/RC_CGIC_INST]  \
  [get_cells u_sar_RC_CG_HIER_INST4/RC_CGIC_INST]  \
  [get_cells u_sar_RC_CG_HIER_INST5/RC_CGIC_INST]  \
  [get_cells u_sar_RC_CG_HIER_INST6/RC_CGIC_INST]  \
  [get_cells RC_CG_HIER_INST7/RC_CGIC_INST]  \
  [get_cells RC_CG_HIER_INST8/RC_CGIC_INST]  \
  [get_cells RC_CG_HIER_INST9/RC_CGIC_INST]  \
  [get_cells {slow_cnt_reg[1]}]  \
  [get_cells {slow_cnt_reg[2]}]  \
  [get_cells {slow_cnt_reg[3]}]  \
  [get_cells {u_core_y1_reg[0]}]  \
  [get_cells {u_core_y1_reg[1]}]  \
  [get_cells {u_core_y1_reg[2]}]  \
  [get_cells {u_core_y1_reg[3]}]  \
  [get_cells {u_core_y1_reg[4]}]  \
  [get_cells {u_core_y1_reg[5]}]  \
  [get_cells {u_core_y1_reg[6]}]  \
  [get_cells {u_core_y1_reg[7]}]  \
  [get_cells {u_core_y1_reg[8]}]  \
  [get_cells {u_core_y1_reg[9]}]  \
  [get_cells {u_core_y1_reg[10]}]  \
  [get_cells {u_core_y1_reg[11]}]  \
  [get_cells {u_core_y1_reg[12]}]  \
  [get_cells {u_core_y1_reg[13]}]  \
  [get_cells {u_core_y1_reg[14]}]  \
  [get_cells {u_core_y1_reg[15]}]  \
  [get_cells {u_core_y1_reg[31]}]  \
  [get_cells {u_core_y2_reg[0]}]  \
  [get_cells {u_core_y2_reg[31]}]  \
  [get_cells {u_core_y3_reg[0]}]  \
  [get_cells {u_core_y3_reg[31]}]  \
  [get_cells u_dec_cnt_e_reg]  \
  [get_cells {u_dec_cnt_m_reg[0]}]  \
  [get_cells {u_dec_cnt_m_reg[1]}]  \
  [get_cells {u_dec_cnt_m_reg[2]}]  \
  [get_cells {u_dec_cnt_m_reg[3]}]  \
  [get_cells {u_dec_cnt_m_reg[4]}]  \
  [get_cells {u_dec_cnt_m_reg[5]}]  \
  [get_cells {u_dec_cnt_m_reg[6]}]  \
  [get_cells {u_dec_div_cnt_reg[1]}]  \
  [get_cells {u_dec_div_cnt_reg[2]}]  \
  [get_cells {u_dec_div_cnt_reg[3]}]  \
  [get_cells {u_dec_div_cnt_reg[4]}]  \
  [get_cells {u_dec_div_cnt_reg[5]}]  \
  [get_cells {u_sar_cnt_reg[0]}]  \
  [get_cells {u_sar_cnt_reg[1]}]  \
  [get_cells {u_sar_cnt_reg[3]}]  \
  [get_cells {u_sar_cnt_reg[4]}]  \
  [get_cells {u_sar_current_bit_reg[0]}]  \
  [get_cells {u_sar_current_bit_reg[3]}]  \
  [get_cells u_sar_done_conv_reg]  \
  [get_cells u_sar_en_comp_reg]  \
  [get_cells {u_sar_hold_reg[0]}]  \
  [get_cells {u_sar_hold_reg[1]}]  \
  [get_cells {u_sar_vin_dac_reg[0]}]  \
  [get_cells {u_sar_vin_dac_reg[1]}]  \
  [get_cells {u_sar_vin_dac_reg[2]}]  \
  [get_cells {u_sar_vin_dac_reg[3]}]  \
  [get_cells {u_sar_vin_dac_reg[4]}]  \
  [get_cells {u_sar_vin_dac_reg[5]}]  \
  [get_cells {u_sar_vin_dac_reg[6]}]  \
  [get_cells {u_sar_vin_dac_reg[7]}]  \
  [get_cells {u_sar_vin_dac_reg[8]}]  \
  [get_cells {u_sar_vin_dac_reg[9]}]  \
  [get_cells {u_sar_vin_dac_reg[10]}]  \
  [get_cells {u_core_slope_sel_q_reg[0]}]  \
  [get_cells {u_core_slope_sel_q_reg[1]}]  \
  [get_cells u_dec_ce_reg]  \
  [get_cells u_sar_en_dac_reg]  \
  [get_cells u_sar_sample_out_reg]  \
  [get_cells {u_sar_vsample_reg[0]}]  \
  [get_cells {u_sar_vsample_reg[1]}]  \
  [get_cells {u_sar_vsample_reg[2]}]  \
  [get_cells {u_sar_vsample_reg[3]}]  \
  [get_cells {u_sar_vsample_reg[4]}]  \
  [get_cells {u_sar_vsample_reg[5]}]  \
  [get_cells {u_sar_vsample_reg[6]}]  \
  [get_cells {u_sar_vsample_reg[7]}]  \
  [get_cells {u_sar_vsample_reg[8]}]  \
  [get_cells {u_sar_vsample_reg[9]}]  \
  [get_cells {u_sar_vsample_reg[10]}]  \
  [get_cells {u_sar_vsample_reg[11]}]  \
  [get_cells {slow_cnt_reg[0]}]  \
  [get_cells {u_dec_div_cnt_reg[0]}]  \
  [get_cells {u_sar_current_bit_reg[1]}]  \
  [get_cells u_sar_en_adc_reg]  \
  [get_cells {u_sar_vin_dac_reg[11]}]  \
  [get_cells {u_sar_current_bit_reg[2]}]  \
  [get_cells {u_sar_cnt_reg[2]}]  \
  [get_cells {u_sar_current_state_reg[0]}]  \
  [get_cells {u_core_y1_reg[29]}]  \
  [get_cells {u_core_y1_reg[20]}]  \
  [get_cells {u_core_y1_reg[18]}]  \
  [get_cells {u_core_y1_reg[21]}]  \
  [get_cells {u_core_y1_reg[23]}]  \
  [get_cells {u_core_y1_reg[17]}]  \
  [get_cells {u_core_y1_reg[28]}]  \
  [get_cells {u_core_y1_reg[16]}]  \
  [get_cells {u_core_y1_reg[19]}]  \
  [get_cells {u_core_y1_reg[26]}]  \
  [get_cells {u_core_y1_reg[25]}]  \
  [get_cells {u_core_y1_reg[27]}]  \
  [get_cells {u_core_y1_reg[22]}]  \
  [get_cells {u_core_y1_reg[24]}]  \
  [get_cells {u_core_y1_reg[30]}]  \
  [get_cells {u_core_y3_reg[1]}]  \
  [get_cells {u_core_y3_reg[10]}]  \
  [get_cells {u_core_y3_reg[13]}]  \
  [get_cells {u_core_y3_reg[2]}]  \
  [get_cells {u_core_y3_reg[30]}]  \
  [get_cells {u_core_y3_reg[14]}]  \
  [get_cells {u_core_y3_reg[15]}]  \
  [get_cells {u_core_y3_reg[20]}]  \
  [get_cells {u_core_y3_reg[5]}]  \
  [get_cells {u_core_y3_reg[4]}]  \
  [get_cells {u_core_y3_reg[23]}]  \
  [get_cells {u_core_y3_reg[18]}]  \
  [get_cells {u_core_y3_reg[11]}]  \
  [get_cells {u_core_y3_reg[26]}]  \
  [get_cells {u_core_y3_reg[27]}]  \
  [get_cells {u_core_y3_reg[9]}]  \
  [get_cells {u_core_y3_reg[21]}]  \
  [get_cells {u_core_y3_reg[6]}]  \
  [get_cells {u_core_y3_reg[29]}]  \
  [get_cells {u_core_y3_reg[12]}]  \
  [get_cells {u_core_y3_reg[7]}]  \
  [get_cells {u_core_y3_reg[25]}]  \
  [get_cells {u_core_y3_reg[28]}]  \
  [get_cells {u_core_y3_reg[24]}]  \
  [get_cells {u_core_y3_reg[16]}]  \
  [get_cells {u_core_y3_reg[3]}]  \
  [get_cells {u_core_y3_reg[17]}]  \
  [get_cells {u_core_y3_reg[22]}]  \
  [get_cells {u_core_y3_reg[19]}]  \
  [get_cells {u_core_y3_reg[8]}]  \
  [get_cells {u_core_y2_reg[1]}]  \
  [get_cells {u_core_y2_reg[10]}]  \
  [get_cells {u_core_y2_reg[13]}]  \
  [get_cells {u_core_y2_reg[2]}]  \
  [get_cells {u_core_y2_reg[30]}]  \
  [get_cells {u_core_y2_reg[14]}]  \
  [get_cells {u_core_y2_reg[15]}]  \
  [get_cells {u_core_y2_reg[20]}]  \
  [get_cells {u_core_y2_reg[5]}]  \
  [get_cells {u_core_y2_reg[4]}]  \
  [get_cells {u_core_y2_reg[23]}]  \
  [get_cells {u_core_y2_reg[18]}]  \
  [get_cells {u_core_y2_reg[11]}]  \
  [get_cells {u_core_y2_reg[26]}]  \
  [get_cells {u_core_y2_reg[27]}]  \
  [get_cells {u_core_y2_reg[9]}]  \
  [get_cells {u_core_y2_reg[21]}]  \
  [get_cells {u_core_y2_reg[6]}]  \
  [get_cells {u_core_y2_reg[29]}]  \
  [get_cells {u_core_y2_reg[12]}]  \
  [get_cells {u_core_y2_reg[7]}]  \
  [get_cells {u_core_y2_reg[25]}]  \
  [get_cells {u_core_y2_reg[28]}]  \
  [get_cells {u_core_y2_reg[24]}]  \
  [get_cells {u_core_y2_reg[16]}]  \
  [get_cells {u_core_y2_reg[3]}]  \
  [get_cells {u_core_y2_reg[17]}]  \
  [get_cells {u_core_y2_reg[22]}]  \
  [get_cells {u_core_y2_reg[19]}]  \
  [get_cells {u_core_y2_reg[8]}] ]
group_path -name cg_enable_group_clk -through [list \
  [get_pins u_core_RC_CG_HIER_INST0/enable]  \
  [get_pins u_core_RC_CG_HIER_INST0/RC_CGIC_INST/E]  \
  [get_pins u_core_RC_CG_HIER_INST1/enable]  \
  [get_pins u_core_RC_CG_HIER_INST1/RC_CGIC_INST/E]  \
  [get_pins u_core_RC_CG_HIER_INST2/enable]  \
  [get_pins u_core_RC_CG_HIER_INST2/RC_CGIC_INST/E]  \
  [get_pins u_sar_RC_CG_HIER_INST3/enable]  \
  [get_pins u_sar_RC_CG_HIER_INST3/RC_CGIC_INST/E]  \
  [get_pins u_sar_RC_CG_HIER_INST4/enable]  \
  [get_pins u_sar_RC_CG_HIER_INST4/RC_CGIC_INST/E]  \
  [get_pins u_sar_RC_CG_HIER_INST5/enable]  \
  [get_pins u_sar_RC_CG_HIER_INST5/RC_CGIC_INST/E]  \
  [get_pins u_sar_RC_CG_HIER_INST6/enable]  \
  [get_pins u_sar_RC_CG_HIER_INST6/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST7/enable]  \
  [get_pins RC_CG_HIER_INST7/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST8/enable]  \
  [get_pins RC_CG_HIER_INST8/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST7/enable]  \
  [get_pins RC_CG_HIER_INST7/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST8/enable]  \
  [get_pins RC_CG_HIER_INST8/RC_CGIC_INST/E]  \
  [get_pins u_core_RC_CG_HIER_INST0/enable]  \
  [get_pins u_core_RC_CG_HIER_INST0/RC_CGIC_INST/E]  \
  [get_pins u_core_RC_CG_HIER_INST1/enable]  \
  [get_pins u_core_RC_CG_HIER_INST1/RC_CGIC_INST/E]  \
  [get_pins u_core_RC_CG_HIER_INST2/enable]  \
  [get_pins u_core_RC_CG_HIER_INST2/RC_CGIC_INST/E]  \
  [get_pins u_sar_RC_CG_HIER_INST3/enable]  \
  [get_pins u_sar_RC_CG_HIER_INST3/RC_CGIC_INST/E]  \
  [get_pins u_sar_RC_CG_HIER_INST4/enable]  \
  [get_pins u_sar_RC_CG_HIER_INST4/RC_CGIC_INST/E]  \
  [get_pins u_sar_RC_CG_HIER_INST5/enable]  \
  [get_pins u_sar_RC_CG_HIER_INST5/RC_CGIC_INST/E]  \
  [get_pins u_sar_RC_CG_HIER_INST6/enable]  \
  [get_pins u_sar_RC_CG_HIER_INST6/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST9/enable]  \
  [get_pins RC_CG_HIER_INST9/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST7/enable]  \
  [get_pins RC_CG_HIER_INST7/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST8/enable]  \
  [get_pins RC_CG_HIER_INST8/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST9/enable]  \
  [get_pins RC_CG_HIER_INST9/RC_CGIC_INST/E]  \
  [get_pins u_core_RC_CG_HIER_INST0/enable]  \
  [get_pins u_core_RC_CG_HIER_INST0/RC_CGIC_INST/E]  \
  [get_pins u_core_RC_CG_HIER_INST1/enable]  \
  [get_pins u_core_RC_CG_HIER_INST1/RC_CGIC_INST/E]  \
  [get_pins u_core_RC_CG_HIER_INST2/enable]  \
  [get_pins u_core_RC_CG_HIER_INST2/RC_CGIC_INST/E]  \
  [get_pins u_sar_RC_CG_HIER_INST3/enable]  \
  [get_pins u_sar_RC_CG_HIER_INST3/RC_CGIC_INST/E]  \
  [get_pins u_sar_RC_CG_HIER_INST4/enable]  \
  [get_pins u_sar_RC_CG_HIER_INST4/RC_CGIC_INST/E]  \
  [get_pins u_sar_RC_CG_HIER_INST5/enable]  \
  [get_pins u_sar_RC_CG_HIER_INST5/RC_CGIC_INST/E]  \
  [get_pins u_sar_RC_CG_HIER_INST6/enable]  \
  [get_pins u_sar_RC_CG_HIER_INST6/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST7/enable]  \
  [get_pins RC_CG_HIER_INST7/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST8/enable]  \
  [get_pins RC_CG_HIER_INST8/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST9/enable]  \
  [get_pins RC_CG_HIER_INST9/RC_CGIC_INST/E]  \
  [get_pins u_core_RC_CG_HIER_INST0/enable]  \
  [get_pins u_core_RC_CG_HIER_INST0/RC_CGIC_INST/E]  \
  [get_pins u_core_RC_CG_HIER_INST1/enable]  \
  [get_pins u_core_RC_CG_HIER_INST1/RC_CGIC_INST/E]  \
  [get_pins u_core_RC_CG_HIER_INST2/enable]  \
  [get_pins u_core_RC_CG_HIER_INST2/RC_CGIC_INST/E]  \
  [get_pins u_sar_RC_CG_HIER_INST3/enable]  \
  [get_pins u_sar_RC_CG_HIER_INST3/RC_CGIC_INST/E]  \
  [get_pins u_sar_RC_CG_HIER_INST4/enable]  \
  [get_pins u_sar_RC_CG_HIER_INST4/RC_CGIC_INST/E]  \
  [get_pins u_sar_RC_CG_HIER_INST5/enable]  \
  [get_pins u_sar_RC_CG_HIER_INST5/RC_CGIC_INST/E]  \
  [get_pins u_sar_RC_CG_HIER_INST6/enable]  \
  [get_pins u_sar_RC_CG_HIER_INST6/RC_CGIC_INST/E] ]
set_clock_gating_check -setup 0.0 
set_output_delay -clock [get_clocks clk] -network_latency_included -add_delay -max 40.0 [get_ports en_adc]
set_output_delay -clock [get_clocks clk] -network_latency_included -add_delay -max 40.0 [get_ports en_dac]
set_output_delay -clock [get_clocks clk] -network_latency_included -add_delay -max 40.0 [get_ports en_comp]
set_output_delay -clock [get_clocks clk] -network_latency_included -add_delay -max 40.0 [get_ports sample_in]
set_output_delay -clock [get_clocks clk] -network_latency_included -add_delay -max 40.0 [get_ports sample_out]
set_output_delay -clock [get_clocks clk] -network_latency_included -add_delay -max 40.0 [get_ports {vdac[18]}]
set_output_delay -clock [get_clocks clk] -network_latency_included -add_delay -max 40.0 [get_ports {vdac[17]}]
set_output_delay -clock [get_clocks clk] -network_latency_included -add_delay -max 40.0 [get_ports {vdac[16]}]
set_output_delay -clock [get_clocks clk] -network_latency_included -add_delay -max 40.0 [get_ports {vdac[15]}]
set_output_delay -clock [get_clocks clk] -network_latency_included -add_delay -max 40.0 [get_ports {vdac[14]}]
set_output_delay -clock [get_clocks clk] -network_latency_included -add_delay -max 40.0 [get_ports {vdac[13]}]
set_output_delay -clock [get_clocks clk] -network_latency_included -add_delay -max 40.0 [get_ports {vdac[12]}]
set_output_delay -clock [get_clocks clk] -network_latency_included -add_delay -max 40.0 [get_ports {vdac[11]}]
set_output_delay -clock [get_clocks clk] -network_latency_included -add_delay -max 40.0 [get_ports {vdac[10]}]
set_output_delay -clock [get_clocks clk] -network_latency_included -add_delay -max 40.0 [get_ports {vdac[9]}]
set_output_delay -clock [get_clocks clk] -network_latency_included -add_delay -max 40.0 [get_ports {vdac[8]}]
set_output_delay -clock [get_clocks clk] -network_latency_included -add_delay -max 40.0 [get_ports {vdac[7]}]
set_output_delay -clock [get_clocks clk] -network_latency_included -add_delay -max 40.0 [get_ports {vdac[6]}]
set_output_delay -clock [get_clocks clk] -network_latency_included -add_delay -max 40.0 [get_ports {vdac[5]}]
set_output_delay -clock [get_clocks clk] -network_latency_included -add_delay -max 40.0 [get_ports {vdac[4]}]
set_output_delay -clock [get_clocks clk] -network_latency_included -add_delay -max 40.0 [get_ports {vdac[3]}]
set_output_delay -clock [get_clocks clk] -network_latency_included -add_delay -max 40.0 [get_ports {vdac[2]}]
set_output_delay -clock [get_clocks clk] -network_latency_included -add_delay -max 40.0 [get_ports {vdac[1]}]
set_output_delay -clock [get_clocks clk] -network_latency_included -add_delay -max 40.0 [get_ports {vdac[0]}]
set_output_delay -clock [get_clocks clk] -network_latency_included -add_delay -min 0.5 [get_ports en_adc]
set_output_delay -clock [get_clocks clk] -network_latency_included -add_delay -min 0.5 [get_ports en_dac]
set_output_delay -clock [get_clocks clk] -network_latency_included -add_delay -min 0.5 [get_ports en_comp]
set_output_delay -clock [get_clocks clk] -network_latency_included -add_delay -min 0.5 [get_ports sample_in]
set_output_delay -clock [get_clocks clk] -network_latency_included -add_delay -min 0.5 [get_ports sample_out]
set_output_delay -clock [get_clocks clk] -network_latency_included -add_delay -min 0.5 [get_ports {vdac[18]}]
set_output_delay -clock [get_clocks clk] -network_latency_included -add_delay -min 0.5 [get_ports {vdac[17]}]
set_output_delay -clock [get_clocks clk] -network_latency_included -add_delay -min 0.5 [get_ports {vdac[16]}]
set_output_delay -clock [get_clocks clk] -network_latency_included -add_delay -min 0.5 [get_ports {vdac[15]}]
set_output_delay -clock [get_clocks clk] -network_latency_included -add_delay -min 0.5 [get_ports {vdac[14]}]
set_output_delay -clock [get_clocks clk] -network_latency_included -add_delay -min 0.5 [get_ports {vdac[13]}]
set_output_delay -clock [get_clocks clk] -network_latency_included -add_delay -min 0.5 [get_ports {vdac[12]}]
set_output_delay -clock [get_clocks clk] -network_latency_included -add_delay -min 0.5 [get_ports {vdac[11]}]
set_output_delay -clock [get_clocks clk] -network_latency_included -add_delay -min 0.5 [get_ports {vdac[10]}]
set_output_delay -clock [get_clocks clk] -network_latency_included -add_delay -min 0.5 [get_ports {vdac[9]}]
set_output_delay -clock [get_clocks clk] -network_latency_included -add_delay -min 0.5 [get_ports {vdac[8]}]
set_output_delay -clock [get_clocks clk] -network_latency_included -add_delay -min 0.5 [get_ports {vdac[7]}]
set_output_delay -clock [get_clocks clk] -network_latency_included -add_delay -min 0.5 [get_ports {vdac[6]}]
set_output_delay -clock [get_clocks clk] -network_latency_included -add_delay -min 0.5 [get_ports {vdac[5]}]
set_output_delay -clock [get_clocks clk] -network_latency_included -add_delay -min 0.5 [get_ports {vdac[4]}]
set_output_delay -clock [get_clocks clk] -network_latency_included -add_delay -min 0.5 [get_ports {vdac[3]}]
set_output_delay -clock [get_clocks clk] -network_latency_included -add_delay -min 0.5 [get_ports {vdac[2]}]
set_output_delay -clock [get_clocks clk] -network_latency_included -add_delay -min 0.5 [get_ports {vdac[1]}]
set_output_delay -clock [get_clocks clk] -network_latency_included -add_delay -min 0.5 [get_ports {vdac[0]}]
set_input_delay -clock [get_clocks clk] -network_latency_included -add_delay -max 40.0 [get_ports rst]
set_input_delay -clock [get_clocks clk] -network_latency_included -add_delay -max 40.0 [get_ports bypass]
set_input_delay -clock [get_clocks clk] -network_latency_included -add_delay -max 40.0 [get_ports vout_p]
set_input_delay -clock [get_clocks clk] -network_latency_included -add_delay -max 40.0 [get_ports vout_n]
set_input_delay -clock [get_clocks clk] -network_latency_included -add_delay -max 40.0 [get_ports {mode_sel[2]}]
set_input_delay -clock [get_clocks clk] -network_latency_included -add_delay -max 40.0 [get_ports {mode_sel[1]}]
set_input_delay -clock [get_clocks clk] -network_latency_included -add_delay -max 40.0 [get_ports {mode_sel[0]}]
set_input_delay -clock [get_clocks clk] -network_latency_included -add_delay -max 40.0 [get_ports {slope_sel[1]}]
set_input_delay -clock [get_clocks clk] -network_latency_included -add_delay -max 40.0 [get_ports {slope_sel[0]}]
set_input_delay -clock [get_clocks clk] -network_latency_included -add_delay -min 0.5 [get_ports rst]
set_input_delay -clock [get_clocks clk] -network_latency_included -add_delay -min 0.5 [get_ports bypass]
set_input_delay -clock [get_clocks clk] -network_latency_included -add_delay -min 0.5 [get_ports vout_p]
set_input_delay -clock [get_clocks clk] -network_latency_included -add_delay -min 0.5 [get_ports vout_n]
set_input_delay -clock [get_clocks clk] -network_latency_included -add_delay -min 0.5 [get_ports {mode_sel[2]}]
set_input_delay -clock [get_clocks clk] -network_latency_included -add_delay -min 0.5 [get_ports {mode_sel[1]}]
set_input_delay -clock [get_clocks clk] -network_latency_included -add_delay -min 0.5 [get_ports {mode_sel[0]}]
set_input_delay -clock [get_clocks clk] -network_latency_included -add_delay -min 0.5 [get_ports {slope_sel[1]}]
set_input_delay -clock [get_clocks clk] -network_latency_included -add_delay -min 0.5 [get_ports {slope_sel[0]}]
set_driving_cell -min -lib_cell BUHDX12 -library D_CELLS_HD_LPMOS_typ_1_80V_25C -pin "Q" [get_ports rst]
set_driving_cell -max -lib_cell BUHDX2 -library D_CELLS_HD_LPMOS_typ_1_80V_25C -pin "Q" [get_ports rst]
set_driving_cell -min -lib_cell BUHDX12 -library D_CELLS_HD_LPMOS_typ_1_80V_25C -pin "Q" [get_ports bypass]
set_driving_cell -max -lib_cell BUHDX2 -library D_CELLS_HD_LPMOS_typ_1_80V_25C -pin "Q" [get_ports bypass]
set_driving_cell -min -lib_cell BUHDX12 -library D_CELLS_HD_LPMOS_typ_1_80V_25C -pin "Q" [get_ports vout_p]
set_driving_cell -max -lib_cell BUHDX2 -library D_CELLS_HD_LPMOS_typ_1_80V_25C -pin "Q" [get_ports vout_p]
set_driving_cell -min -lib_cell BUHDX12 -library D_CELLS_HD_LPMOS_typ_1_80V_25C -pin "Q" [get_ports vout_n]
set_driving_cell -max -lib_cell BUHDX2 -library D_CELLS_HD_LPMOS_typ_1_80V_25C -pin "Q" [get_ports vout_n]
set_driving_cell -min -lib_cell BUHDX12 -library D_CELLS_HD_LPMOS_typ_1_80V_25C -pin "Q" [get_ports {mode_sel[2]}]
set_driving_cell -max -lib_cell BUHDX2 -library D_CELLS_HD_LPMOS_typ_1_80V_25C -pin "Q" [get_ports {mode_sel[2]}]
set_driving_cell -min -lib_cell BUHDX12 -library D_CELLS_HD_LPMOS_typ_1_80V_25C -pin "Q" [get_ports {mode_sel[1]}]
set_driving_cell -max -lib_cell BUHDX2 -library D_CELLS_HD_LPMOS_typ_1_80V_25C -pin "Q" [get_ports {mode_sel[1]}]
set_driving_cell -min -lib_cell BUHDX12 -library D_CELLS_HD_LPMOS_typ_1_80V_25C -pin "Q" [get_ports {mode_sel[0]}]
set_driving_cell -max -lib_cell BUHDX2 -library D_CELLS_HD_LPMOS_typ_1_80V_25C -pin "Q" [get_ports {mode_sel[0]}]
set_driving_cell -min -lib_cell BUHDX12 -library D_CELLS_HD_LPMOS_typ_1_80V_25C -pin "Q" [get_ports {slope_sel[1]}]
set_driving_cell -max -lib_cell BUHDX2 -library D_CELLS_HD_LPMOS_typ_1_80V_25C -pin "Q" [get_ports {slope_sel[1]}]
set_driving_cell -min -lib_cell BUHDX12 -library D_CELLS_HD_LPMOS_typ_1_80V_25C -pin "Q" [get_ports {slope_sel[0]}]
set_driving_cell -max -lib_cell BUHDX2 -library D_CELLS_HD_LPMOS_typ_1_80V_25C -pin "Q" [get_ports {slope_sel[0]}]
set_dont_use false [get_lib_cells D_CELLS_HD_LPMOS_typ_1_80V_25C/LGCNHDX0]
set_dont_use false [get_lib_cells D_CELLS_HD_LPMOS_typ_1_80V_25C/LGCNHDX1]
set_dont_use false [get_lib_cells D_CELLS_HD_LPMOS_typ_1_80V_25C/LGCNHDX2]
set_dont_use false [get_lib_cells D_CELLS_HD_LPMOS_typ_1_80V_25C/LGCNHDX4]
set_dont_use false [get_lib_cells D_CELLS_HD_LPMOS_typ_1_80V_25C/LGCPHDX0]
set_dont_use false [get_lib_cells D_CELLS_HD_LPMOS_typ_1_80V_25C/LGCPHDX1]
set_dont_use false [get_lib_cells D_CELLS_HD_LPMOS_typ_1_80V_25C/LGCPHDX2]
set_dont_use false [get_lib_cells D_CELLS_HD_LPMOS_typ_1_80V_25C/LGCPHDX4]
set_dont_use false [get_lib_cells D_CELLS_HD_LPMOS_typ_1_80V_25C/LSGCNHDX0]
set_dont_use false [get_lib_cells D_CELLS_HD_LPMOS_typ_1_80V_25C/LSGCNHDX1]
set_dont_use false [get_lib_cells D_CELLS_HD_LPMOS_typ_1_80V_25C/LSGCNHDX2]
set_dont_use false [get_lib_cells D_CELLS_HD_LPMOS_typ_1_80V_25C/LSGCNHDX4]
set_dont_use false [get_lib_cells D_CELLS_HD_LPMOS_typ_1_80V_25C/LSGCPHDX0]
set_dont_use false [get_lib_cells D_CELLS_HD_LPMOS_typ_1_80V_25C/LSGCPHDX1]
set_dont_use false [get_lib_cells D_CELLS_HD_LPMOS_typ_1_80V_25C/LSGCPHDX2]
set_dont_use false [get_lib_cells D_CELLS_HD_LPMOS_typ_1_80V_25C/LSGCPHDX4]
set_dont_use false [get_lib_cells D_CELLS_HD_LPMOS_typ_1_80V_25C/LSOGCNHDX0]
set_dont_use false [get_lib_cells D_CELLS_HD_LPMOS_typ_1_80V_25C/LSOGCNHDX1]
set_dont_use false [get_lib_cells D_CELLS_HD_LPMOS_typ_1_80V_25C/LSOGCNHDX2]
set_dont_use false [get_lib_cells D_CELLS_HD_LPMOS_typ_1_80V_25C/LSOGCNHDX4]
set_dont_use false [get_lib_cells D_CELLS_HD_LPMOS_typ_1_80V_25C/LSOGCPHDX0]
set_dont_use false [get_lib_cells D_CELLS_HD_LPMOS_typ_1_80V_25C/LSOGCPHDX1]
set_dont_use false [get_lib_cells D_CELLS_HD_LPMOS_typ_1_80V_25C/LSOGCPHDX2]
set_dont_use false [get_lib_cells D_CELLS_HD_LPMOS_typ_1_80V_25C/LSOGCPHDX4]
set_clock_latency  0.2 [get_clocks clk]
set_clock_uncertainty -setup 0.1 [get_clocks clk]
set_clock_uncertainty -hold 0.1 [get_clocks clk]
