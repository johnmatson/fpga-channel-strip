module outputLevel #( parameter samples = 12000 ) (
                    input logic clk, reset_n,
                    input logic signed [15:0] inWave, outWave,
                    output logic [3:0] num2, num1, num0,
                    output logic neg );

    logic signed [63:0] level, dB;

    logic signed [63:0] inWave_64, outWave_64;
    logic signed [63:0] inSum, outSum;
    logic signed [63:0] inTemp, outTemp;
    logic [15:0] count;

    // math for deciding output/input
    // gives us 3 digit level in dB resolution 3210

    always_comb begin

        // 16 to 64 bit conversion with sign preservation
        inWave_64 = { {(48){inWave[15]}}, inWave };
        outWave_64 = { {(48){outWave[15]}}, outWave };

        level = dB;

        // convert dB value to be displayed on 4 x seven segment displays
        if (level < 0) begin
            neg = 1;
            level = level*-1;
        end
        else
            neg = 0;

        for (int i2 = 900; i2 >= 100; i2 -= 100) begin
            if (level >= i2) begin
                num2 = i2/100;
                level -= i2;

                for (int i1 = 90; i1 >= 10; i1 -= 10) begin
                    if (level >= i1) begin
                        num1 = i1/10;
                        level -= i1;

                        for (int i0 = 9; i0 >= 1; i0--) begin
                            if (level >= i0) begin
                                num0 = i0;
                            end
                            else
                                num0 = 0;
                        end
                    end
                    else
                        num1 = 0;
                end
            end
            else
                num2 = 0;
        end
    end

    always_ff @( posedge clk, negedge reset_n ) begin
        if (~reset_n) begin
            inSum <= 0;
            outSum <= 0;
            inTemp <= 0;
            outTemp <= 0;
            count <= 0;
        end

        else begin
            inSum <= inSum + (inWave_64**2);
            outSum <= outSum + (outWave_64**2);
            count <= count + 1;

            if (count >= samples) begin
                inTemp <= ((inSum / samples) ** 0.5);
                outTemp <= ((outSum / samples) ** 0.5);
                dB <= 200 * $log10(outTemp / inTemp);
                count <= 0;
            end
        end
    end

endmodule