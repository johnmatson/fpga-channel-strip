module channelStrip_tb;

    logic CLOCK_50, clk_48, reset_n;
    logic [2:0] freqSelect, lowpassSelect, highpassSelect;
    logic phase, mute;
    logic [15:0] gain;
    logic signed [15:0] stage1, stage2, stage3, stage4, stage5, stage6;

    logic [3:0] num3, num2, num1, num0;
    logic [1:0] digit;
    logic decimal;
    logic [3:0] num;
    logic [7:0] leds;
    logic [3:0] ct;
    logic [3:0] buttons, kpc, kpr;

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

    phase phase_0             ( .phase,
                                .phaseIn(stage3),
                                .phaseOut(stage4));

    outputGain outputGain_0   ( .gain,
                                .outputGainIn(stage4),
                                .outputGainOut(stage5));

    mute mute_0               ( .mute,
                                .muteIn(stage5),
                                .muteOut(stage6));

    outputLevel outputLevel_0 ( .clk_48, .reset_n,
                                .inWave(stage1), .outWave(stage6),
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

    colseq colseq_0           ( .clk(clk_48), .reset_n,
                                .kpr,
                                .kpc);
                                
    kpdecode kpdecode_0       ( .kpr, .kpc,
                                .buttons);

    encodeButton encodeButton_0(.buttons,
                                .reset_n, .clk_48,
                                .freqSelect(f),
                                .lowpassSelect(l), .highpassSelect(h));

    clkDivider #(1041) clkDivider_0 ( .reset_n, .clkIn(CLOCK_50), .clkOut(clk_48) );


    initial begin
        reset_n = 0;
        CLOCK_50 = 0;
        //clk_48 = 0;

        freqSelect = 3;
        lowpassSelect = 0;
        highpassSelect = 1;    
        kpr = 'b1111;

        phase = 0;
        mute = 0;
        gain = 'b0001000000000000;

        repeat (60) @ (posedge CLOCK_50);
        reset_n = 1;

        /*for (int i = 16; i >=0; i--)
        begin
            kpr = i;
            repeat(4225) @(posedge CLOCK_50);
        end*/
        
    end

    initial begin
        #1200000us $stop;
    end

    always
    #20ns CLOCK_50 = ~CLOCK_50;
    //#20.833333us clk_48 = ~clk_48;

endmodule


