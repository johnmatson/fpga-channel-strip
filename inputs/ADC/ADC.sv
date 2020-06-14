module ADC (input logic reset_n,
            input logic serialIn,
            input logic BCLK, WCLK, LRCK,
            output logic signed [15:0] leftOut, rightOut);

    logic [4:0] count;
    logic [15:0] data;

    always_ff @ (posedge WCLK) begin
        count <= 0;
    end

    always_ff @ (posedge BCLK, negedge reset_n) begin
        if (~reset_n) begin
            data <= 0;
            count <= 0;
            leftOut <= 0;
            rightOut <= 0;
        end
        else begin
            count <= count + 1;
            data[15-count] <= serialIn;
        end
    end

    always_ff @ (negedge WCLK) begin
        if (LRCK)
            leftOut <= data;
        else
            rightOut <= data;
    end

endmodule