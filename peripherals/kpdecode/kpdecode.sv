// John Matson
// A00991330
// ELEX 7660
// Lab 2 - Matrix Keypad Input

module kpdecode (   input logic [3:0] kpr, kpc, // keypad rows and columns
                    output logic [3:0] buttonNum/*, // button value
					output logic kphit*/); // keypad hit signal for 7-segment LSD control

    always_comb begin
		//kphit = 0;
		buttonNum = 0;

		if (kpr != 15) begin
		//kphit = 1;
			case (kpc)

				'b0111 : begin
					//kphit = 1;
					case (kpr)
						'b0111 : buttonNum = 1;
						'b1011 : buttonNum = 4;
						'b1101 : buttonNum = 7;
						'b1110 : buttonNum = 14;
					endcase
				end

				'b1011 : begin
					//kphit = 1;
					case (kpr)
						'b0111 : buttonNum = 2;
						'b1011 : buttonNum = 5;
						'b1101 : buttonNum = 8;
						'b1110 : buttonNum = 0;
					endcase
				end

				'b1101 : begin
					//kphit = 1;
					case (kpr)
						'b0111 : buttonNum = 3;
						'b1011 : buttonNum = 6;
						'b1101 : buttonNum = 9;
						'b1110 : buttonNum = 15;
					endcase
				end

				'b1110 : begin
					//kphit = 1;
					case (kpr)
						'b0111 : buttonNum = 10;
						'b1011 : buttonNum = 11;
						'b1101 : buttonNum = 12;
						'b1110 : buttonNum = 13;
					endcase
				end

				//default : kphit = 0;

			endcase
		end
    end

endmodule