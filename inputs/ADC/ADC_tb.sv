module ADC_tb;

    logic reset_n;
    logic serialIn;
    logic BCLK, WCLK, LRCK;
    logic signed [15:0] leftOut, rightOut;
    
    logic [15:0] data;
    logic clk;
    bit [4:0] i;

    ADC dut_0 (.*);

    initial begin
        clk = 0;
        LRCK = 1;
        BCLK = 0;
        serialIn = 0;
        l_data = 16'b0000000000001001;
        r_data = 16'b0000000000000110;
        WCLK = 0;
        reset_n = 0;

        repeat(2) @ (posedge clk);

        forever begin
            repeat(1) @ (negedge BCLK);
            WCLK = 1;
            for(i=0; i<=15; i+=1) begin
                serialIn = l_data[15-i];
                repeat(1) @ (negedge BCLK);
            end
            serialIn = 0;
            WCLK = 0;
            repeat(14) @ (negedge BCLK);
            LRCK = 0;

            repeat(1) @ (negedge BCLK);
            WCLK = 1;
            for(i=0; i<=15; i+=1) begin
                serialIn = r_data[15-i];
                repeat(1) @ (negedge BCLK);
            end
            serialIn = 0;
            WCLK = 0;
            repeat(14) @ (negedge BCLK);
            LRCK = 1;
        end
    end

    always
        #20us clk = ~clk;

    always @ (posedge clk)
        BCLK = ~BCLK;



endmodule