module channelStrip (   output logic [3:0] kpc,  // column select, active-low
                        (* altera_attribute = "-name WEAK_PULL_UP_RESISTOR ON" *)
                        input logic  [3:0] kpr,  // rows, active-low w/ pull-ups
                        output logic [7:0] leds,  // 7-seg LED cathodes
                        output logic [3:0] ct, // digit enable
                        input logic  reset_n, CLOCK_50 ) ;

    logic clk_144, clk_48;

    logic [2:0] freqSelect;
    logic signed [15:0] stage1, stage2, stage3;
    logic [2:0] lowpassSelect, highpassSelect;

    logic [1:0] digit;
    logic [3:0] num2, num1, num0;
    logic neg;
    logic decimal;
    logic [3:0] num;

    logic [3:0] buttonNum;
    logic kphit;

    sineWaveGen sineWaveGen_0 ( .clk_48, .reset_n,
                                .freq(freqSelect),
                                .outWave(stage1));

    lowpass lowpass_0 (         .clk_144, .reset_n,
                                .filter(lowpassSelect),
                                .lowpassIn(stage1),
                                .lowpassOut(stage2));

    highpass highpass_0 (       .clk_144, .reset_n,
                                .filter(highpassSelect),
                                .highpassIn(stage2),
                                .highpassOut(stage3));

    outputLevel outputLevel_0 ( .clk_48, .reset_n,
                                .inWave(stage1), .outWave(stage3),
                                .num2, .num1, .num0,
                                .neg);


    displayMux displayMux_0 (   .digit,
                                .num2, .num1, .num0,
                                .neg,
                                .decimal,
                                .num);

    decode2 decode2_0 (         .digit,
                                .digit,
                                .ct);

    decode7 decode7_0 (         .num,
                                .decimal,
                                .leds);


    colseq colseq_0 (           .clk(.clk_48), .reset_n,
                                .kpr,
                                .kpc);
                                
    kpdecode kpdecode_0 (       .kpr, .kpc,
                                .buttonNum,
                                .kphit);
    
    decodeButton decodeButton_0(.buttonNum,
                                .buttons);

endmodule