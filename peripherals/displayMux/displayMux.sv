module displayMux ( input logic [1:0] digit, // 2-bit clock input vector
                    input logic [3:0] num2, num1, num0,
                    input logic neg,
                    output logic decimal,
                    output logic [3:0] num); // 4-bit output vector for diplay values

    always_comb

        if(neg)
            neg = 10;
        else
            neg = 11;

        decimal = 0;
        case (digit) // 2-bit to 4-bit memory for display values
            3 : num = neg;
            2 : num = num2;
            1 : begin
                num = num1;
                decimal = 1;
            end
            0 : num = num0;
        endcase

endmodule