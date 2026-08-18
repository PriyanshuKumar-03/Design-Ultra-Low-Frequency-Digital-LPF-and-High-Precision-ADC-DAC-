module sar_logic#(
  parameter ADC_BITS = 12
)(
  input  logic clk, // 10Mhz -> 100ns
  input  logic rst,
  input  logic adc_mode,
  input  logic dac_mode,
  input  logic vout_p,
  input  logic vout_n,
  output logic en_adc,
  output logic en_dac,
  output logic sample_in,
  output logic sample_out,
  output logic en_comp,
  output logic done_conv,
  output logic [ADC_BITS-1:0] vin_dac,
  output logic is_dac_state
);

  logic done_dac;
  logic [3:0] cnt;
  logic [3:0] current_bit;
  logic [ADC_BITS-1:0] vsample;

  enum logic [1:0] {IDLE = 2'b00, ADC_STATE = 2'b01, DAC_STATE = 2'b10} current_state, next_state;

  // State Transition Sequential Logic
  always_ff @(posedge clk or negedge rst) begin
    if(!rst) current_state <= IDLE;
    else current_state <= next_state;
  end

  // Next State Combinational Logic (Only calculates state transitions)
  always_comb begin
    case(current_state)
      IDLE:      begin
                   if(adc_mode) next_state = ADC_STATE;
                   else if(dac_mode) next_state = DAC_STATE;
                   else next_state = IDLE;             
                 end
      ADC_STATE: begin
                   if(done_conv) next_state = IDLE;
                   else next_state = ADC_STATE;
                 end
      DAC_STATE: begin
                   if(done_dac) begin
                     next_state = IDLE;
                   end
                   else next_state = DAC_STATE;	               
                 end 
      default: next_state = IDLE;
    endcase
  end

  // Control Signals & SAR Algorithm Sequential Logic
  always_ff @(posedge clk or negedge rst) begin
    if(!rst) begin
      current_bit <= 11;
      en_adc      <= 0;
      en_dac      <= 0;
      sample_in   <= 1;
      sample_out  <= 1;
      en_comp     <= 0;
      vin_dac     <= 12'b100000000000; // Reset to Mid-Scale (1.65V)
      done_conv   <= 0;
      cnt         <= 0;
      vsample     <= 0;
    end 
    else begin
      case(current_state)

        IDLE: begin
          current_bit <= 11;
          en_adc      <= 0;
          en_dac      <= 0;
          sample_in   <= 0; // inout sampling switch in track mode when IDLE
          sample_out  <= 1; // output sampling switch in hold mode when IDLE
          en_comp     <= 0;
          done_conv   <= 0;
          done_dac    <= 0;
          vin_dac     <= 12'b100000000000; // Ready for next conversion at mid-scale
          cnt         <= 0;
        end

        ADC_STATE: begin 
          sample_in <= 1; // Hold input signal
          sample_out <= 1;
          en_adc <= 1; // Enable vin- path
          en_dac <= 0;

          if (cnt == 10) begin
            cnt <= 0;
            en_comp <= 0;
            
            if (current_bit == 0) begin
              done_conv  <= 1;          // SAR Finished
            end else begin
              current_bit <= current_bit - 1;
              // Set the next trial bit to 1
              vin_dac[current_bit - 1] <= 1; 
            end
          end 
          else begin
            cnt <= cnt + 1; // Always increment counter in each cycle

            if (cnt == 7) begin
              en_comp <= 1; // Turn on Comparator
              vsample <= vin_dac;
            end 
            else if (cnt == 9) begin
              // Read comparator decision and update DAC trial bit
              if (vout_p && !vout_n) begin
                vin_dac[current_bit] <= 1; // Keep trial bit high
              end 
              else if (vout_n && !vout_p) begin
                vin_dac[current_bit] <= 0; // Drop trial bit to 0
              end
            end
          end
        end

        DAC_STATE: begin
          en_adc    <= 0;
          en_dac    <= 1;
          sample_in <= 0;
          en_comp   <= 0;
          vin_dac   <= vsample;
          if (cnt >= 4'd10) begin
            done_dac   <= 1;
            sample_out <= 1;
            cnt        <= 0;
          end else begin
            cnt <= cnt + 1;
            if (cnt >= 4'd2) begin
              sample_out <= 0;
            end else begin
              sample_out <= 1;
            end
          end
        end
        
        default: ;
      endcase
    end
  end
    
  assign is_dac_state = (current_state == DAC_STATE);

endmodule
