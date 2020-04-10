module outputLevel #( parameter samples = 12000 ) (
                    input logic clk_48, reset_n,
                    input logic signed [15:0] inWave, outWave,
                    output logic [3:0] num3, num2, num1, num0 );

    logic signed [63:0] level, dB;

    logic signed [63:0] inWave_64, outWave_64;
    logic signed [63:0] /*inSum, outSum,*/ inMax, outMax;
    logic [15:0] count;

    // math for deciding output/input
    // gives us 3 digit level in dB resolution 3210

    always_comb begin
        num3 = 0;
        num2 = 0;
        num1 = 0;
        num0 = 0;

        // 16 to 64 bit conversion with sign preservation
        inWave_64 = { {(48){inWave[15]}}, inWave };
        outWave_64 = { {(48){outWave[15]}}, outWave };

        level = dB;

        // convert dB value to be displayed on 4 x seven segment displays
        if (level < 1000)
            num3 = 0;
        else begin
            for (int i3 = 9000; i3 >= 1000; i3 -= 1000) begin
                if (level >= i3) begin
                    num3 = i3/1000;
                    level -= i3;
                end
            end
        end

        if (level < 100)
            num2 = 0;
        else begin
            for (int i2 = 900; i2 >= 100; i2 -= 100) begin
                if (level >= i2) begin
                    num2 = i2/100;
                    level -= i2;
                end
            end
        end

        if (level < 10)
            num1 = 0;
        else begin
            for (int i1 = 90; i1 >= 10; i1 -= 10) begin
                if (level >= i1) begin
                    num1 = i1/10;
                    level -= i1;
                end
            end
        end

        if (level < 1)
            num0 = 0;
        else begin
            for (int i0 = 9; i0 >= 1; i0--) begin
                if (level == i0) begin
                    num0 = i0;
                end      
            end
        end
    end

    always_ff @( posedge clk_48, negedge reset_n ) begin
        if (~reset_n) begin
           /* inSum <= 0;
            outSum <= 0;*/
            count <= 0;
            dB <= 0;

            inMax <= 0;
            outMax <= 0;
        end

        else begin
            if (inWave_64 > inMax)
                inMax <= inWave_64;
            
            if (outWave_64 > outMax)
                outMax <= outWave_64;

            /*inSum <= inSum + (inWave_64**2);
            outSum <= outSum + (outWave_64**2);*/
            count <= count + 1;

            if (count >= samples) begin
                //dB <= 200 * (($clog2($sqrt(outSum / samples)) / $clog2(10)) - ($clog2($sqrt(inSum / samples)) / $clog2(10)));
                //dB <= 200 * (($log10($sqrt(outSum / samples))) - ($log10($sqrt(inSum / samples))));      
                //dB <= (($clog2(outMax) - $clog2(inMax)) * 200000 / (3322)); //this is the (as)good stuff
                
                dB <= 1000*outMax/inMax;
                count <= 0;
                inMax <= 0;
                outMax <= 0;
            end
        end
    end

endmodule