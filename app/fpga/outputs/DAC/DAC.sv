module DAC (input logic clk_12, clk_48, reset_n,
            input logic signed [15:0] leftIn, rightIn,
            output logic DL, DR, LL, LR);

    bit transmit;
    logic [4:0] count;

    always_ff @ (posedge clk_48, negedge reset_n) begin
        if (~reset_n) begin
            transmit <= 0;
        end
        else begin
            transmit <= 1;
        end
    end

    always_ff @ (negedge clk_12, negedge reset_n) begin
        if (~reset_n) begin
            DL <= 0;
            DR <= 0;
            LL <= 1;
            LR <= 1;
            count <= 0;
        end
        else begin
            if (transmit) begin
                DL <= leftIn[15-count];
                DR <= rightIn[15-count];
                count <= count + 1;
            end
            if (count >= 15) begin
                transmit <= 0;
                DL <= 0;
                DR <= 0;
            end
            if (6 < count < 10) begin
                LL <= 1;
                LR <= 1;
            end
            if (count == 16) begin
                LL <= 0;
                LR <= 0;
                count <= 0;
            end
        end
    end

endmodule