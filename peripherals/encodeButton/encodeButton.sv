module encodeButton (   input logic [3:0] buttons,
                        input logic clk_48, reset_n,
                        output logic mute,
                        output logic [2:0] freqSelect,
                        output logic [2:0] lowpassSelect, highpassSelect );

    always_ff @ (posedge clk_48, negedge reset_n) begin

        if(~reset_n) begin
            freqSelect <= 4;
            lowpassSelect <= 1;
            highpassSelect <= 2;
        end

        else begin
            case (buttons)
                0 : begin
                    freqSelect <= freqSelect;
                    lowpassSelect <= lowpassSelect;
                    highpassSelect <= highpassSelect;
                    mute <= mute;
                end
                1 : begin
                    freqSelect <= 1;
                    lowpassSelect <= lowpassSelect;
                    highpassSelect <= highpassSelect;
                    mute <= mute;
                end
                2 : begin
                    freqSelect <= 2;
                    lowpassSelect <= lowpassSelect;
                    highpassSelect <= highpassSelect;
                    mute <= mute;
                end
                3 : begin
                    freqSelect <= 3;
                    lowpassSelect <= lowpassSelect;
                    highpassSelect <= highpassSelect;
                    mute <= mute;
                end
                4 : begin
                    freqSelect <= 1;
                    lowpassSelect <= lowpassSelect;
                    highpassSelect <= highpassSelect;
                    mute <= mute;
                end
                5 : begin
                    freqSelect <= 5;
                    lowpassSelect <= lowpassSelect;
                    highpassSelect <= highpassSelect;
                    mute <= mute;
                end
                6 : begin
                    freqSelect <= 6;
                    lowpassSelect <= lowpassSelect;
                    highpassSelect <= highpassSelect;
                    mute <= mute;
                end
                7 : begin
                    freqSelect <= freqSelect;
                    lowpassSelect <= lowpassSelect;
                    highpassSelect <= highpassSelect;
                    mute <= ~mute;
                end
                8 : begin
                    freqSelect <= freqSelect;
                    lowpassSelect <= 0;
                    highpassSelect <= highpassSelect;
                    mute <= mute;
                end
                9 : begin
                    freqSelect <= freqSelect;
                    lowpassSelect <= 1;
                    highpassSelect <= highpassSelect;
                    mute <= mute;
                end
                10 : begin
                    freqSelect <= freqSelect;
                    lowpassSelect <= 2;
                    highpassSelect <= highpassSelect;
                    mute <= mute;
                end
                11 : begin
                    freqSelect <= freqSelect;
                    lowpassSelect <= 3;
                    highpassSelect <= highpassSelect;
                    mute <= mute;
                end
                12 : begin
                    freqSelect <= freqSelect;
                    lowpassSelect <= lowpassSelect;
                    highpassSelect <= 0;
                    mute <= mute;
                end
                13 : begin
                    freqSelect <= freqSelect;
                    lowpassSelect <= lowpassSelect;
                    highpassSelect <= 1;
                    mute <= mute;
                end
                14 : begin
                    freqSelect <= freqSelect;
                    lowpassSelect <= lowpassSelect;
                    highpassSelect <= 2;
                    mute <= mute;
                end
                15 : begin
                    freqSelect <= freqSelect;
                    lowpassSelect <= lowpassSelect;
                    highpassSelect <= 3;
                    mute <= mute;
                end
                default : begin
                    freqSelect <= freqSelect;
                    lowpassSelect <= lowpassSelect;
                    highpassSelect <= highpassSelect;
                    mute <= mute;
                end
            endcase
        end
    end

endmodule