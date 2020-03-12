module lowpass #( parameter L = 5 ) (
                input logic clk,
                input logic [15:0] lowpassIn,
                output logic [15:0] lowpassOut);

    logic [L-1:0] data [15:0];

    always_ff @ (posedge clk) begin
        for (int i = 0; i < L-1; i++)
            data[i] <= data[i+1];
        data[L-1] <= lowpassIn;
    end

endmodule