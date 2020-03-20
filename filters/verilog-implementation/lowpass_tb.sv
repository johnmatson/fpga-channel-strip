`timescale 1ms/1ms

module lowpass_tb;

    logic clk, reset_n;
    logic [15:0] lowpassIn;
    logic [15:0] lowpassOut;
    logic [31:0] lowpassOut2,
    logic [15:0] lowpassOut3,

    lowpass dut_0 (.*);

    initial begin
        clk = 0;
        reset_n = 0;

        repeat(2) @(posedge clk);

        reset_n = 1;

        repeat(2) @(posedge clk);

        always begin
        lowpassIn = 16'b0111111111111111;

        repeat(4) @(posedge clk);

        lowpassIn = 16'b1000000000000000;

        repeat(4) @(posedge clk);

        end

    end

    initial begin
        #200ns $stop;
    end

    always
    #20.833us clk = ~clk;

endmodule