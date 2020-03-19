module lowpass_tb;

    logic clk;
    logic [15:0] lowpassIn;
    logic [15:0] lowpassOut;
    logic [15:0] out4,out3,out2,out1,out0;

    lowpass dut_0 (.*);

    initial begin
        clk = 0;
        lowpassIn = '0;

        forever begin
            #5ns clk = 1;
            #5ns clk = 0;
            lowpassIn = '1;
            #5ns clk = 1;
            #5ns clk = 0;
            lowpassIn = '0;
        end

    end

    initial begin
        #200ns $stop;
    end

endmodule