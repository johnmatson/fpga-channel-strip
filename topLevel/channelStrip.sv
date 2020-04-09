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
    logic [3:0] num3, num2, num1, num0;
    logic decimal;
    logic [3:0] num;

    logic [3:0] buttonNum;
    //logic kphit;
    logic [15:0] buttons;


    always_ff @(posedge clk_48) 
        digit <= digit + 1'b1 ;


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


    colseq colseq_0 (           .clk(clk_48), .reset_n,
                                .kpr,
                                .kpc);
                                
    kpdecode kpdecode_0 (       .kpr, .kpc,
                                .buttonNum/*,
                                .kphit*/);
    
    decodeButton decodeButton_0(.buttonNum,
                                .buttons);

    encodeButton encodeButton_0(.buttons,
                                .reset_n,
                                .freqSelect,
                                .lowpassSelect, .highpassSelect);


    pll pll_0 ( .inclk0(CLOCK_50), .c0(clk_144) );

    clkDivider clkDivider_0 ( .reset_n, .clkIn(clk_144), .clkOut(clk_48) );

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
                altpll_component.clk0_divide_by = 347,
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