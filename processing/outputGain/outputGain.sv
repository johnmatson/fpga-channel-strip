module outputGain ( input logic [15:0] gain,
                    input logic signed [15:0] outputGainIn,
                    output logic signed [15:0] outputGainOut);

    logic signed [31:0] gain_32;
    logic signed [31:0] outputGainIn_32;
    logic signed [31:0] outputGainOut_32;

    always_comb begin
        // 16 to 32 bit conversion with sign preservation
        outputGainIn_32 = { {(16){outputGainIn[15]}}, outputGainIn };
        gain_32 = { {(16){gain[15]}}, gain };

        // apply gain, 'b0001000000000000 = 0 dB
        outputGainOut_32 = (gain_32 * outputGainIn_32) >>> 12;

        // 32 to 16 bit conversion, clip for 16-bit output
        if (outputGainOut_32 > 32767)
            outputGainOut = 'b0111111111111111;
        else if (outputGainOut_32 < -32767)
            outputGainOut = 'b1000000000000000;
        else
            outputGainOut = outputGainOut_32;
    end

endmodule