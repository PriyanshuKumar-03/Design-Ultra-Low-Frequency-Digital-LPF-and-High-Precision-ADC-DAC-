module decimator (
    input  logic        clk,
    input  logic        rst,
    input  logic [4:0]  E,
    input  logic [15:0] M,
    output logic        ce
);
    // 10MHz -> 200kHz enable (Ratio = 50)
    logic [5:0] div_cnt;
    logic       ce_200k;
    logic [15:0] cnt_m;
    logic [31:0] cnt_e;
 
    always_ff @(posedge clk or negedge rst) begin
        if (!rst) begin
            div_cnt <= 0;
            ce_200k <= 0;
            cnt_m   <= 0;
            cnt_e   <= 0;
            ce      <= 0;
        end
        else begin
            ce      <= 0;
            ce_200k <= 0;
            if (div_cnt == 6'd49) begin
                div_cnt <= 0;
                ce_200k <= 1;
            end
            else begin
                div_cnt <= div_cnt + 1;
            end
 
            if (ce_200k) begin
                if (cnt_m == M) begin
                    cnt_m <= 0;
                    if (cnt_e == ((32'd1 << E) - 1)) begin
                        cnt_e <= 0;
                        ce    <= 1;
                    end
                    else begin
                        cnt_e <= cnt_e + 1;
                    end
                end
                else begin
                    cnt_m <= cnt_m + 1;
                end
            end
        end
    end
endmodule
