`define fs 48000

module lowpass_tb;

    logic clk_144, reset_n;
    logic [2:0] filter;
    logic signed [15:0] lowpassIn;
    logic signed [15:0] lowpassOut;

    lowpass dut_0 (.*);

    initial begin
        clk_144 = 0;
        reset_n = 0;
        filter = 1;
        lowpassIn = '0;

        repeat(2) @(posedge clk_144);


            reset_n = 1;

            lowpassIn = 16'b0111111111111111;


        forever begin
            reset_n = 1;

            // 1kHz sine wave
            lowpassIn = 0.000000;
            repeat(3) @(posedge clk_144);
            lowpassIn = 4276.951740;
            repeat(3) @(posedge clk_144);
            lowpassIn = 8480.723651;
            repeat(3) @(posedge clk_144);
            lowpassIn = 12539.388028;
            repeat(3) @(posedge clk_144);
            lowpassIn = 16383.500000;
            repeat(3) @(posedge clk_144);
            lowpassIn = 19947.285744;
            repeat(3) @(posedge clk_144);
            lowpassIn = 23169.767899;
            repeat(3) @(posedge clk_144);
            lowpassIn = 25995.808901;
            repeat(3) @(posedge clk_144);
            lowpassIn = 28377.054406;
            repeat(3) @(posedge clk_144);
            lowpassIn = 30272.760642;
            repeat(3) @(posedge clk_144);
            lowpassIn = 31650.491550;
            repeat(3) @(posedge clk_144);
            lowpassIn = 32486.673773;
            repeat(3) @(posedge clk_144);
            lowpassIn = 32767.000000;
            repeat(3) @(posedge clk_144);
            lowpassIn = 32486.673773;
            repeat(3) @(posedge clk_144);
            lowpassIn = 31650.491550;
            repeat(3) @(posedge clk_144);
            lowpassIn = 30272.760642;
            repeat(3) @(posedge clk_144);
            lowpassIn = 28377.054406;
            repeat(3) @(posedge clk_144);
            lowpassIn = 25995.808901;
            repeat(3) @(posedge clk_144);
            lowpassIn = 23169.767899;
            repeat(3) @(posedge clk_144);
            lowpassIn = 19947.285744;
            repeat(3) @(posedge clk_144);
            lowpassIn = 16383.500000;
            repeat(3) @(posedge clk_144);
            lowpassIn = 12539.388028;
            repeat(3) @(posedge clk_144);
            lowpassIn = 8480.723651;
            repeat(3) @(posedge clk_144);
            lowpassIn = 4276.951740;
            repeat(3) @(posedge clk_144);
            lowpassIn = 0.000000;
            repeat(3) @(posedge clk_144);
            lowpassIn = -4276.951740;
            repeat(3) @(posedge clk_144);
            lowpassIn = -8480.723651;
            repeat(3) @(posedge clk_144);
            lowpassIn = -12539.388028;
            repeat(3) @(posedge clk_144);
            lowpassIn = -16383.500000;
            repeat(3) @(posedge clk_144);
            lowpassIn = -19947.285744;
            repeat(3) @(posedge clk_144);
            lowpassIn = -23169.767899;
            repeat(3) @(posedge clk_144);
            lowpassIn = -25995.808901;
            repeat(3) @(posedge clk_144);
            lowpassIn = -28377.054406;
            repeat(3) @(posedge clk_144);
            lowpassIn = -30272.760642;
            repeat(3) @(posedge clk_144);
            lowpassIn = -31650.491550;
            repeat(3) @(posedge clk_144);
            lowpassIn = -32486.673773;
            repeat(3) @(posedge clk_144);
            lowpassIn = -32767.000000;
            repeat(3) @(posedge clk_144);
            lowpassIn = -32486.673773;
            repeat(3) @(posedge clk_144);
            lowpassIn = -31650.491550;
            repeat(3) @(posedge clk_144);
            lowpassIn = -30272.760642;
            repeat(3) @(posedge clk_144);
            lowpassIn = -28377.054406;
            repeat(3) @(posedge clk_144);
            lowpassIn = -25995.808901;
            repeat(3) @(posedge clk_144);
            lowpassIn = -23169.767899;
            repeat(3) @(posedge clk_144);
            lowpassIn = -19947.285744;
            repeat(3) @(posedge clk_144);
            lowpassIn = -16383.500000;
            repeat(3) @(posedge clk_144);
            lowpassIn = -12539.388028;
            repeat(3) @(posedge clk_144);
            lowpassIn = -8480.723651;
            repeat(3) @(posedge clk_144);
            lowpassIn = -4276.951740;
            repeat(3) @(posedge clk_144);


            /*/ 3kHz sine wave
            lowpassIn = 0;
            repeat(3) @(posedge clk_144);
            lowpassIn = 12540;
            repeat(3) @(posedge clk_144);
            lowpassIn = 23170;
            repeat(3) @(posedge clk_144);
            lowpassIn = 30273;
            repeat(3) @(posedge clk_144);
            lowpassIn = 32767;
            repeat(3) @(posedge clk_144);
            lowpassIn = 30273;
            repeat(3) @(posedge clk_144);
            lowpassIn = 23170;
            repeat(3) @(posedge clk_144);
            lowpassIn = 12540;
            repeat(3) @(posedge clk_144);
            lowpassIn = 0;
            repeat(3) @(posedge clk_144);
            lowpassIn = -12540;
            repeat(3) @(posedge clk_144);
            lowpassIn = -23170;
            repeat(3) @(posedge clk_144);
            lowpassIn = -30273;
            repeat(3) @(posedge clk_144);
            lowpassIn = -32767;
            repeat(3) @(posedge clk_144);
            lowpassIn = -30273;
            repeat(3) @(posedge clk_144);
            lowpassIn = -23170;
            repeat(3) @(posedge clk_144);
            lowpassIn = -12540;
            repeat(3) @(posedge clk_144);


            // 16kHz sine wave
            /*lowpassIn =     0;
            repeat(3) @(posedge clk_144);
            lowpassIn =  7094;
            repeat(3) @(posedge clk_144);
            lowpassIn = -7094;
            repeat(3) @(posedge clk_144);
            lowpassIn =    -0;
            repeat(3) @(posedge clk_144);
            lowpassIn =  7094;
            repeat(3) @(posedge clk_144);
            lowpassIn = -7094;
            repeat(3) @(posedge clk_144);
            lowpassIn =    -0;
            repeat(3) @(posedge clk_144);
            lowpassIn =  7094;
            repeat(3) @(posedge clk_144);
            lowpassIn = -7094;
            repeat(3) @(posedge clk_144);*/
        end
        
    end

    initial begin
        #20833.333us $stop;
    end

    always
    #6.944444333us clk_144 = ~clk_144;

endmodule
