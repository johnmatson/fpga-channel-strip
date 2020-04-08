module decodeButton (   input logic [3:0] buttonNum,
                        output logic [15:0] buttons);
    
    always_comb 
        case (buttonNum)
            0 : buttons = 1;
            1 : buttons = 2;
            2 : buttons = 4;
            3 : buttons = 8;
            4 : buttons = 16;
            5 : buttons = 32;
            6 : buttons = 64;
            7 : buttons = 128;
            8 : buttons = 256;
            9 : buttons = 512;
			10 : buttons = 1024;
			11 : buttons = 2048;
			12 : buttons = 4096;
			13 : buttons = 8192;
			14 : buttons = 16384;
			15 : buttons = 32768;
            default : buttons = 0;
        endcase

endmodule