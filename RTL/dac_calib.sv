module dac_calib (
    input  logic [11:0] sar_bin_in, // 12-bit binary input from SAR logic
    output logic [2:0]  v_cal,      // V_CAL0 TO V_CAL2 (3 calibration bits)
    output logic [8:0]  v_bin,      // V_BIN0 to V_BIN8 (9 binary bits)
    output logic [6:0]  v_th        // V_TH0 to V_TH6 (7 thermometer bits)
);

    // Thermometer decoder logic block
    always_comb begin
      unique case (sar_bin_in[11:9])
        3'd0: v_th = 7'b0000000;
        3'd1: v_th = 7'b0000001;
        3'd2: v_th = 7'b0000011;
        3'd3: v_th = 7'b0000111;
        3'd4: v_th = 7'b0001111;
        3'd5: v_th = 7'b0011111;
        3'd6: v_th = 7'b0111111;
        3'd7: v_th = 7'b1111111;
        default: v_th = 7'b0000000;
      endcase
    end

    // Combinatorial calibration decoding based on input thresholds
    always_comb begin
        if (sar_bin_in < 12'd512) begin
            v_cal = 3'b001; // vcal = 100
        end else if (sar_bin_in < 12'd1024) begin
            v_cal = 3'b010; // vcal = 010
        end else if (sar_bin_in < 12'd1536) begin
            v_cal = 3'b011; // vcal = 110
        end else if (sar_bin_in < 12'd2048) begin
            v_cal = 3'b100; // vcal = 001
        end else if (sar_bin_in < 12'd3072) begin
            v_cal = 3'b101; // vcal = 101
        end else begin // <= 4095
            v_cal = 3'b111; // vcal = 111
        end
    end

    // Continuous assignments for outputs
    assign v_bin  = sar_bin_in[8:0];

endmodule

