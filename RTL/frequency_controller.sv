module frequency_controller (
    input  logic [2:0] mode_sel,
    input  logic [1:0] slope_sel,

    output logic [3:0] SHIFT,
    output logic       use_slow_ce
);

always_comb begin
    use_slow_ce = 1'b0;
    case (mode_sel)
        // Mode 0: fc ? 10 Hz (fs=1kHz, SHIFT=4)
        3'd0: SHIFT=5'd4; 

        // Mode 1: fc ? 1 Hz  (fs=1kHz, SHIFT=7)
        3'd1: SHIFT=5'd7; 

        // Mode 2: fc ? 0.1 Hz (fs=1kHz, SHIFT=11)
        3'd2: SHIFT=5'd11; 
        // Mode 3: fc ? 0.01 Hz (10 mHz) 
        3'd3: begin SHIFT=5'd11; use_slow_ce = 1'b1; end 

        // Mode 4: fc ? 0.001 Hz (1 mHz)
        3'd4: begin SHIFT=5'd14; use_slow_ce = 1'b1; end
        
        default: SHIFT=5'd4; 
    endcase
end
endmodule
