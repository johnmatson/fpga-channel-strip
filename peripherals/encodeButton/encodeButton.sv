module encodeButton (   input logic [15:0] buttons,
                        input logic reset_n,
                        output logic [2:0] freqSelect,
                        output logic [2:0] lowpassSelect, highpassSelect );

    always_ff @ (   negedge buttons[0],
                    negedge buttons[1],
                    negedge buttons[2],
                    negedge buttons[3],
                    negedge buttons[4],
                    negedge buttons[5],
                    negedge buttons[6],
                    negedge buttons[7],
                    negedge buttons[8],
                    negedge buttons[9],
                    negedge buttons[10],
                    negedge buttons[11],
                    negedge buttons[12],
                    negedge buttons[13],
                    negedge buttons[14],
                    negedge buttons[15],
                    negedge reset_n) begin

        if(~reset_n) begin
            freqSelect <= 5;
            lowpassSelect <= 0;
            highpassSelect <= 0;
        end

        else begin
            case (buttons)
                'b1111111111111110 : begin
                    freqSelect <= 0;
                    lowpassSelect <= lowpassSelect;
                    highpassSelect <= highpassSelect;
                end
                'b1111111111111101 : begin
                    freqSelect <= 1;
                    lowpassSelect <= lowpassSelect;
                    highpassSelect <= highpassSelect;
                end
                'b1111111111111011 : begin
                    freqSelect <= 2;
                    lowpassSelect <= lowpassSelect;
                    highpassSelect <= highpassSelect;
                end
                'b1111111111110111 : begin
                    freqSelect <= 3;
                    lowpassSelect <= lowpassSelect;
                    highpassSelect <= highpassSelect;
                end
                'b1111111111101111 : begin
                    freqSelect <= 4;
                    lowpassSelect <= lowpassSelect;
                    highpassSelect <= highpassSelect;
                end
                'b1111111111011111 : begin
                    freqSelect <= 5;
                    lowpassSelect <= lowpassSelect;
                    highpassSelect <= highpassSelect;
                end
                'b1111111110111111 : begin
                    freqSelect <= 6;
                    lowpassSelect <= lowpassSelect;
                    highpassSelect <= highpassSelect;
                end
                'b1111111101111111 : begin
                    freqSelect <= 7;
                    lowpassSelect <= lowpassSelect;
                    highpassSelect <= highpassSelect;
                end
                'b1111111011111111 : begin
                    freqSelect <= freqSelect;
                    lowpassSelect <= 0;
                    highpassSelect <= highpassSelect;
                end
                'b1111110111111111 : begin
                    freqSelect <= freqSelect;
                    lowpassSelect <= 1;
                    highpassSelect <= highpassSelect;
                end
                'b1111101111111111 : begin
                    freqSelect <= freqSelect;
                    lowpassSelect <= 2;
                    highpassSelect <= highpassSelect;
                end
                'b1111011111111111 : begin
                    freqSelect <= freqSelect;
                    lowpassSelect <= 3;
                    highpassSelect <= highpassSelect;
                end
                'b1110111111111111 : begin
                    freqSelect <= freqSelect;
                    lowpassSelect <= lowpassSelect;
                    highpassSelect <= 0;
                end
                'b1101111111111111 : begin
                    freqSelect <= freqSelect;
                    lowpassSelect <= lowpassSelect;
                    highpassSelect <= 1;
                end
                'b1011111111111111 : begin
                    freqSelect <= freqSelect;
                    lowpassSelect <= lowpassSelect;
                    highpassSelect <= 2;
                end
                'b0111111111111111 : begin
                    freqSelect <= freqSelect;
                    lowpassSelect <= lowpassSelect;
                    highpassSelect <= 3;
                end
                default : begin
                    freqSelect <= 5;
                    lowpassSelect <= 0;
                    highpassSelect <= 0;
                end
            endcase
        end
    end

endmodule