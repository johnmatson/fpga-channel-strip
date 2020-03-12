module lowpass #( parameter L = 5 ) (
                input logic clk,
                input logic [15:0] lowpassIn,
                output logic [15:0] out4,out3,out2,out1,out0, // for testing only
                output logic [15:0] lowpassOut);

    logic [15:0] data [L-1:0];

    always_ff @ (posedge clk) begin
        for (int i = 0; i < L-1; i++)
            data[i] <= data[i+1];
        data[L-1] <= lowpassIn;

        out4<=data[4];
        out3<=data[3];
        out2<=data[2];
        out1<=data[1];
        out0<=data[0];
    end

endmodule