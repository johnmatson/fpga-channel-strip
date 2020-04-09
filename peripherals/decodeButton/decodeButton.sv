module decodeButton (   input logic [3:0] buttonNum,
                        output logic [15:0] buttons);
    
    always_comb  begin
        buttons = 0;
        case (buttonNum)
            0   : buttons = 'b0000000000000001;
            1   : buttons = 'b0000000000000010;
            2   : buttons = 'b0000000000000100;
            3   : buttons = 'b0000000000001000;
            4   : buttons = 'b0000000000010000;
            5   : buttons = 'b0000000000100000;
            6   : buttons = 'b0000000001000000;
            7   : buttons = 'b0000000010000000;
            8   : buttons = 'b0000000100000000;
            9   : buttons = 'b0000001000000000;
			10  : buttons = 'b0000010000000000;
			11  : buttons = 'b0000100000000000;
			12  : buttons = 'b0001000000000000;
			13  : buttons = 'b0010000000000000;
			14  : buttons = 'b0100000000000000;
			15  : buttons = 'b1000000000000000;
            default : buttons = 0;
        endcase
    end

endmodule