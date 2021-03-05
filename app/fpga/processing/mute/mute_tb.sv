module mute_tb;

    logic mute;
    logic signed [15:0] muteIn;
    logic signed [15:0] muteOut;

    mute dut_0(.*);

    logic clk_48;

    initial begin
        clk_48 = 0;
        muteIn = '0;
        mute = 0;

        repeat(2) @(posedge clk_48);
            muteIn = 16'b0111111111111111;

        forever begin

            // 1kHz sine wave
            muteIn = 0.000000;
            repeat(1) @(posedge clk_48);
            muteIn = 4276.951740;
            repeat(1) @(posedge clk_48);
            muteIn = 8480.723651;
            repeat(1) @(posedge clk_48);
            muteIn = 12539.388028;
            repeat(1) @(posedge clk_48);
            muteIn = 16383.500000;
            repeat(1) @(posedge clk_48);
            muteIn = 19947.285744;
            repeat(1) @(posedge clk_48);
            muteIn = 23169.767899;
            repeat(1) @(posedge clk_48);
            muteIn = 25995.808901;
            repeat(1) @(posedge clk_48);
            muteIn = 28377.054406;
            repeat(1) @(posedge clk_48);
            muteIn = 30272.760642;
            repeat(1) @(posedge clk_48);
            muteIn = 31650.491550;
            repeat(1) @(posedge clk_48);
            muteIn = 32486.673773;
            repeat(1) @(posedge clk_48);
            muteIn = 32767.000000;
            repeat(1) @(posedge clk_48);
            muteIn = 32486.673773;
            repeat(1) @(posedge clk_48);
            muteIn = 31650.491550;
            repeat(1) @(posedge clk_48);
            muteIn = 30272.760642;
            repeat(1) @(posedge clk_48);
            muteIn = 28377.054406;
            repeat(1) @(posedge clk_48);
            muteIn = 25995.808901;
            repeat(1) @(posedge clk_48);
            muteIn = 23169.767899;
            repeat(1) @(posedge clk_48);
            muteIn = 19947.285744;
            repeat(1) @(posedge clk_48);
            muteIn = 16383.500000;
            repeat(1) @(posedge clk_48);
            muteIn = 12539.388028;
            repeat(1) @(posedge clk_48);
            muteIn = 8480.723651;
            repeat(1) @(posedge clk_48);
            muteIn = 4276.951740;
            repeat(1) @(posedge clk_48);
            muteIn = 0.000000;
            repeat(1) @(posedge clk_48);
            muteIn = -4276.951740;
            repeat(1) @(posedge clk_48);
            muteIn = -8480.723651;
            repeat(1) @(posedge clk_48);
            muteIn = -12539.388028;
            repeat(1) @(posedge clk_48);
            muteIn = -16383.500000;
            repeat(1) @(posedge clk_48);
            muteIn = -19947.285744;
            repeat(1) @(posedge clk_48);
            muteIn = -23169.767899;
            repeat(1) @(posedge clk_48);
            muteIn = -25995.808901;
            repeat(1) @(posedge clk_48);
            muteIn = -28377.054406;
            repeat(1) @(posedge clk_48);
            muteIn = -30272.760642;
            repeat(1) @(posedge clk_48);
            muteIn = -31650.491550;
            repeat(1) @(posedge clk_48);
            muteIn = -32486.673773;
            repeat(1) @(posedge clk_48);
            muteIn = -32767.000000;
            repeat(1) @(posedge clk_48);
            muteIn = -32486.673773;
            repeat(1) @(posedge clk_48);
            muteIn = -31650.491550;
            repeat(1) @(posedge clk_48);
            muteIn = -30272.760642;
            repeat(1) @(posedge clk_48);
            muteIn = -28377.054406;
            repeat(1) @(posedge clk_48);
            muteIn = -25995.808901;
            repeat(1) @(posedge clk_48);
            muteIn = -23169.767899;
            repeat(1) @(posedge clk_48);
            muteIn = -19947.285744;
            repeat(1) @(posedge clk_48);
            muteIn = -16383.500000;
            repeat(1) @(posedge clk_48);
            muteIn = -12539.388028;
            repeat(1) @(posedge clk_48);
            muteIn = -8480.723651;
            repeat(1) @(posedge clk_48);
            muteIn = -4276.951740;
            repeat(1) @(posedge clk_48);


            /*/ 3kHz sine wave
            muteIn = 0;
            repeat(1) @(posedge clk_48);
            muteIn = 12540;
            repeat(1) @(posedge clk_48);
            muteIn = 23170;
            repeat(1) @(posedge clk_48);
            muteIn = 30273;
            repeat(1) @(posedge clk_48);
            muteIn = 32767;
            repeat(1) @(posedge clk_48);
            muteIn = 30273;
            repeat(1) @(posedge clk_48);
            muteIn = 23170;
            repeat(1) @(posedge clk_48);
            muteIn = 12540;
            repeat(1) @(posedge clk_48);
            muteIn = 0;
            repeat(1) @(posedge clk_48);
            muteIn = -12540;
            repeat(1) @(posedge clk_48);
            muteIn = -23170;
            repeat(1) @(posedge clk_48);
            muteIn = -30273;
            repeat(1) @(posedge clk_48);
            muteIn = -32767;
            repeat(1) @(posedge clk_48);
            muteIn = -30273;
            repeat(1) @(posedge clk_48);
            muteIn = -23170;
            repeat(1) @(posedge clk_48);
            muteIn = -12540;
            repeat(1) @(posedge clk_48);


            // 16kHz sine wave
            /*muteIn =     0;
            repeat(1) @(posedge clk_48);
            muteIn =  7094;
            repeat(1) @(posedge clk_48);
            muteIn = -7094;
            repeat(1) @(posedge clk_48);
            muteIn =    -0;
            repeat(1) @(posedge clk_48);
            muteIn =  7094;
            repeat(1) @(posedge clk_48);
            muteIn = -7094;
            repeat(1) @(posedge clk_48);
            muteIn =    -0;
            repeat(1) @(posedge clk_48);
            muteIn =  7094;
            repeat(1) @(posedge clk_48);
            muteIn = -7094;
            repeat(1) @(posedge clk_48);*/
        end
        
    end

    initial begin
        #1.5ms mute = 1;
        #1.5ms mute = 0;
        #1.5ms mute = 1;
    end

    initial begin
        #20833.333us $stop;
    end

    always
    #20.833333us clk_48 = ~clk_48;

endmodule