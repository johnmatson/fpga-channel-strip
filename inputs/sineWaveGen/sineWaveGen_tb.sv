module sineWaveGen_tb;

    logic clk, reset_n;
    logic [2:0] freq;
    logic signed [15:0] wave;

    sineWaveGen dut_0 (.*);

    initial begin
        clk = 0;
        reset_n = 0;
        freq = 0;

        repeat(2) @(posedge clk);
        reset_n = 1;
    end

    initial begin
        #20833.333us $stop;
    end

    always
    #20.833333us clk = ~clk;

endmodule