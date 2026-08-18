module wrapper #(
  parameter ADC_BITS = 12,
  parameter WIDTH    = 32
)(
  input  logic clk,
  input  logic rst,
  input  logic bypass,
  input  logic vout_p,
  input  logic vout_n,
  input  logic [2:0] mode_sel,
  input  logic [1:0] slope_sel,
  output logic en_adc,
  output logic en_dac,
  output logic en_comp,
  output logic sample_in,
  output logic sample_out,
  output logic [ADC_BITS+6:0] vdac
);

  logic ce, use_slow_ce, done_conv, is_dac_state;
  logic [2:0] vdac_cal;
  logic [8:0] v_bin;
  logic [4:0]  E, SHIFT;
  logic [15:0] M;
  logic [ADC_BITS-1:0] vsar_bin, vcore_bin, vdac_bin;
  logic [6:0] vdac_thermo;
  logic active_ce;

  // Decimator 
  decimator u_dec (
    .clk(clk),
    .rst(rst),
    .E(E), 
    .M(M), 
    .ce(ce)
  );

  // Frequency Controller
  frequency_controller u_ctr(
    .mode_sel(mode_sel), 
    .E(E), .M(M), 
    .SHIFT(SHIFT), 
    .use_slow_ce(use_slow_ce)
  );

  // LPF Core
  lpf_core #(
    .ADC_BITS(ADC_BITS),
    .WIDTH(WIDTH)
  ) u_core(
    .clk(clk),
    .rst(rst),
    .en(done_conv), // done_conv: indiacated that adc_mode is execute so vdac_bin contains the sampled value
    .bypass(bypass),
    .slope_sel(slope_sel),
    .SHIFT(SHIFT),
    .adc_in(vsar_bin),
    .dac_mode(dac_mode),
    .dac_out(vcore_bin)
  );

  // DAC Calibration
  dac_calib u_calib(
    .sar_bin_in(vdac_bin),
    .v_cal(vdac_cal),
    .v_bin(v_bin),
    .v_th(vdac_thermo)
  );

  // SAR Logic
  sar_logic #(
    .ADC_BITS(ADC_BITS)
  ) u_sar(
    .clk(clk),
    .rst(rst),
    .adc_mode(active_ce),
    .dac_mode(dac_mode),
    .vout_p(vout_p),
    .vout_n(vout_n),
    .en_adc(en_adc),
    .en_dac(en_dac),
    .sample_in(sample_in),
    .sample_out(sample_out),
    .en_comp(en_comp),
    .done_conv(done_conv),
    .vin_dac(vsar_bin),
    .is_dac_state(is_dac_state)
  );

  // DAC Input 
  always_comb begin
    if(is_dac_state) vdac_bin = vcore_bin;
    else vdac_bin = vsar_bin;
  end
  assign vdac = {vdac_thermo, v_bin, vdac_cal};

  // Cascade Decimation
  logic [3:0] slow_cnt;
  logic ce_slow;

  assign ce_slow = ce && (slow_cnt == 4'd9);

  always_ff @(posedge clk or negedge rst) begin
    if (!rst) begin
      slow_cnt <= 0;
    end else if (ce) begin
      if (slow_cnt == 4'd9) begin
        slow_cnt <= 0;
      end else begin
        slow_cnt <= slow_cnt + 1;
      end
    end
  end

  assign active_ce = (use_slow_ce ? ce_slow : ce);


endmodule