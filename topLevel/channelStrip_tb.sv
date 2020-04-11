module channelStrip_tb;

    logic CLOCK_50, clk_48, reset_n;
    logic [2:0] freqSelect, lowpassSelect, highpassSelect;
    logic signed [15:0] stage1, stage2, stage3;

    logic [3:0] num3, num2, num1, num0;
    logic [1:0] digit;
    logic decimal;
    logic [3:0] num;
    logic [7:0] leds;
    logic [3:0] ct;

    always_ff @(posedge clk_48, reset_n) begin
        if (~reset_n)
            digit <= 0;
        else
            digit <= digit + 1'b1;
    end


    sineWaveGen sineWaveGen_0 ( .clk_48, .reset_n,
                                .freq(freqSelect),
                                .outWave(stage1));

    lowpass lowpass_0 (         .clk_48, .reset_n,
                                .filter(lowpassSelect),
                                .lowpassIn(stage1),
                                .lowpassOut(stage2));

    highpass highpass_0 (       .clk_48, .reset_n,
                                .filter(highpassSelect),
                                .highpassIn(stage2),
                                .highpassOut(stage3));

    outputLevel outputLevel_0 ( .clk_48, .reset_n,
                                .inWave(stage1), .outWave(stage3),
                                .num3, .num2, .num1, .num0 );


    displayMux displayMux_0 (   .digit,
                                .num3, .num2, .num1, .num0,
                                .decimal,
                                .num);

    decode2 decode2_0 (         .digit,
                                .ct);

    decode7 decode7_0 (         .num,
                                .decimal,
                                .leds);


    clkDivider #(1041) clkDivider_0 ( .reset_n, .clkIn(CLOCK_50), .clkOut(clk_48) );


    initial begin
        reset_n = 0;
        CLOCK_50 = 0;
        //clk_48 = 0;

        freqSelect = 4;
        lowpassSelect = 1;
        highpassSelect = 3;

        repeat (60) @ (posedge CLOCK_50);
        reset_n = 1;
    end

    initial begin
        #1200000us $stop;
    end

    always
    #20ns CLOCK_50 = ~CLOCK_50;
    //#20.833333us clk_48 = ~clk_48;

endmodule


