module sar_logic#(
  parameter ADC_BITS = 12
)(
  input  logic clk, // 10Mhz -> 100ns
  input  logic rst,
  input  logic adc_mode,
  input  logic vout_p,
  input  logic vout_n,
  output logic en_adc,
  output logic en_dac,
  output logic sample_in,
  output logic sample_out,
  output logic en_comp,
  output logic done_conv,
  output logic [ADC_BITS-1:0] vin_dac,
  output logic [1:0] current_state
);

  logic [1:0] hold;
  logic [4:0] cnt;
  logic [3:0] current_bit;
  logic [ADC_BITS-1:0] vsample;

  // DRIVE replaces the old separate IDLE/DAC_STATE pair: the DAC
  // continuously drives VOUT (en_dac=1, vdac_bin=vcore_bin at the
  // wrapper level) at all times except during an active SAR search.
  // This makes the output S/H's hold interval a fixed ~2.1us

  enum logic [1:0] {DRIVE = 2'b00, ADC_STATE = 2'b01} next_state;

  // State Transition Sequential Logic
  always_ff @(posedge clk or negedge rst) begin
    if(!rst) current_state <= DRIVE;
    else current_state <= next_state;
  end

  // Next State Combinational Logic (Only calculates state transitions)
  always_comb begin
    case(current_state)
      DRIVE:     begin
                   if(adc_mode) next_state = ADC_STATE;
                   else next_state = DRIVE;             
                 end
      ADC_STATE: begin
                   if(done_conv) next_state = DRIVE;
                   else next_state = ADC_STATE;
                 end
      default: next_state = DRIVE;
    endcase
  end

  // Control Signals & SAR Algorithm Sequential Logic
  always_ff @(posedge clk or negedge rst) begin
    if(!rst) begin
      current_bit <= ADC_BITS - 1;
      en_adc      <= 0;
      en_dac      <= 0;
      sample_in   <= 1;
      sample_out  <= 0;
      en_comp     <= 0;
      vin_dac     <= {1'b1, {(ADC_BITS-1){1'b0}}}; // Reset to Mid-Scale (1.65V)
      done_conv   <= 0;
      cnt         <= 0;
      hold        <= 0;
      vsample     <= {1'b1, {(ADC_BITS-1){1'b0}}};
    end 
    else begin
      case(current_state)

        DRIVE: begin
          current_bit <= ADC_BITS - 1;
          en_adc      <= 0;
          en_dac      <= 1; // continuously drive VOUT via vcore_bin
          sample_in   <= 1; // input sampling switch in track mode
          en_comp     <= 0;
          done_conv   <= 0;
          vin_dac     <= vsample;
          // Brief settle delay (same ~2-cycle margin as before) after
          // entering DRIVE before the output S/H is flagged to track;
          // cnt then holds (stops incrementing) to avoid needless
          // toggling for the remainder of a potentially long interval.
          if (hold < 2'd2) begin
            hold <= hold + 1;
          end else begin
            sample_out <= 1;
            cnt <= 0;
          end
        end

        ADC_STATE: begin 
          sample_in  <= 0; // Hold input signal
          sample_out <= 0; // Output S/H holds only for this ~2.1us window
          en_adc     <= 1; // Enable vin- path
          en_dac     <= 0; // Disconnect DAC from VOUT during the SAR search
          hold       <= 0;
          if(current_bit == (ADC_BITS-1) && cnt == 0) begin
            vin_dac <= {1'b1, {(ADC_BITS-1){1'b0}}};
          end

          if (cnt == 5'd20) begin
            cnt <= 0;
            en_comp <= 0;
            
            if (current_bit == 0) begin
              if(vin_dac[11:4] >= 8'b10011101) begin
                vsample <= {vin_dac[11:1], 1'b0};
              end else begin
                vsample <= vin_dac;
              end
              done_conv  <= 1;          // SAR Finished
            end else begin
              current_bit <= current_bit - 1;
              // Set the next trial bit to 1
              vin_dac[current_bit - 1] <= 1; 
            end
          end 
          else begin
            cnt <= cnt + 1; // Always increment counter in each cycle

            if (cnt == 5'd17) begin
              en_comp <= 1; // Turn on Comparator
            end 
            else if (cnt == 5'd19) begin
              // Read comparator decision and update DAC trial bit
              if (vout_p && !vout_n) begin
                vin_dac[current_bit] <= 1; // Keep trial bit high
              end 
              else if (vout_n && !vout_p) begin
                vin_dac[current_bit] <= 0; // Drop trial bit to 0
              end
              else begin
                // Invalid/undefined comparator state: retain previous trial bit
                vin_dac[current_bit] <= vin_dac[current_bit];
              end
            end
          end
        end

        default: ;
      endcase
    end
  end

endmodule

