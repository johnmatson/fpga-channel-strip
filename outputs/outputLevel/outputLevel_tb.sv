module outputLevel_tb;

    logic clk_48, reset_n;
    logic signed [15:0] inWave, outWave;
    logic [3:0] num2, num1, num0;
    logic neg;

    outputLevel dut_0 (.*);

    initial begin
        clk_48 = 0;
        reset_n = 0;
        inWave = 0;
        outWave = 0;

        repeat(2) @(posedge clk_48)
        reset_n = 1;

        forever begin
            // 1 kHz wave
            inWave =     0;
            outWave =     0;
            repeat(1) @(posedge clk_48);
            inWave =  4277;
            outWave =  2138;
            repeat(1) @(posedge clk_48);
            inWave =  8481;
            outWave =  4240;
            repeat(1) @(posedge clk_48);
            inWave = 12539;
            outWave =  6270;
            repeat(1) @(posedge clk_48);
            inWave = 16383;
            outWave =  8192;
            repeat(1) @(posedge clk_48);
            inWave = 19947;
            outWave =  9974;
            repeat(1) @(posedge clk_48);
            inWave = 23170;
            outWave = 11585;
            repeat(1) @(posedge clk_48);
            inWave = 25996;
            outWave = 12998;
            repeat(1) @(posedge clk_48);
            inWave = 28377;
            outWave = 14189;
            repeat(1) @(posedge clk_48);
            inWave = 30273;
            outWave = 15136;
            repeat(1) @(posedge clk_48);
            inWave = 31650;
            outWave = 15825;
            repeat(1) @(posedge clk_48);
            inWave = 32487;
            outWave = 16243;
            repeat(1) @(posedge clk_48);
            inWave = 32767;
            outWave = 16384;
            repeat(1) @(posedge clk_48);
            inWave = 32487;
            outWave = 16243;
            repeat(1) @(posedge clk_48);
            inWave = 31650;
            outWave = 15825;
            repeat(1) @(posedge clk_48);
            inWave = 30273;
            outWave = 15136;
            repeat(1) @(posedge clk_48);
            inWave = 28377;
            outWave = 14189;
            repeat(1) @(posedge clk_48);
            inWave = 25996;
            outWave = 12998;
            repeat(1) @(posedge clk_48);
            inWave = 23170;
            outWave = 11585;
            repeat(1) @(posedge clk_48);
            inWave = 19947;
            outWave =  9974;
            repeat(1) @(posedge clk_48);
            inWave = 16384;
            outWave =  8192;
            repeat(1) @(posedge clk_48);
            inWave = 12539;
            outWave =  6270;
            repeat(1) @(posedge clk_48);
            inWave =  8481;
            outWave =  4240;
            repeat(1) @(posedge clk_48);
            inWave =  4277;
            outWave =  2138;
            repeat(1) @(posedge clk_48);
            inWave =     0;
            outWave =     0;
            repeat(1) @(posedge clk_48);
            inWave = -4277;
            outWave = -2138;
            repeat(1) @(posedge clk_48);
            inWave = -8481;
            outWave = -4240;
            repeat(1) @(posedge clk_48);
            inWave = -12539;
            outWave = -6270;
            repeat(1) @(posedge clk_48);
            inWave = -16383;
            outWave = -8192;
            repeat(1) @(posedge clk_48);
            inWave = -19947;
            outWave = -9974;
            repeat(1) @(posedge clk_48);
            inWave = -23170;
            outWave = -11585;
            repeat(1) @(posedge clk_48);
            inWave = -25996;
            outWave = -12998;
            repeat(1) @(posedge clk_48);
            inWave = -28377;
            outWave = -14189;
            repeat(1) @(posedge clk_48);
            inWave = -30273;
            outWave = -15136;
            repeat(1) @(posedge clk_48);
            inWave = -31650;
            outWave = -15825;
            repeat(1) @(posedge clk_48);
            inWave = -32487;
            outWave = -16243;
            repeat(1) @(posedge clk_48);
            inWave = -32767;
            outWave = -16384;
            repeat(1) @(posedge clk_48);
            inWave = -32487;
            outWave = -16243;
            repeat(1) @(posedge clk_48);
            inWave = -31650;
            outWave = -15825;
            repeat(1) @(posedge clk_48);
            inWave = -30273;
            outWave = -15136;
            repeat(1) @(posedge clk_48);
            inWave = -28377;
            outWave = -14189;
            repeat(1) @(posedge clk_48);
            inWave = -25996;
            outWave = -12998;
            repeat(1) @(posedge clk_48);
            inWave = -23170;
            outWave = -11585;
            repeat(1) @(posedge clk_48);
            inWave = -19947;
            outWave = -9974;
            repeat(1) @(posedge clk_48);
            inWave = -16384;
            outWave = -8192;
            repeat(1) @(posedge clk_48);
            inWave = -12539;
            outWave = -6270;
            repeat(1) @(posedge clk_48);
            inWave = -8481;
            outWave = -4240;
            repeat(1) @(posedge clk_48);
            inWave = -4277;
            outWave = -2138;
            repeat(1) @(posedge clk_48);
        end
    end

    initial begin
        #2083333.3us $stop;
    end

    always
    #20.833333us clk_48 = ~clk_48;

endmodule