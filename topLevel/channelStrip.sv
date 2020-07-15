module channelStrip (   output logic [3:0] kpc,  // column select, active-low
                        (* altera_attribute = "-name WEAK_PULL_UP_RESISTOR ON" *)
                        input logic  [3:0] kpr,  // rows, active-low w/ pull-ups
                        output logic [7:0] leds,  // 7-seg LED cathodes
                        output logic [3:0] ct, // digit enable
                        input logic SCLK, CS, MOSI, // SPI inputs
                        output logic MISO, // SPI output
                        input logic  reset_n, CLOCK_50 ) ;

    logic clk_48;

    logic [2:0] freqSelect, freqSelect1;
    logic [2:0] lowpassSelect, highpassSelect;
    logic phase, mute;
    logic [15:0] gain;
    logic signed [15:0] stage1_l, stage2_l, stage3_l, stage4_l, stage5_l, stage6_l;
    logic signed [15:0] stage1_r, stage2_r, stage3_r, stage4_r, stage5_r, stage6_r;

    logic [1:0] digit;
    logic [3:0] num3, num2, num1, num0;
    logic decimal;
    logic [3:0] num;

    logic [3:0] buttons;//, buttons0;
    //logic [3:0] kpr;


    /*  Frequency:         Highpass:          Lowpass:
    0 - None               0 - All            0 - All
    1 - 100 Hz             1 - 100 Hz         1 - 1 kHz
    2 - 250 Hz             2 - 250 Hz         2 - 2.5 kHz
    3 - 500 Hz             3 - 500 Hz         3 - 5 kHz
    4 - 1 kHz              4 - 1 kHz          4 - 10 kHz
    5 - 2.5 kHz
    6 - 5 kHz
    7 - 10 kHz*/


    assign freqSelect = 4;
    //assign lowpassSelect = 1;
    //assign highpassSelect = 3;

    assign phase = 0;
    //assign mute = 0;
    assign gain = 'b0001000000000000;
/*
    logic [4:0] count;
    always_ff @ (posedge clk_48, negedge reset_n) begin
      if (~reset_n)
        count <= 0;
      else
        count <= count + 1;
    end

    always_comb begin
      if (count<7) begin
        //buttons = 15;
        //kpc = 'b1110;
        kpr = 'b1110;
      end
      else if (count>20) begin
        //buttons = 9;
        //kpc = 'b1101;
        kpr = 'b1011;
      end
      else begin
        //buttons = 4;
        //kpc = 'b1011;
        kpr = 'b0111;
      end
    end*/

    //assign buttons = 11;

    always_ff @(posedge clk_48) 
        digit <= digit + 1'b1 ;


    sineWaveGen sineWaveGen_l ( .clk_48, .reset_n,
                                .freq(freqSelect),
                                .outWave(stage1_l));
    sineWaveGen sineWaveGen_r ( .clk_48, .reset_n,
                                .freq(freqSelect),
                                .outWave(stage1_r));

    lowpass lowpass_l         ( .clk_48, .reset_n,
                                .filter(lowpassSelect),
                                .lowpassIn(stage1_l),
                                .lowpassOut(stage2_l));
    lowpass lowpass_r         ( .clk_48, .reset_n,
                                .filter(lowpassSelect),
                                .lowpassIn(stage1_r),
                                .lowpassOut(stage2_r));

    highpass highpass_l       ( .clk_48, .reset_n,
                                .filter(highpassSelect),
                                .highpassIn(stage2_l),
                                .highpassOut(stage3_r));
    highpass highpass_r       ( .clk_48, .reset_n,
                                .filter(highpassSelect),
                                .highpassIn(stage2_r),
                                .highpassOut(stage3_r));

    phase phase_l             ( .phase,
                                .phaseIn(stage3_l),
                                .phaseOut(stage4_l));
    phase phase_r             ( .phase,
                                .phaseIn(stage3_r),
                                .phaseOut(stage4_r));

    outputGain outputGain_l   ( .gain,
                                .outputGainIn(stage4_l),
                                .outputGainOut(stage5_l));
    outputGain outputGain_r   ( .gain,
                                .outputGainIn(stage4_r),
                                .outputGainOut(stage5_r));

    mute mute_l               ( .mute,
                                .muteIn(stage5_l),
                                .muteOut(stage6_l));
    mute mute_r               ( .mute,
                                .muteIn(stage5_r),
                                .muteOut(stage6_r));

    outputLevel outputLevel_0 ( .clk_48, .reset_n,
                                .inWave(stage1_l), .outWave(stage6_l),
                                .num3, .num2, .num1, .num0 );

    SPI SPI_0                 ( .SCLK, .CS, .MOSI, .MISO,
                                .clk_48, .reset_n,
                                .left(stage1_l), .right(stage1_r));


    displayMux displayMux_0   ( .digit,
                                .num3, .num2, .num1, .num0,
                                .decimal,
                                .num);

    decode2 decode2_0         ( .digit,
                                .ct);

    decode7 decode7_0         ( .num,
                                .decimal,
                                .leds);


    colseq colseq_0           ( .clk(clk_48), .reset_n,
                                .kpr,
                                .kpc);
                                
    kpdecode kpdecode_0       ( .kpr, .kpc,
                                .buttons);

    encodeButton encodeButton_0(.buttons,
                                .clk_48, .reset_n,
                                .mute,
                                .freqSelect(freqSelect1),
                                .lowpassSelect, .highpassSelect);


    pll pll_0 ( .inclk0(CLOCK_50), .c0(clk_48) );

    //clkDivider #(1041) clkDivider_0 ( .reset_n, .clkIn(CLOCK_50), .clkOut(clk_48) );

