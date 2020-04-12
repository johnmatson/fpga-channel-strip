module highpass #( parameter L = 3, N = 63, shift = 30 ) (
                input logic clk_48, reset_n,
                input logic [2:0] filter,
                input logic signed [15:0] highpassIn,
                output logic signed [15:0] highpassOut);

    // coefficients
    logic signed [N:0] y1_coeff;
    logic signed [N:0] y2_coeff;
    logic signed [N:0] x0_coeff;
    logic signed [N:0] x1_coeff;
    logic signed [N:0] x2_coeff;

    // allpass coefficients
    logic signed [N:0] y1_coeff0 = 0*(2**shift);
    logic signed [N:0] y2_coeff0 = 0*(2**shift);
    logic signed [N:0] x0_coeff0 = 1*(2**shift);
    logic signed [N:0] x1_coeff0 = 0*(2**shift);
    logic signed [N:0] x2_coeff0 = 0*(2**shift);

    // 100 Hz coefficients
    logic signed [N:0] y1_coeff1 = 2127560704; // 1.9814453125*(2**shift);
    logic signed [N:0] y2_coeff1 = -1054081024; // -0.981689453125*(2**shift);
    logic signed [N:0] x0_coeff1 = 1063911424; // 1*0.9908447265625*(2**shift);
    logic signed [N:0] x1_coeff1 = -2127822848; // -2*0.990844726562*(2**shift);
    logic signed [N:0] x2_coeff1 = 1063911424; // 1*0.990844726562*(2**shift);
    
    // 250 Hz coefficients
    logic signed [N:0] y1_coeff2 = 2097676288; // 1.95361328125*(2**shift);
    logic signed [N:0] y2_coeff2 = -1025245184; // -0.954833984375*(2**shift);
    logic signed [N:0] x0_coeff2 = 1049231360; // 1*0.9771728515625*(2**shift);
    logic signed [N:0] x1_coeff2 = -2098462720; // -2*0.9771728515625*(2**shift);
    logic signed [N:0] x2_coeff2 = 1049231360; // 1*0.9771728515625*(2**shift);
    
    // 500 Hz coefficients
    logic signed [N:0] y1_coeff3 = 2046820352; // 1.90625*(2**shift);
    logic signed [N:0] y2_coeff3 = -977272832; // -0.91015625*(2**shift);
    logic signed [N:0] x0_coeff3 = 1025507328; // 1*0.955078125*(2**shift);
    logic signed [N:0] x1_coeff3 = -2051014656; // -2*0.955078125*(2**shift);
    logic signed [N:0] x2_coeff3 = 1025507328; // 1*0.955078125*(2**shift);
    
    // 1 kHz coefficients
    logic signed [N:0] y1_coeff4 = 1946157056; // 1.8125*(2**shift);
    logic signed [N:0] y2_coeff4 = -889192448; // -0.828125*(2**shift);
    logic signed [N:0] x0_coeff4 = 981467136; // 1*0.9140625*(2**shift);
    logic signed [N:0] x1_coeff4 = -1962934272; // -2*0.9140625*(2**shift);
    logic signed [N:0] x2_coeff4 = 981467136; // 1*0.9140625*(2**shift);

    // buffer
    logic signed [N:0] y1;
    logic signed [N:0] y2;
    logic signed [N:0] x0, x0_buffer;
    logic signed [N:0] x1;
    logic signed [N:0] x2;

    // temp output
    logic signed [N:0] yn;


    always_comb begin
        // 16 to 64 bit transfer with sign preservation
        x0_buffer = { {(N-15){highpassIn[15]}}, highpassIn };

        // assign yn to output, clip for 16-bit output
        if (yn > 32767)
            highpassOut = 'b0111111111111111;
        else if (yn < -32767)
            highpassOut = 'b1000000000000000;
        else
            highpassOut = yn;
        
        // determine filter coefficients
        case (filter)
        0 : begin
            y1_coeff = y1_coeff0;
            y2_coeff = y2_coeff0;
            x0_coeff = x0_coeff0;
            x1_coeff = x1_coeff0;
            x2_coeff = x2_coeff0;
        end
        1 : begin
            y1_coeff = y1_coeff1;
            y2_coeff = y2_coeff1;
            x0_coeff = x0_coeff1;
            x1_coeff = x1_coeff1;
            x2_coeff = x2_coeff1;
        end
        2 : begin
            y1_coeff = y1_coeff2;
            y2_coeff = y2_coeff2;
            x0_coeff = x0_coeff2;
            x1_coeff = x1_coeff2;
            x2_coeff = x2_coeff2;
        end
        3 : begin
            y1_coeff = y1_coeff3;
            y2_coeff = y2_coeff3;
            x0_coeff = x0_coeff3;
            x1_coeff = x1_coeff3;
            x2_coeff = x2_coeff3;
        end
        4 : begin
            y1_coeff = y1_coeff4;
            y2_coeff = y2_coeff4;
            x0_coeff = x0_coeff4;
            x1_coeff = x1_coeff4;
            x2_coeff = x2_coeff4;
        end
        default : begin
            y1_coeff = y1_coeff0;
            y2_coeff = y2_coeff0;
            x0_coeff = x0_coeff0;
            x1_coeff = x1_coeff0;
            x2_coeff = x2_coeff0;
        end
        endcase
        
    end


    always_ff @ (negedge clk_48, negedge reset_n) begin
        if (~reset_n)
            yn <= 0;
        else
            yn <= ((y1_coeff*y1)>>>shift) + ((y2_coeff*y2)>>>shift) + ((x0_coeff*x0)>>>shift) + ((x1_coeff*x1)>>>shift) + ((x2_coeff*x2)>>>shift);
    end


    always_ff @ (posedge clk_48, negedge reset_n) begin

        // reset buffer & outputs
        if (~reset_n) begin
            y1 <= 0;
            y2 <= 0;
            x0 <= 0;
            x1 <= 0;
            x2 <= 0;
        end
        else begin
            // rotate buffer
            x2 <= x1;
            x1 <= x0;
            x0 <= x0_buffer;
            y2 <= y1;
            y1 <= yn;
        end

    end

endmodule
