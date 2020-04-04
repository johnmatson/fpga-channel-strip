//`timescale 1ns/1ns

module lowpass_tb;

    logic clk, reset_n;
    logic [15:0] lowpassIn;
    logic [15:0] lowpassOut;
    logic [31:0] lowpassOut2; // test only
    logic [15:0] lowpassOut3; // test only
    logic [31:0] lowpassOut4; // test only

    lowpass dut_0 (.*);

    initial begin
        clk = 0;
        reset_n = 0;
        lowpassIn = '0;

        repeat(2) @(posedge clk);


            reset_n = 1;

            lowpassIn = 16'b0111111111111111;


        forever begin// (int i = 0; i<50; i++) begin
            reset_n = 1;
/*
            lowpassIn = 16'b0111111111111111;

            repeat(4) @(posedge clk);

            lowpassIn = 16'b1000000000000000;

            repeat(4) @(posedge clk);
*/
            // 3kHz sine wave
            /*lowpassIn = 0;
            repeat(1) @(posedge clk);
            lowpassIn = 12540*0.25;
            repeat(1) @(posedge clk);
            lowpassIn = 23170*0.25;
            repeat(1) @(posedge clk);
            lowpassIn = 30273*0.25;
            repeat(1) @(posedge clk);
            lowpassIn = 32767*0.25;
            repeat(1) @(posedge clk);
            lowpassIn = 30273*0.25;
            repeat(1) @(posedge clk);
            lowpassIn = 23170*0.25;
            repeat(1) @(posedge clk);
            lowpassIn = 12540*0.25;
            repeat(1) @(posedge clk);
            lowpassIn = 0;
            repeat(1) @(posedge clk);
            lowpassIn = -12540*0.25;
            repeat(1) @(posedge clk);
            lowpassIn = -23170*0.25;
            repeat(1) @(posedge clk);
            lowpassIn = -30273*0.25;
            repeat(1) @(posedge clk);
            lowpassIn = -32767*0.25;
            repeat(1) @(posedge clk);
            lowpassIn = -30273*0.25;
            repeat(1) @(posedge clk);
            lowpassIn = -23170*0.25;
            repeat(1) @(posedge clk);
            lowpassIn = -12540*0.25;
            repeat(1) @(posedge clk);*/


            // 1kHz sine wave
            lowpassIn =     0;
            repeat(1) @(posedge clk);
            lowpassIn =  7094;
            repeat(1) @(posedge clk);
            lowpassIn = -7094;
            repeat(1) @(posedge clk);
            lowpassIn =    -0;
            repeat(1) @(posedge clk);
            lowpassIn =  7094;
            repeat(1) @(posedge clk);
            lowpassIn = -7094;
            repeat(1) @(posedge clk);
            lowpassIn =    -0;
            repeat(1) @(posedge clk);
            lowpassIn =  7094;
            repeat(1) @(posedge clk);
            lowpassIn = -7094;
            repeat(1) @(posedge clk);
        end
        //$stop;
        
    end

    initial begin
        #20833.333us $stop;
    end

    always
    #20.833333us clk = ~clk;

endmodule
