module clkDivider #( parameter divide = 5 ) (
                    input logic reset_n,
                    input logic clkIn,
                    output logic clkOut );

    logic [15:0] posCount, negCount;

    always_ff @ ( posedge clkIn, negedge reset_n ) begin
        if (~reset_n) begin
            posCount <= 0;
        end
        else begin
            if (posCount == divide-1)
                posCount <= 0;
            else
                posCount <= posCount + 1;
        end
    end

    always_ff @ ( negedge clkIn, negedge reset_n ) begin
        if (~reset_n) begin
            negCount <= 0;
        end
        else begin
            if (negCount == divide-1)
                negCount <= 0;
            else
                negCount <= negCount + 1;
        end
    end

    assign clkOut = ~((posCount > (divide>>1)) | (negCount > (divide>>1)));

endmodule