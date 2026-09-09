module lpf_core #(
    parameter ADC_BITS = 12,
    parameter WIDTH    = 32
)(
    input  logic                clk,
    input  logic                rst,
    input  logic                en,
    input  logic                bypass,
    input  logic [1:0]          slope_sel,
    input  logic [3:0]          SHIFT,
    input  logic [ADC_BITS-1:0] adc_in,
    output logic [ADC_BITS-1:0] dac_out
);

    // ============================================================
    // ADC input centering
    // Convert unsigned ADC code to signed value around midscale.
    //
    // 12-bit example:
    //   ADC = 0    -> -2048
    //   ADC = 2048 -> 0
    //   ADC = 4095 -> +2047
    //
    // Q16 fixed-point representation is used internally.
    // ============================================================

    logic signed [WIDTH-1:0] adc_centered;
    logic signed [WIDTH-1:0] x;

    always_comb begin
        adc_centered = $signed(WIDTH'({1'b0, adc_in})) - $signed(WIDTH'(1) << (ADC_BITS - 1));
        x = adc_centered <<< 16;
    end


    // ============================================================
    // LPF state
    //
    // y[n] = y[n-1] + 2^(-SHIFT) * (x[n] - y[n-1])
    //
    // The multiplication by 2^(-SHIFT) is implemented as
    // an arithmetic right shift, avoiding a multiplier.
    //
    // slope_sel:
    //   00 -> 1st order: y1
    //   01 -> 2nd order: y1 -> y2
    //   10 -> 3rd order: y1 -> y2 -> y3
    // ============================================================

    logic signed [WIDTH-1:0] y1;
    logic signed [WIDTH-1:0] y2;
    logic signed [WIDTH-1:0] y3;

    logic [1:0] slope_sel_q;


    always_ff @(posedge clk or negedge rst) begin

        if (!rst) begin
            y1          <= '0;
            y2          <= '0;
            y3          <= '0;
            slope_sel_q <= 2'b00;
        end
        else begin

            // Store previous slope selection
            slope_sel_q <= slope_sel;

            // ----------------------------------------------------
            // If filter order changes, initialize the additional
            // stages from the first-stage output.
            // ----------------------------------------------------
            if (slope_sel != slope_sel_q) begin
                y2 <= y1;
                y3 <= y1;
            end

            // ----------------------------------------------------
            // Normal filter update
            // ----------------------------------------------------
            else if (en) begin

                // First-order section
                y1 <= y1 + (($signed(x) - $signed(y1)) >>> SHIFT);

                // Second-order section
                if (slope_sel >= 2'b01) begin
                    y2 <= y2 + (($signed(y1) - $signed(y2)) >>> SHIFT);
                end

                // Third-order section
                if (slope_sel == 2'b10) begin
                    y3 <= y3 + (($signed(y2) - $signed(y3)) >>> SHIFT);
                end
            end
        end
    end


    // ============================================================
    // Select output according to filter order
    // ============================================================

    logic signed [WIDTH-1:0] y_sel;

    always_comb begin
        case (slope_sel)
            2'b00:   y_sel = y1;
            2'b01:   y_sel = y2;
            2'b10:   y_sel = y3;
            default: y_sel = y1;
        endcase
    end


    // ============================================================
    // Convert Q16 signed value back to unsigned ADC code
    // ============================================================

    localparam signed [WIDTH-1:0] DAC_MAX = (1 <<< ADC_BITS) - 1;

    localparam signed [WIDTH-1:0] DAC_MIN = 0;

    logic signed [WIDTH-1:0] y_shifted;
    /* verilator lint_off UNUSED */
    logic signed [WIDTH-1:0] y_clamped;
    /* verilator lint_on UNUSED */


    always_comb begin

        // Remove Q16 fractional bits and restore midscale
        y_shifted = (y_sel >>> 16) + (1 <<< (ADC_BITS - 1));

        // Saturation
        if (y_shifted > DAC_MAX)
           y_clamped = DAC_MAX;
        else if (y_shifted < DAC_MIN)
            y_clamped = DAC_MIN;
        else
            y_clamped = y_shifted;
    end


    // ============================================================
    // Output / bypass
    // ============================================================

    always_comb begin
        if (bypass)
            dac_out = adc_in;
        else
            dac_out = y_clamped[ADC_BITS-1:0];
    end

endmodule