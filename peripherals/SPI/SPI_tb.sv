module SPI_tb;

    // SPI I/O
    logic SCLK, CS, MOSI;
    logic MISO;
    
    // local I/O
    logic clk_48, reset_n;
    logic signed [15:0] left, right;
    logic signed [63:0] hp_y1_coeff, hp_y2_coeff, hp_x0_coeff, hp_x1_coeff, hp_x2_coeff;
    logic signed [63:0] lp_y1_coeff, lp_y2_coeff, lp_x0_coeff, lp_x1_coeff, lp_x2_coeff;

    SPI dut_0 (.*);

    logic clk_625;
    logic SCLK_en;
    logic [7:0] cmd;
    logic [15:0] count;
    logic [15:0] left_rpi, right_rpi;

    initial begin
        SCLK = 0;
        CS = 1;
        MOSI = 0;
        clk_48 = 0;
        reset_n = 0;
        left = 1;
        right = -1;
        clk_625 = 0;
        SCLK_en = 0;
        cmd = 1;
        count = 0;
        left_rpi = 0;
        right_rpi = 0;

        repeat(2) @ (posedge clk_48);
        reset_n = 1;
    end

    always @ (negedge clk_48) begin
        repeat (1) @ (negedge clk_625);
        CS = 0;
        repeat (1) @ (negedge clk_625);
        SCLK_en = 1;
        MOSI = cmd[7];
        repeat (7) @ (negedge clk_625) begin
            count += 1;
            MOSI = cmd[7-count];
        end
        repeat (1) @ (posedge clk_625);
        count = 0;
        repeat (16) @ (posedge clk_625) begin
            left_rpi[15-count] = MISO;
            count += 1;
        end
        count = 0;
        repeat (16) @ (posedge clk_625) begin
            right_rpi[15-count] = MISO;
            count += 1;
        end
        repeat (1) @ (negedge clk_625);
        SCLK_en = 0;
        repeat (2) (negedge clk_625);
        CS = 1;
    end

    assign SCLK = (clk_625) && (SCLK_en);

    always @ (posedge clk_48) begin
        left += 1;
        right -= 1;
    end

    always
        #20.833us clk_48 = ~clk_48;

    always
        #16ns clk_625 = ~clk_625;

    initial
        #1000us $stop;

endmodule