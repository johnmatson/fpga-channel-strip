module outputGain #( parameter N = 16 )( 
                    input logic [N-1:0] gain,
                    input logic signed [15:0] outputGainIn,
                    output logic signed [15:0] outputGainOut);

    always_comb begin
        outputGainOut = outputGainIN * gain;
    end

endmodule