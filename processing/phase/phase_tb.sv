module phase_tb;

    logic phase;
    logic signed [15:0] phaseIn;
    logic signed [15:0] phaseOut

    phase dut_0(.*);

    logic clk_48;

    initial begin
        clk_48 = 0;
        phaseIn = '0;

        repeat(2) @(posedge clk_48);
            phaseIn = 16'b0111111111111111;

        forever begin

            // 1kHz sine wave
            phaseIn = 0.000000;
            repeat(1) @(posedge clk_48);
            phaseIn = 4276.951740;
            repeat(1) @(posedge clk_48);
            phaseIn = 8480.723651;
            repeat(1) @(posedge clk_48);
            phaseIn = 12539.388028;
            repeat(1) @(posedge clk_48);
            phaseIn = 16383.500000;
            repeat(1) @(posedge clk_48);
            phaseIn = 19947.285744;
            repeat(1) @(posedge clk_48);
            phaseIn = 23169.767899;
            repeat(1) @(posedge clk_48);
            phaseIn = 25995.808901;
            repeat(1) @(posedge clk_48);
            phaseIn = 28377.054406;
            repeat(1) @(posedge clk_48);
            phaseIn = 30272.760642;
            repeat(1) @(posedge clk_48);
            phaseIn = 31650.491550;
            repeat(1) @(posedge clk_48);
            phaseIn = 32486.673773;
            repeat(1) @(posedge clk_48);
            phaseIn = 32767.000000;
            repeat(1) @(posedge clk_48);
            phaseIn = 32486.673773;
            repeat(1) @(posedge clk_48);
            phaseIn = 31650.491550;
            repeat(1) @(posedge clk_48);
            phaseIn = 30272.760642;
            repeat(1) @(posedge clk_48);
            phaseIn = 28377.054406;
            repeat(1) @(posedge clk_48);
            phaseIn = 25995.808901;
            repeat(1) @(posedge clk_48);
            phaseIn = 23169.767899;
            repeat(1) @(posedge clk_48);
            phaseIn = 19947.285744;
            repeat(1) @(posedge clk_48);
            phaseIn = 16383.500000;
            repeat(1) @(posedge clk_48);
            phaseIn = 12539.388028;
            repeat(1) @(posedge clk_48);
            phaseIn = 8480.723651;
            repeat(1) @(posedge clk_48);
            phaseIn = 4276.951740;
            repeat(1) @(posedge clk_48);
            phaseIn = 0.000000;
            repeat(1) @(posedge clk_48);
            phaseIn = -4276.951740;
            repeat(1) @(posedge clk_48);
            phaseIn = -8480.723651;
            repeat(1) @(posedge clk_48);
            phaseIn = -12539.388028;
            repeat(1) @(posedge clk_48);
            phaseIn = -16383.500000;
            repeat(1) @(posedge clk_48);
            phaseIn = -19947.285744;
            repeat(1) @(posedge clk_48);
            phaseIn = -23169.767899;
            repeat(1) @(posedge clk_48);
            phaseIn = -25995.808901;
            repeat(1) @(posedge clk_48);
            phaseIn = -28377.054406;
            repeat(1) @(posedge clk_48);
            phaseIn = -30272.760642;
            repeat(1) @(posedge clk_48);
            phaseIn = -31650.491550;
            repeat(1) @(posedge clk_48);
            phaseIn = -32486.673773;
            repeat(1) @(posedge clk_48);
            phaseIn = -32767.000000;
            repeat(1) @(posedge clk_48);
            phaseIn = -32486.673773;
            repeat(1) @(posedge clk_48);
            phaseIn = -31650.491550;
            repeat(1) @(posedge clk_48);
            phaseIn = -30272.760642;
            repeat(1) @(posedge clk_48);
            phaseIn = -28377.054406;
            repeat(1) @(posedge clk_48);
            phaseIn = -25995.808901;
            repeat(1) @(posedge clk_48);
            phaseIn = -23169.767899;
            repeat(1) @(posedge clk_48);
            phaseIn = -19947.285744;
            repeat(1) @(posedge clk_48);
            phaseIn = -16383.500000;
            repeat(1) @(posedge clk_48);
            phaseIn = -12539.388028;
            repeat(1) @(posedge clk_48);
            phaseIn = -8480.723651;
            repeat(1) @(posedge clk_48);
            phaseIn = -4276.951740;
            repeat(1) @(posedge clk_48);


            /*/ 3kHz sine wave
            phaseIn = 0;
            repeat(1) @(posedge clk_48);
            phaseIn = 12540;
            repeat(1) @(posedge clk_48);
            phaseIn = 23170;
            repeat(1) @(posedge clk_48);
            phaseIn = 30273;
            repeat(1) @(posedge clk_48);
            phaseIn = 32767;
            repeat(1) @(posedge clk_48);
            phaseIn = 30273;
            repeat(1) @(posedge clk_48);
            phaseIn = 23170;
            repeat(1) @(posedge clk_48);
            phaseIn = 12540;
            repeat(1) @(posedge clk_48);
            phaseIn = 0;
            repeat(1) @(posedge clk_48);
            phaseIn = -12540;
            repeat(1) @(posedge clk_48);
            phaseIn = -23170;
            repeat(1) @(posedge clk_48);
            phaseIn = -30273;
            repeat(1) @(posedge clk_48);
            phaseIn = -32767;
            repeat(1) @(posedge clk_48);
            phaseIn = -30273;
            repeat(1) @(posedge clk_48);
            phaseIn = -23170;
            repeat(1) @(posedge clk_48);
            phaseIn = -12540;
            repeat(1) @(posedge clk_48);


            // 16kHz sine wave
            /*phaseIn =     0;
            repeat(1) @(posedge clk_48);
            phaseIn =  7094;
            repeat(1) @(posedge clk_48);
            phaseIn = -7094;
            repeat(1) @(posedge clk_48);
            phaseIn =    -0;
            repeat(1) @(posedge clk_48);
            phaseIn =  7094;
            repeat(1) @(posedge clk_48);
            phaseIn = -7094;
            repeat(1) @(posedge clk_48);
            phaseIn =    -0;
            repeat(1) @(posedge clk_48);
            phaseIn =  7094;
            repeat(1) @(posedge clk_48);
            phaseIn = -7094;
            repeat(1) @(posedge clk_48);*/
        end
        
    end

    initial begin
        #20833.333us $stop;
    end

    always
    #20.833333us clk_48 = ~clk_48;

endmodule