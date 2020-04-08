// John Matson
// A00991330
// ELEX 7660
// Lab 2 - Matrix Keypad Input

module colseq ( input logic clk, reset_n, // clock and reset
				input logic [3:0] kpr, // keypad rows
                output logic [3:0] kpc); // keypad columns

    logic [1:0] state;

    always_ff @ (posedge clk, negedge reset_n) begin
        if (~reset_n)
            state <= 0;
        else
            state++;
    end

    always_comb begin
        case (state)

            0 : begin
                kpc = 'b0111;
            end

            1 : begin
                kpc = 'b1011;
            end

            2 : begin
                kpc = 'b1101;
            end

            3 : begin
                kpc = 'b1110;
            end

        endcase
    end

endmodule