module DAC_tb;

    logic clk_12, clk_48, reset_n;
    logic signed [15:0] leftIn, rightIn;
    logic DL, DR, LL, LR;

    bit [7:0] count;
    logic [15:0] l_buffer;
    logic [15:0] r_buffer;
    logic [15:0] l_data;
    logic [15:0] r_data;

    DAC dut_0(.*);

    initial begin
        clk_12 = 0;
        clk_48 = 0;
        reset_n = 0;
        leftIn = 16'b0000000000001001;
        rightIn = 16'b0000000000000110;

        repeat(2) @ (posedge clk_48);
        reset_n = 1;

        repeat(20) @ (posedge clk_48);
        leftIn = 16'b00000000000000100;
        rightIn = 16'b0000000000001000;
    end

    always_ff @ (posedge clk_12, negedge reset_n) begin
        if (~reset_n) begin
            l_buffer <= 0;
            r_buffer <= 0;
        end
        else begin
            l_buffer <= {l_buffer[14:0], DL};
            r_buffer <= {r_buffer[14:0], DL};
        end
    end

    always_ff @ (negedge LL, negedge reset_n) begin
        if (~reset_n)
            l_data <= 0;
        else
            l_data <= l_buffer;
    end

    always_ff @ (negedge LR, negedge reset_n) begin
        if (~reset_n)
            r_data <= 0;
        else
            r_data <= r_buffer;
    end

    always #8ns clk_12 = ~clk_48;

    always @ (posedge clk_12) begin
        if (count == 255)
            clk_48 = ~clk_48;
        count += 1;
    end

    initial #20000us $stop;

endmodule