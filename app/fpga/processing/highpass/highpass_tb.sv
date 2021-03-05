`define fs 48000

module highpass_tb;

    logic clk_48, reset_n;
    logic [2:0] filter;
    logic signed [15:0] highpassIn;
    logic signed [15:0] highpassOut;

    highpass dut_0 (.*);

    initial begin
        clk_48 = 0;
        reset_n = 0;
        filter = 3;
        highpassIn = '0;

        repeat(2) @(posedge clk_48);


            reset_n = 1;

            highpassIn = 16'b0111111111111111;


        forever begin
            reset_n = 1;

            // 1kHz sine wave
            highpassIn = 0.000000;
            repeat(1) @(posedge clk_48);
            highpassIn = 4276.951740;
            repeat(1) @(posedge clk_48);
            highpassIn = 8480.723651;
            repeat(1) @(posedge clk_48);
            highpassIn = 12539.388028;
            repeat(1) @(posedge clk_48);
            highpassIn = 16383.500000;
            repeat(1) @(posedge clk_48);
            highpassIn = 19947.285744;
            repeat(1) @(posedge clk_48);
            highpassIn = 23169.767899;
            repeat(1) @(posedge clk_48);
            highpassIn = 25995.808901;
            repeat(1) @(posedge clk_48);
            highpassIn = 28377.054406;
            repeat(1) @(posedge clk_48);
            highpassIn = 30272.760642;
            repeat(1) @(posedge clk_48);
            highpassIn = 31650.491550;
            repeat(1) @(posedge clk_48);
            highpassIn = 32486.673773;
            repeat(1) @(posedge clk_48);
            highpassIn = 32767.000000;
            repeat(1) @(posedge clk_48);
            highpassIn = 32486.673773;
            repeat(1) @(posedge clk_48);
            highpassIn = 31650.491550;
            repeat(1) @(posedge clk_48);
            highpassIn = 30272.760642;
            repeat(1) @(posedge clk_48);
            highpassIn = 28377.054406;
            repeat(1) @(posedge clk_48);
            highpassIn = 25995.808901;
            repeat(1) @(posedge clk_48);
            highpassIn = 23169.767899;
            repeat(1) @(posedge clk_48);
            highpassIn = 19947.285744;
            repeat(1) @(posedge clk_48);
            highpassIn = 16383.500000;
            repeat(1) @(posedge clk_48);
            highpassIn = 12539.388028;
            repeat(1) @(posedge clk_48);
            highpassIn = 8480.723651;
            repeat(1) @(posedge clk_48);
            highpassIn = 4276.951740;
            repeat(1) @(posedge clk_48);
            highpassIn = 0.000000;
            repeat(1) @(posedge clk_48);
            highpassIn = -4276.951740;
            repeat(1) @(posedge clk_48);
            highpassIn = -8480.723651;
            repeat(1) @(posedge clk_48);
            highpassIn = -12539.388028;
            repeat(1) @(posedge clk_48);
            highpassIn = -16383.500000;
            repeat(1) @(posedge clk_48);
            highpassIn = -19947.285744;
            repeat(1) @(posedge clk_48);
            highpassIn = -23169.767899;
            repeat(1) @(posedge clk_48);
            highpassIn = -25995.808901;
            repeat(1) @(posedge clk_48);
            highpassIn = -28377.054406;
            repeat(1) @(posedge clk_48);
            highpassIn = -30272.760642;
            repeat(1) @(posedge clk_48);
            highpassIn = -31650.491550;
            repeat(1) @(posedge clk_48);
            highpassIn = -32486.673773;
            repeat(1) @(posedge clk_48);
            highpassIn = -32767.000000;
            repeat(1) @(posedge clk_48);
            highpassIn = -32486.673773;
            repeat(1) @(posedge clk_48);
            highpassIn = -31650.491550;
            repeat(1) @(posedge clk_48);
            highpassIn = -30272.760642;
            repeat(1) @(posedge clk_48);
            highpassIn = -28377.054406;
            repeat(1) @(posedge clk_48);
            highpassIn = -25995.808901;
            repeat(1) @(posedge clk_48);
            highpassIn = -23169.767899;
            repeat(1) @(posedge clk_48);
            highpassIn = -19947.285744;
            repeat(1) @(posedge clk_48);
            highpassIn = -16383.500000;
            repeat(1) @(posedge clk_48);
            highpassIn = -12539.388028;
            repeat(1) @(posedge clk_48);
            highpassIn = -8480.723651;
            repeat(1) @(posedge clk_48);
            highpassIn = -4276.951740;
            repeat(1) @(posedge clk_48);


            // 3kHz sine wave
            /*highpassIn = 0;
            repeat(1) @(posedge clk_48);
            highpassIn = 12540;
            repeat(1) @(posedge clk_48);
            highpassIn = 23170;
            repeat(1) @(posedge clk_48);
            highpassIn = 30273;
            repeat(1) @(posedge clk_48);
            highpassIn = 32767;
            repeat(1) @(posedge clk_48);
            highpassIn = 30273;
            repeat(1) @(posedge clk_48);
            highpassIn = 23170;
            repeat(1) @(posedge clk_48);
            highpassIn = 12540;
            repeat(1) @(posedge clk_48);
            highpassIn = 0;
            repeat(1) @(posedge clk_48);
            highpassIn = -12540;
            repeat(1) @(posedge clk_48);
            highpassIn = -23170;
            repeat(1) @(posedge clk_48);
            highpassIn = -30273;
            repeat(1) @(posedge clk_48);
            highpassIn = -32767;
            repeat(1) @(posedge clk_48);
            highpassIn = -30273;
            repeat(1) @(posedge clk_48);
            highpassIn = -23170;
            repeat(1) @(posedge clk_48);
            highpassIn = -12540;
            repeat(1) @(posedge clk_48);*/


            // 16kHz sine wave
            /*highpassIn =     0;
            repeat(1) @(posedge clk_48);
            highpassIn =  7094;
            repeat(1) @(posedge clk_48);
            highpassIn = -7094;
            repeat(1) @(posedge clk_48);
            highpassIn =    -0;
            repeat(1) @(posedge clk_48);
            highpassIn =  7094;
            repeat(1) @(posedge clk_48);
            highpassIn = -7094;
            repeat(1) @(posedge clk_48);
            highpassIn =    -0;
            repeat(1) @(posedge clk_48);
            highpassIn =  7094;
            repeat(1) @(posedge clk_48);
            highpassIn = -7094;
            repeat(1) @(posedge clk_48);*/
        end
        
    end

    initial begin
        #20833.333us $stop;
    end

    always
    #6.944444333us clk_48 = ~clk_48;

endmodule
