module mute (   input logic mute,
                input logic signed [15:0] muteIn,
                output logic signed [15:0] muteOut);

    always_comb begin
        if (mute)
            muteOut = 0;
        else
            muteOut = muteIn;
    end

endmodule