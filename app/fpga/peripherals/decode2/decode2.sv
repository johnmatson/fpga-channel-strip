// John Matson
// A00991330
// ELEX 7660
// Lab 1 - 7-Segment LED Display Decoder

// This file implements a 2-to-4 bit decoder to drive the 7-segment control inputs

module decode2 (input logic [1:0] digit, // 2-bit clock input vector
                output logic [3:0] ct); // 4-bit output vector to drive 7-segment control

    always_comb // specify combinational 
        case (digit) // 2-bit to 4-bit decoder for 7-segment control
            0 : ct = 'b0001;
            1 : ct = 'b0010;
            2 : ct = 'b0100;
            3 : ct = 'b1000;
        endcase

endmodule