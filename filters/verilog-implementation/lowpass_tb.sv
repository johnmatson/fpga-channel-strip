module lowpass_tb;

    logic clk;
    logic [15:0] lowpassIn;

    lowpass dut_0 (.*);

    initial begin
        clk = 0;
        lowpassIn = '0;
    end

    forever begin
        #5ns clk = ~clk;
    end

    forever begin
        #10ns lowpassIn = '1;
        #10ns lowpassIn = '0;
    end

    initial begin
        #200ns $stop;
    end

endmodule