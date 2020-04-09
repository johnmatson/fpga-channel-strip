module displayMux ( input logic [1:0] digit, // 2-bit clock input vector
                    input logic [3:0] num3, num2, num1, num0,
                    output logic decimal,
                    output logic [3:0] num); // 4-bit output vector for diplay values

    always_comb begin

        decimal = 0;
        case (digit) // 2-bit to 4-bit memory for display values
            3 : begin
                num = num3;
                decimal = 1;
            end
            2 : num = num2;
            1 : num = num1;
            0 : num = num0;
        endcase

    end

endmodule