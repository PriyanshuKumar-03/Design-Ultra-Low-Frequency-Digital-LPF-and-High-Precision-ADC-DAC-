module decimator (
    input  logic        clk,
    input  logic        rst,
    output logic        ce
);
    // 10MHz -> 200kHz enable (Ratio = 50)
    logic [5:0]  div_cnt;
    logic        ce_200k;
    logic [7:0]  cnt_m;
    logic        cnt_e;

    assign ce_200k = (div_cnt == 6'd49);

    always_ff @(posedge clk or negedge rst) begin
        if (!rst) begin
            div_cnt <= 0;
            cnt_m   <= 0;
            cnt_e   <= 0;
            ce      <= 0;
        end
        else begin
            ce <= 0;

            if (div_cnt == 6'd49) begin
                div_cnt <= 0;
            end
            else begin
                div_cnt <= div_cnt + 1;
            end
   
            if (ce_200k) begin
                if (cnt_m >= 8'd99) begin
                    cnt_m <= 0;
                    if (cnt_e) begin
                        cnt_e <= 0;
                        ce    <= 1;
                    end
                    else begin
                        cnt_e <= 1;
                    end
                end
                else begin
                    cnt_m <= cnt_m + 1;
                end
            end
        end
    end
endmodule