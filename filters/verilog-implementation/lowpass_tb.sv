`define fs 48000

module lowpass_tb;

    logic clk, reset_n;
    logic signed [15:0] lowpassIn;
    logic signed [15:0] lowpassOut;
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
            // 1kHz sine wave
            lowpassIn = 0.000000;
            repeat(3) @(posedge clk);
            lowpassIn = 4276.951740;
            repeat(3) @(posedge clk);
            lowpassIn = 8480.723651;
            repeat(3) @(posedge clk);
            lowpassIn = 12539.388028;
            repeat(3) @(posedge clk);
            lowpassIn = 16383.500000;
            repeat(3) @(posedge clk);
            lowpassIn = 19947.285744;
            repeat(3) @(posedge clk);
            lowpassIn = 23169.767899;
            repeat(3) @(posedge clk);
            lowpassIn = 25995.808901;
            repeat(3) @(posedge clk);
            lowpassIn = 28377.054406;
            repeat(3) @(posedge clk);
            lowpassIn = 30272.760642;
            repeat(3) @(posedge clk);
            lowpassIn = 31650.491550;
            repeat(3) @(posedge clk);
            lowpassIn = 32486.673773;
            repeat(3) @(posedge clk);
            lowpassIn = 32767.000000;
            repeat(3) @(posedge clk);
            lowpassIn = 32486.673773;
            repeat(3) @(posedge clk);
            lowpassIn = 31650.491550;
            repeat(3) @(posedge clk);
            lowpassIn = 30272.760642;
            repeat(3) @(posedge clk);
            lowpassIn = 28377.054406;
            repeat(3) @(posedge clk);
            lowpassIn = 25995.808901;
            repeat(3) @(posedge clk);
            lowpassIn = 23169.767899;
            repeat(3) @(posedge clk);
            lowpassIn = 19947.285744;
            repeat(3) @(posedge clk);
            lowpassIn = 16383.500000;
            repeat(3) @(posedge clk);
            lowpassIn = 12539.388028;
            repeat(3) @(posedge clk);
            lowpassIn = 8480.723651;
            repeat(3) @(posedge clk);
            lowpassIn = 4276.951740;
            repeat(3) @(posedge clk);
            lowpassIn = 0.000000;
            repeat(3) @(posedge clk);
            lowpassIn = -4276.951740;
            repeat(3) @(posedge clk);
            lowpassIn = -8480.723651;
            repeat(3) @(posedge clk);
            lowpassIn = -12539.388028;
            repeat(3) @(posedge clk);
            lowpassIn = -16383.500000;
            repeat(3) @(posedge clk);
            lowpassIn = -19947.285744;
            repeat(3) @(posedge clk);
            lowpassIn = -23169.767899;
            repeat(3) @(posedge clk);
            lowpassIn = -25995.808901;
            repeat(3) @(posedge clk);
            lowpassIn = -28377.054406;
            repeat(3) @(posedge clk);
            lowpassIn = -30272.760642;
            repeat(3) @(posedge clk);
            lowpassIn = -31650.491550;
            repeat(3) @(posedge clk);
            lowpassIn = -32486.673773;
            repeat(3) @(posedge clk);
            lowpassIn = -32767.000000;
            repeat(3) @(posedge clk);
            lowpassIn = -32486.673773;
            repeat(3) @(posedge clk);
            lowpassIn = -31650.491550;
            repeat(3) @(posedge clk);
            lowpassIn = -30272.760642;
            repeat(3) @(posedge clk);
            lowpassIn = -28377.054406;
            repeat(3) @(posedge clk);
            lowpassIn = -25995.808901;
            repeat(3) @(posedge clk);
            lowpassIn = -23169.767899;
            repeat(3) @(posedge clk);
            lowpassIn = -19947.285744;
            repeat(3) @(posedge clk);
            lowpassIn = -16383.500000;
            repeat(3) @(posedge clk);
            lowpassIn = -12539.388028;
            repeat(3) @(posedge clk);
            lowpassIn = -8480.723651;
            repeat(3) @(posedge clk);
            lowpassIn = -4276.951740;
            repeat(3) @(posedge clk);


            // 3kHz sine wave
            /*lowpassIn = 0;
            repeat(3) @(posedge clk);
            lowpassIn = 12540;
            repeat(3) @(posedge clk);
            lowpassIn = 231705;
            repeat(3) @(posedge clk);
            lowpassIn = 30273;
            repeat(3) @(posedge clk);
            lowpassIn = 32767;
            repeat(3) @(posedge clk);
            lowpassIn = 30273;
            repeat(3) @(posedge clk);
            lowpassIn = 23170;
            repeat(3) @(posedge clk);
            lowpassIn = 12540;
            repeat(3) @(posedge clk);
            lowpassIn = 0;
            repeat(3) @(posedge clk);
            lowpassIn = -12540;
            repeat(3) @(posedge clk);
            lowpassIn = -23170;
            repeat(3) @(posedge clk);
            lowpassIn = -30273;
            repeat(3) @(posedge clk);
            lowpassIn = -32767;
            repeat(3) @(posedge clk);
            lowpassIn = -30273;
            repeat(3) @(posedge clk);
            lowpassIn = -23170;
            repeat(3) @(posedge clk);
            lowpassIn = -12540;
            repeat(3) @(posedge clk);*/


            // 16kHz sine wave
            /*lowpassIn =     0;
            repeat(3) @(posedge clk);
            lowpassIn =  7094;
            repeat(3) @(posedge clk);
            lowpassIn = -7094;
            repeat(3) @(posedge clk);
            lowpassIn =    -0;
            repeat(3) @(posedge clk);
            lowpassIn =  7094;
            repeat(3) @(posedge clk);
            lowpassIn = -7094;
            repeat(3) @(posedge clk);
            lowpassIn =    -0;
            repeat(3) @(posedge clk);
            lowpassIn =  7094;
            repeat(3) @(posedge clk);
            lowpassIn = -7094;
            repeat(3) @(posedge clk);*/
        end
        //$stop;
        
    end

    initial begin
        #20833.333us $stop;
    end

    always
    #6.944444333us clk = ~clk;
    //#20.833333us clk = ~clk;

endmodule
