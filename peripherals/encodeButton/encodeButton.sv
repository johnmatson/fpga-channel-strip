module encodeButton (   input logic [15:0] buttons,
                        input logic reset_n,
                        output logic [2:0] freqSelect,
                        output logic [2:0] lowpassSelect, highpassSelect );

    logic [2:0] freqMem;
    logic [2:0] lowpassMem, highpassMem;

    always_comb begin
        if (~reset_n) begin
            freqSelect = 0;
            lowpassSelect = 0;
            highpassSelect = 0;

            freqMem = 0;
            lowpassMem = 0;
            highpassMem = 0;
        end
        else begin

            freqMem = freqMem;
            lowpassMem = lowpassMem;
            highpassMem = highpassMem;

            case (buttons)
                'b0000000000000001 : freqMem = 0;
                'b0000000000000010 : freqMem = 1;
                'b0000000000000100 : freqMem = 2;
                'b0000000000001000 : freqMem = 3;
                'b0000000000010000 : freqMem = 4;
                'b0000000000100000 : freqMem = 5;
                'b0000000001000000 : freqMem = 6;
                'b0000000010000000 : freqMem = 7;
                'b0000000100000000 : lowpassMem = 0;
                'b0000001000000000 : lowpassMem = 1;
                'b0000010000000000 : lowpassMem = 2;
                'b0000100000000000 : lowpassMem = 3;
                'b0001000000000000 : highpassMem = 0;
                'b0010000000000000 : highpassMem = 1;
                'b0100000000000000 : highpassMem = 2;
                'b1000000000000000 : highpassMem = 3;
            endcase

            freqSelect = freqMem;
            lowpassSelect = lowpassMem;
            highpassSelect = highpassMem;
        end
    end

endmodule