module encodeButton (   input logic [3:0] buttons,
                        input logic reset_n, clk_48,
                        output logic [2:0] freqSelect,
                        output logic [2:0] lowpassSelect, highpassSelect );

    always_ff @ (posedge clk_48, negedge reset_n) begin

        if(~reset_n) begin
            freqSelect <= 4;
            lowpassSelect <= 1;
            highpassSelect <= 3;
        end

        else begin
            case (buttons)
                0 : begin
                    freqSelect <= 0;
                    lowpassSelect <= lowpassSelect;
                    highpassSelect <= highpassSelect;
                end
                1 : begin
                    freqSelect <= 1;
                    lowpassSelect <= lowpassSelect;
                    highpassSelect <= highpassSelect;
                end
                2 : begin
                    freqSelect <= 2;
                    lowpassSelect <= lowpassSelect;
                    highpassSelect <= highpassSelect;
                end
                3 : begin
                    freqSelect <= 3;
                    lowpassSelect <= lowpassSelect;
                    highpassSelect <= highpassSelect;
                end
                4 : begin
                    freqSelect <= 4;
                    lowpassSelect <= lowpassSelect;
                    highpassSelect <= highpassSelect;
                end
                5 : begin
                    freqSelect <= 5;
                    lowpassSelect <= lowpassSelect;
                    highpassSelect <= highpassSelect;
                end
                6 : begin
                    freqSelect <= 6;
                    lowpassSelect <= lowpassSelect;
                    highpassSelect <= highpassSelect;
                end
                7 : begin
                    freqSelect <= 7;
                    lowpassSelect <= lowpassSelect;
                    highpassSelect <= highpassSelect;
                end
                8 : begin
                    freqSelect <= freqSelect;
                    lowpassSelect <= 0;
                    highpassSelect <= highpassSelect;
                end
                9 : begin
                    freqSelect <= freqSelect;
                    lowpassSelect <= 1;
                    highpassSelect <= highpassSelect;
                end
                10 : begin
                    freqSelect <= freqSelect;
                    lowpassSelect <= 2;
                    highpassSelect <= highpassSelect;
                end
                11 : begin
                    freqSelect <= freqSelect;
                    lowpassSelect <= 3;
                    highpassSelect <= highpassSelect;
                end
                12 : begin
                    freqSelect <= freqSelect;
                    lowpassSelect <= lowpassSelect;
                    highpassSelect <= 0;
                end
                13 : begin
                    freqSelect <= freqSelect;
                    lowpassSelect <= lowpassSelect;
                    highpassSelect <= 1;
                end
                14 : begin
                    freqSelect <= freqSelect;
                    lowpassSelect <= lowpassSelect;
                    highpassSelect <= 2;
                end
                15 : begin
                    freqSelect <= freqSelect;
                    lowpassSelect <= lowpassSelect;
                    highpassSelect <= 3;
                end
                default : begin
                    freqSelect <= freqSelect;
                    lowpassSelect <= lowpassSelect;
                    highpassSelect <= highpassSelect;
                end
            endcase
        end
    end

endmodule