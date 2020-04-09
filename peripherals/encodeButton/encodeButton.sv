module encodeButton (   input logic [15:0] buttons,
                        input logic reset_n,
                        output logic [2:0] freqSelect,
                        output logic [2:0] lowpassSelect, highpassSelect );

    always_ff @ (   posedge buttons[0],
                    posedge buttons[1],
                    posedge buttons[2],
                    posedge buttons[3],
                    posedge buttons[4],
                    posedge buttons[5],
                    posedge buttons[6],
                    posedge buttons[7],
                    posedge buttons[8],
                    posedge buttons[9],
                    posedge buttons[10],
                    posedge buttons[11],
                    posedge buttons[12],
                    posedge buttons[13],
                    posedge buttons[14],
                    posedge buttons[15],
                    negedge reset_n) begin
                    
        if(~reset_n) begin
            freqSelect <= 0;
            lowpassSelect <= 0;
            highpassSelect <= 0;
        end

        else begin
            case (buttons)
                'b0000000000000001 : begin
                    freqSelect <= 0;
                    lowpassSelect <= lowpassSelect;
                    highpassSelect <= highpassSelect;
                end
                'b0000000000000010 : begin
                    freqSelect <= 1;
                    lowpassSelect <= lowpassSelect;
                    highpassSelect <= highpassSelect;
                end
                'b0000000000000100 : begin
                    freqSelect <= 2;
                    lowpassSelect <= lowpassSelect;
                    highpassSelect <= highpassSelect;
                end
                'b0000000000001000 : begin
                    freqSelect <= 3;
                    lowpassSelect <= lowpassSelect;
                    highpassSelect <= highpassSelect;
                end
                'b0000000000010000 : begin
                    freqSelect <= 4;
                    lowpassSelect <= lowpassSelect;
                    highpassSelect <= highpassSelect;
                end
                'b0000000000100000 : begin
                    freqSelect <= 5;
                    lowpassSelect <= lowpassSelect;
                    highpassSelect <= highpassSelect;
                end
                'b0000000001000000 : begin
                    freqSelect <= 6;
                    lowpassSelect <= lowpassSelect;
                    highpassSelect <= highpassSelect;
                end
                'b0000000010000000 : begin
                    freqSelect <= 7;
                    lowpassSelect <= lowpassSelect;
                    highpassSelect <= highpassSelect;
                end
                'b0000000100000000 : begin
                    freqSelect <= freqSelect;
                    lowpassSelect <= 0;
                    highpassSelect <= highpassSelect;
                end
                'b0000001000000000 : begin
                    freqSelect <= freqSelect;
                    lowpassSelect <= 1;
                    highpassSelect <= highpassSelect;
                end
                'b0000010000000000 : begin
                    freqSelect <= freqSelect;
                    lowpassSelect <= 2;
                    highpassSelect <= highpassSelect;
                end
                'b0000100000000000 : begin
                    freqSelect <= freqSelect;
                    lowpassSelect <= 3;
                    highpassSelect <= highpassSelect;
                end
                'b0001000000000000 : begin
                    freqSelect <= freqSelect;
                    lowpassSelect <= lowpassSelect;
                    highpassSelect <= 0;
                end
                'b0010000000000000 : begin
                    freqSelect <= freqSelect;
                    lowpassSelect <= lowpassSelect;
                    highpassSelect <= 1;
                end
                'b0100000000000000 : begin
                    freqSelect <= freqSelect;
                    lowpassSelect <= lowpassSelect;
                    highpassSelect <= 2;
                end
                'b1000000000000000 : begin
                    freqSelect <= freqSelect;
                    lowpassSelect <= lowpassSelect;
                    highpassSelect <= 3;
                end
                default : begin
                    freqSelect <= 0;
                    lowpassSelect <= 0;
                    highpassSelect <= 0;
                end
            endcase
        end
    end

endmodule