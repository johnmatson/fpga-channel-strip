module phase (  input logic phase,
                input logic signed [15:0] phaseIn,
                output logic signed [15:0 phaseOut] );

    always_comb begin
        if (phase)
            phaseOut = phaseIn * -1;
        else
            phaseOut = phaseIn;
    end

endmodule