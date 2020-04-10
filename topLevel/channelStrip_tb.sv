module channelStrip_tb;

    logic [3:0] kpc;  // column select, active-low
    logic  [3:0] kpr;  // rows, active-low w/ pull-ups
    logic [7:0] leds;  // 7-seg LED cathodes
    logic [3:0] ct; // digit enable
    logic  reset_n, CLOCK_50;

    channelStrip dut_0 (.*);

    initial begin
        
        CLOCK_50 = 0;
        reset_n = 0;
        kpr = 4'b1111;

        repeat(3123) @(posedge CLOCK_50);
        reset_n = 1;

        repeat(3123) @(posedge CLOCK_50);
        kpr = 'b0111;
        

    end

    initial begin
        #2000us $stop;
    end

    always
    #20ns CLOCK_50 = ~CLOCK_50;

endmodule