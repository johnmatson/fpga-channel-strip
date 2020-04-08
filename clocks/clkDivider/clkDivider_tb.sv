module clkDivider_tb;

    logic reset_n;
    logic clkIn;
    logic clkOut;

    clkDivider dut_0 (.*);

    initial begin
        clkIn = 0;
        reset_n = 0;

        #62.5us reset_n = 1;

        #20833.3us $stop;
    end

    always
    #20.833333us clkIn = ~clkIn;

endmodule