module highpass #( parameter L = 3, N = 63, shift = 30 ) (
                input logic clk_144, reset_n,
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
    logic signed [N:0] y1_coeff1 = 1.9814453125*(2**shift);
    logic signed [N:0] y2_coeff1 = -0.981689453125*(2**shift);
    logic signed [N:0] x0_coeff1 = 1*0.9908447265625*(2**shift);
    logic signed [N:0] x1_coeff1 = -2*0.990844726562*(2**shift);
    logic signed [N:0] x2_coeff1 = 1*0.990844726562*(2**shift);
    
    // 250 Hz coefficients
    logic signed [N:0] y1_coeff2 = 1.95361328125*(2**shift);
    logic signed [N:0] y2_coeff2 = -0.954833984375*(2**shift);
    logic signed [N:0] x0_coeff2 = 1*0.9771728515625*(2**shift);
    logic signed [N:0] x1_coeff2 = -2*0.9771728515625*(2**shift);
    logic signed [N:0] x2_coeff2 = 1*0.9771728515625*(2**shift);
    
    // 500 Hz coefficients
    logic signed [N:0] y1_coeff3 = 1.90625*(2**shift);
    logic signed [N:0] y2_coeff3 = -0.91015625*(2**shift);
    logic signed [N:0] x0_coeff3 = 1*0.955078125*(2**shift);
    logic signed [N:0] x1_coeff3 = -2*0.955078125*(2**shift);
    logic signed [N:0] x2_coeff3 = 1*0.955078125*(2**shift);
    
    // 1 kHz coefficients
    logic signed [N:0] y1_coeff4 = 1.8125*(2**shift);
    logic signed [N:0] y2_coeff4 = -0.828125*(2**shift);
    logic signed [N:0] x0_coeff4 = 1*0.9140625*(2**shift);
    logic signed [N:0] x1_coeff4 = -2*0.9140625*(2**shift);
    logic signed [N:0] x2_coeff4 = 1*0.9140625*(2**shift);

    // buffer
    logic signed [N:0] y1;
    logic signed [N:0] y2;
    logic signed [N:0] x0, x0_buffer;
    logic signed [N:0] x1;
    logic signed [N:0] x2;

    // temp output
    logic signed [N:0] yn;

    // state counter
    logic [1:0] state;


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
    
 
    always_ff @ (posedge clk_144, negedge reset_n) begin

        // reset buffer & outputs
        if (~reset_n) begin
            y1 <= 0;
            y2 <= 0;
            x0 <= 0;
            x1 <= 0;
            x2 <= 0;

            yn <= '0;

            state <= '0;
        end

        else begin

            case (state)
                0 : begin
                    // difference equation
                    yn <= ((y1_coeff*y1)>>>shift) + ((y2_coeff*y2)>>>shift) + ((x0_coeff*x0)>>>shift) + ((x1_coeff*x1)>>>shift) + ((x2_coeff*x2)>>>shift);
                    
                    state <= 1;
                end
                1 : begin
                    // rotate buffer 2
                    x2 <= x1;
                    y2 <= y1;
                    
                    state <= 2;
                end
                2 : begin
                    // rotate buffer 1
                    x1 <= x0;
                    y1 <= yn;

                    x0 <= x0_buffer;

                    state <= 0;
                end
                default : begin
                    // reset
                    y1 <= 0;
                    y2 <= 0;
                    x1 <= 0;
                    x2 <= 0;
                    yn <= '0;
                    state <= '0;
                end
            endcase

        end
        
    end

endmodule