endmodule



// megafunction wizard: %ALTPLL%
// ...
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
// ...

module pll ( inclk0, c0);

        input     inclk0;
        output    c0;

        wire [0:0] sub_wire2 = 1'h0;
        wire [4:0] sub_wire3;
        wire  sub_wire0 = inclk0;
        wire [1:0] sub_wire1 = {sub_wire2, sub_wire0};
        wire [0:0] sub_wire4 = sub_wire3[0:0];
        wire  c0 = sub_wire4;

        altpll altpll_component ( .inclk (sub_wire1), .clk
          (sub_wire3), .activeclock (), .areset (1'b0), .clkbad
          (), .clkena ({6{1'b1}}), .clkloss (), .clkswitch
          (1'b0), .configupdate (1'b0), .enable0 (), .enable1 (),
          .extclk (), .extclkena ({4{1'b1}}), .fbin (1'b1),
          .fbmimicbidir (), .fbout (), .fref (), .icdrclk (),
          .locked (), .pfdena (1'b1), .phasecounterselect
          ({4{1'b1}}), .phasedone (), .phasestep (1'b1),
          .phaseupdown (1'b1), .pllena (1'b1), .scanaclr (1'b0),
          .scanclk (1'b0), .scanclkena (1'b1), .scandata (1'b0),
          .scandataout (), .scandone (), .scanread (1'b0),
          .scanwrite (1'b0), .sclkout0 (), .sclkout1 (),
          .vcooverrange (), .vcounderrange ());

        defparam
                altpll_component.bandwidth_type = "AUTO",
                altpll_component.clk0_divide_by = 1041,
                altpll_component.clk0_duty_cycle = 50,
                altpll_component.clk0_multiply_by = 1,
                altpll_component.clk0_phase_shift = "0",
                altpll_component.compensate_clock = "CLK0",
                altpll_component.inclk0_input_frequency = 20000,
                altpll_component.intended_device_family = "Cyclone IV E",
                altpll_component.lpm_hint = "CBX_MODULE_PREFIX=lab1clk",
                altpll_component.lpm_type = "altpll",
                altpll_component.operation_mode = "NORMAL",
                altpll_component.pll_type = "AUTO",
                altpll_component.port_activeclock = "PORT_UNUSED",
                altpll_component.port_areset = "PORT_UNUSED",
                altpll_component.port_clkbad0 = "PORT_UNUSED",
                altpll_component.port_clkbad1 = "PORT_UNUSED",
                altpll_component.port_clkloss = "PORT_UNUSED",
                altpll_component.port_clkswitch = "PORT_UNUSED",
                altpll_component.port_configupdate = "PORT_UNUSED",
                altpll_component.port_fbin = "PORT_UNUSED",
                altpll_component.port_inclk0 = "PORT_USED",
                altpll_component.port_inclk1 = "PORT_UNUSED",
                altpll_component.port_locked = "PORT_UNUSED",
                altpll_component.port_pfdena = "PORT_UNUSED",
                altpll_component.port_phasecounterselect = "PORT_UNUSED",
                altpll_component.port_phasedone = "PORT_UNUSED",
                altpll_component.port_phasestep = "PORT_UNUSED",
                altpll_component.port_phaseupdown = "PORT_UNUSED",
                altpll_component.port_pllena = "PORT_UNUSED",
                altpll_component.port_scanaclr = "PORT_UNUSED",
                altpll_component.port_scanclk = "PORT_UNUSED",
                altpll_component.port_scanclkena = "PORT_UNUSED",
                altpll_component.port_scandata = "PORT_UNUSED",
                altpll_component.port_scandataout = "PORT_UNUSED",
                altpll_component.port_scandone = "PORT_UNUSED",
                altpll_component.port_scanread = "PORT_UNUSED",
                altpll_component.port_scanwrite = "PORT_UNUSED",
                altpll_component.port_clk0 = "PORT_USED",
                altpll_component.port_clk1 = "PORT_UNUSED",
                altpll_component.port_clk2 = "PORT_UNUSED",
                altpll_component.port_clk3 = "PORT_UNUSED",
                altpll_component.port_clk4 = "PORT_UNUSED",
                altpll_component.port_clk5 = "PORT_UNUSED",
                altpll_component.port_clkena0 = "PORT_UNUSED",
                altpll_component.port_clkena1 = "PORT_UNUSED",
                altpll_component.port_clkena2 = "PORT_UNUSED",
                altpll_component.port_clkena3 = "PORT_UNUSED",
                altpll_component.port_clkena4 = "PORT_UNUSED",
                altpll_component.port_clkena5 = "PORT_UNUSED",
                altpll_component.port_extclk0 = "PORT_UNUSED",
                altpll_component.port_extclk1 = "PORT_UNUSED",
                altpll_component.port_extclk2 = "PORT_UNUSED",
                altpll_component.port_extclk3 = "PORT_UNUSED",
                altpll_component.width_clock = 5;


endmodule