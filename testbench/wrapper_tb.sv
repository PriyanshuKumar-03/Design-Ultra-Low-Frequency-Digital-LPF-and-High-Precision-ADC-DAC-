`timescale 1ns/1ps

module wrapper_tb;

  parameter period = 100; // 100ns
  parameter ADC_BITS = 12;
  parameter WIDTH = 32;
  
  logic clk, rst, bypass, vout_p, vout_n;
  logic en_adc, en_dac, en_comp, sample;
  logic [2:0] mode_sel;
  logic [1:0] slope_sel;
  logic [ADC_BITS+3:0] vdac;

  wrapper DUT(
    .clk(clk),
    .rst(rst),
    .bypass(bypass),
    .vout_p(vout_p),
    .vout_n(vout_n),
    .mode_sel(mode_sel),
    .slope_sel(slope_sel),
    .en_adc(en_adc),
    .en_dac(en_dac),
    .en_comp(en_comp),
    .sample(sample),
    .vdac(vdac)
  );

  initial clk = 0;
  always #(period/2) clk = ~clk;

  initial begin
    rst = 0;
    #period rst = 1;
    vout_p = 1; vout_n = 0;
    bypass = 0;
    mode_sel = 0;
    slope_sel = 0; 
  end

endmodule
