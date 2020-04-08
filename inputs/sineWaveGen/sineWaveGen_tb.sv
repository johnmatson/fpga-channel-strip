module sineWaveGen_tb;

    logic clk_48, reset_n;
    logic [2:0] freq;
    logic signed [15:0] outWave;

    sineWaveGen dut_0 (.*);

    initial begin
        clk_48 = 0;
        reset_n = 0;
        freq = 4;

        repeat(2) @(posedge clk_48);
        reset_n = 1;
    end

    initial begin
        #20833.333us $stop;
    end

    always
    #20.833333us clk_48 = ~clk_48;

endmodule