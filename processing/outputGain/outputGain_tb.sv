module outputGain_tb;

    logic [15:0] gain;
    logic signed [15:0] outputGainIn;
    logic signed [15:0] outputGainOut;

    outputGain dut_0 (.*);

    logic clk_48;

    initial begin
        clk_48 = 0;
        outputGainIn = '0;
        gain = 'b0001000000000000;

        forever begin

            // 1kHz sine wave
            outputGainIn = 0.000000;
            repeat(1) @(posedge clk_48);
            outputGainIn = 4276.951740;
            repeat(1) @(posedge clk_48);
            outputGainIn = 8480.723651;
            repeat(1) @(posedge clk_48);
            outputGainIn = 12539.388028;
            repeat(1) @(posedge clk_48);
            outputGainIn = 16383.500000;
            repeat(1) @(posedge clk_48);
            outputGainIn = 19947.285744;
            repeat(1) @(posedge clk_48);
            outputGainIn = 23169.767899;
            repeat(1) @(posedge clk_48);
            outputGainIn = 25995.808901;
            repeat(1) @(posedge clk_48);
            outputGainIn = 28377.054406;
            repeat(1) @(posedge clk_48);
            outputGainIn = 30272.760642;
            repeat(1) @(posedge clk_48);
            outputGainIn = 31650.491550;
            repeat(1) @(posedge clk_48);
            outputGainIn = 32486.673773;
            repeat(1) @(posedge clk_48);
            outputGainIn = 32767.000000;
            repeat(1) @(posedge clk_48);
            outputGainIn = 32486.673773;
            repeat(1) @(posedge clk_48);
            outputGainIn = 31650.491550;
            repeat(1) @(posedge clk_48);
            outputGainIn = 30272.760642;
            repeat(1) @(posedge clk_48);
            outputGainIn = 28377.054406;
            repeat(1) @(posedge clk_48);
            outputGainIn = 25995.808901;
            repeat(1) @(posedge clk_48);
            outputGainIn = 23169.767899;
            repeat(1) @(posedge clk_48);
            outputGainIn = 19947.285744;
            repeat(1) @(posedge clk_48);
            outputGainIn = 16383.500000;
            repeat(1) @(posedge clk_48);
            outputGainIn = 12539.388028;
            repeat(1) @(posedge clk_48);
            outputGainIn = 8480.723651;
            repeat(1) @(posedge clk_48);
            outputGainIn = 4276.951740;
            repeat(1) @(posedge clk_48);
            outputGainIn = 0.000000;
            repeat(1) @(posedge clk_48);
            outputGainIn = -4276.951740;
            repeat(1) @(posedge clk_48);
            outputGainIn = -8480.723651;
            repeat(1) @(posedge clk_48);
            outputGainIn = -12539.388028;
            repeat(1) @(posedge clk_48);
            outputGainIn = -16383.500000;
            repeat(1) @(posedge clk_48);
            outputGainIn = -19947.285744;
            repeat(1) @(posedge clk_48);
            outputGainIn = -23169.767899;
            repeat(1) @(posedge clk_48);
            outputGainIn = -25995.808901;
            repeat(1) @(posedge clk_48);
            outputGainIn = -28377.054406;
            repeat(1) @(posedge clk_48);
            outputGainIn = -30272.760642;
            repeat(1) @(posedge clk_48);
            outputGainIn = -31650.491550;
            repeat(1) @(posedge clk_48);
            outputGainIn = -32486.673773;
            repeat(1) @(posedge clk_48);
            outputGainIn = -32767.000000;
            repeat(1) @(posedge clk_48);
            outputGainIn = -32486.673773;
            repeat(1) @(posedge clk_48);
            outputGainIn = -31650.491550;
            repeat(1) @(posedge clk_48);
            outputGainIn = -30272.760642;
            repeat(1) @(posedge clk_48);
            outputGainIn = -28377.054406;
            repeat(1) @(posedge clk_48);
            outputGainIn = -25995.808901;
            repeat(1) @(posedge clk_48);
            outputGainIn = -23169.767899;
            repeat(1) @(posedge clk_48);
            outputGainIn = -19947.285744;
            repeat(1) @(posedge clk_48);
            outputGainIn = -16383.500000;
            repeat(1) @(posedge clk_48);
            outputGainIn = -12539.388028;
            repeat(1) @(posedge clk_48);
            outputGainIn = -8480.723651;
            repeat(1) @(posedge clk_48);
            outputGainIn = -4276.951740;
            repeat(1) @(posedge clk_48);


            /*/ 3kHz sine wave
            outputGainIn = 0;
            repeat(1) @(posedge clk_48);
            outputGainIn = 12540;
            repeat(1) @(posedge clk_48);
            outputGainIn = 23170;
            repeat(1) @(posedge clk_48);
            outputGainIn = 30273;
            repeat(1) @(posedge clk_48);
            outputGainIn = 32767;
            repeat(1) @(posedge clk_48);
            outputGainIn = 30273;
            repeat(1) @(posedge clk_48);
            outputGainIn = 23170;
            repeat(1) @(posedge clk_48);
            outputGainIn = 12540;
            repeat(1) @(posedge clk_48);
            outputGainIn = 0;
            repeat(1) @(posedge clk_48);
            outputGainIn = -12540;
            repeat(1) @(posedge clk_48);
            outputGainIn = -23170;
            repeat(1) @(posedge clk_48);
            outputGainIn = -30273;
            repeat(1) @(posedge clk_48);
            outputGainIn = -32767;
            repeat(1) @(posedge clk_48);
            outputGainIn = -30273;
            repeat(1) @(posedge clk_48);
            outputGainIn = -23170;
            repeat(1) @(posedge clk_48);
            outputGainIn = -12540;
            repeat(1) @(posedge clk_48);


            // 16kHz sine wave
            /*outputGainIn =     0;
            repeat(1) @(posedge clk_48);
            outputGainIn =  7094;
            repeat(1) @(posedge clk_48);
            outputGainIn = -7094;
            repeat(1) @(posedge clk_48);
            outputGainIn =    -0;
            repeat(1) @(posedge clk_48);
            outputGainIn =  7094;
            repeat(1) @(posedge clk_48);
            outputGainIn = -7094;
            repeat(1) @(posedge clk_48);
            outputGainIn =    -0;
            repeat(1) @(posedge clk_48);
            outputGainIn =  7094;
            repeat(1) @(posedge clk_48);
            outputGainIn = -7094;
            repeat(1) @(posedge clk_48);*/
        end
        
    end

    initial begin
        #5ms gain = 'b0010000000000000;
        #5ms gain = 'b0000100000000000;
        #5ms gain = 'b0001000000000000;
    end

    initial begin
        #20833.333us $stop;
    end

    always
    #20.833333us clk_48 = ~clk_48;

endmodule