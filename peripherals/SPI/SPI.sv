module SPI (

    // SPI I/O
    input logic SCLK, CS, MOSI,
    output logic MISO
    
    // local I/O
    input logic clk, reset_n,
    input logic signed [15:0] left, right,
    output logic signed [63:0] hp_y1_coeff, hp_y2_coeff, hp_x0_coeff, hp_x1_coeff, hp_x2_coeff,
    output logic signed [63:0] lp_y1_coeff, lp_y2_coeff, lp_x0_coeff, lp_x1_coeff, lp_x2_coeff);


endmodule