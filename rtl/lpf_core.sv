module lpf_core#(
  parameter ADC_BITS = 12,
  parameter WIDTH    = 32
)(
  input logic clk,
  input logic rst,
  input logic en,
  input logic bypass,
  input  logic [1:0] slope_sel,
  input logic [4:0]  SHIFT,
  input  logic [ADC_BITS-1:0] adc_in,
  output logic dac_mode,
  output logic [ADC_BITS-1:0] dac_out
);


  // Normalization
  logic signed [WIDTH-1:0] x;
  always_comb begin
  /* verilator lint_off WIDTH */
    x = (adc_in - (ADC_BITS'(1) << (ADC_BITS-1))) <<< 16;
  /* verilator lint_on WIDTH */
  end

  // LPF stages
  logic signed [WIDTH-1:0] y1, y2, y3;
  logic [1:0] slope_sel_q;

  always_ff @(posedge clk or negedge rst) begin
    if(!rst) begin
      y1 <= 0;
      y2 <= 0;
      y3 <= 0;
      slope_sel_q <= 0;
      dac_mode <= 0;
    end 
    else begin
      slope_sel_q <= slope_sel;
      dac_mode <= 0;
      // Snap inactive stages to active levels when switching
      if(slope_sel != slope_sel_q) begin
        if(slope_sel == 2'b01) y2 <= y1; 
        if(slope_sel == 2'b10) begin y2 <= y1; y3 <= y1; end
      end 
      else if(en) begin
        dac_mode <= 1;
        // Stage 1: Always runs because it's the minimum requirement
        y1 <= y1 + ($signed(x - y1) >>> SHIFT);

        // Stage 2: Only runs if slope is -40dB or -60dB
        if (slope_sel >= 2'b01) begin
          y2 <= y2 + ($signed(y1 - y2) >>> SHIFT);
        end

        // Stage 3: Only runs if slope is -60dB
        if (slope_sel == 2'b10) begin
          y3 <= y3 + ($signed(y2 - y3) >>> SHIFT);
        end
      end
    end
  end

  // Selection & Output
  logic signed [WIDTH-1:0] y_sel, y_final;
  always_comb begin
    case (slope_sel)
      2'b00: y_sel = y1;
      2'b01: y_sel = y2;
      2'b10: y_sel = y3;
      default: y_sel = y1;
    endcase
    y_final = (ADC_BITS)'((y_sel >>> 16) + (1 << (ADC_BITS-1)));
    dac_out = bypass ? adc_in : y_final;
  end

endmodule