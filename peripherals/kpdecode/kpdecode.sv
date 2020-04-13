// John Matson
// A00991330
// ELEX 7660
// Lab 2 - Matrix Keypad Input

module kpdecode (   input logic [3:0] kpr, kpc, // keypad rows and columns
                    output logic [3:0] buttons); // button value

    always_comb begin
		buttons = 0;

		if (kpr != 15) begin
			case (kpc)

				'b1110 : begin
					case (kpr)
						'b0111 : buttons = 0;
						'b1011 : buttons = 4;
						'b1101 : buttons = 8;
						'b1110 : buttons = 12;
					endcase
				end

				'b1101 : begin
					case (kpr)
						'b0111 : buttons = 1;
						'b1011 : buttons = 5;
						'b1101 : buttons = 9;
						'b1110 : buttons = 13;
					endcase
				end

				'b1011 : begin
					case (kpr)
						'b0111 : buttons = 2;
						'b1011 : buttons = 6;
						'b1101 : buttons = 10;
						'b1110 : buttons = 14;
					endcase
				end

				'b0111 : begin
					case (kpr)
						'b0111 : buttons = 3;
						'b1011 : buttons = 7;
						'b1101 : buttons = 11;
						'b1110 : buttons = 15;
					endcase
				end

				default : buttons = 0;

			endcase
		end
    end

endmodule