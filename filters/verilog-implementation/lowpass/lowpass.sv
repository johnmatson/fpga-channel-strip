module lowpass #( parameter L = 3, N = 63, shift = 30 ) (
                input logic clk_144, reset_n,
                input logic [2:0] filter,
                input logic signed [15:0] lowpassIn,
                output logic signed [15:0] lowpassOut);

    // coefficients
    logic signed [N:0] y1_coeff;
    logic signed [N:0] y2_coeff;
    logic signed [N:0] x0_coeff;
    logic signed [N:0] x1_coeff;
    logic signed [N:0] x2_coeff;

    // 1 kHz coefficients
    logic signed [N:0] y1_coeff0 = 1.8125*(2**shift);
    logic signed [N:0] y2_coeff0 = -0.828125*(2**shift);
    logic signed [N:0] x0_coeff0 = 1*0.00390625*(2**shift);
    logic signed [N:0] x1_coeff0 = 2*0.00390625*(2**shift);
    logic signed [N:0] x2_coeff0 = 1*0.00390625*(2**shift);
    
    // 2.5 kHz coefficients
    logic signed [N:0] y1_coeff1 = 1.546875*(2**shift);
    logic signed [N:0] y2_coeff1 = -0.625*(2**shift);
    logic signed [N:0] x0_coeff1 = 1*0.021728515625*(2**shift);
    logic signed [N:0] x1_coeff1 = 2*0.021728515625*(2**shift);
    logic signed [N:0] x2_coeff1 = 1*0.021728515625*(2**shift);
    
    // 5 kHz coefficients
    logic signed [N:0] y1_coeff2 = 1.109375*(2**shift);
    logic signed [N:0] y2_coeff2 = -0.390625*(2**shift);
    logic signed [N:0] x0_coeff2 = 1*0.072265625*(2**shift);
    logic signed [N:0] x1_coeff2 = 2*0.072265625*(2**shift);
    logic signed [N:0] x2_coeff2 = 1*0.072265625*(2**shift);

    // 10 kHz coefficients
    logic signed [N:0] y1_coeff3 = 0.3125*(2**shift);
    logic signed [N:0] y2_coeff3 = -0.1875*(2**shift);
    logic signed [N:0] x0_coeff3 = 1*0.220703125*(2**shift);
    logic signed [N:0] x1_coeff3 = 2*0.220703125*(2**shift);
    logic signed [N:0] x2_coeff3 = 1*0.220703125*(2**shift);
    
    /*/ 1 kHz coefficients
    logic signed [N:0] y1_coeff3 = 1.8125*(2**shift);
    logic signed [N:0] y2_coeff3 = -0.828125*(2**shift);
    logic signed [N:0] x0_coeff3 = 1*0.9140625*(2**shift);
    logic signed [N:0] x1_coeff3 = -2*0.9140625*(2**shift);
    logic signed [N:0] x2_coeff3 = 1*0.9140625*(2**shift);*/

    // buffer
    logic signed [N:0] y1;
    logic signed [N:0] y2;
    logic signed [N:0] x0;
    logic signed [N:0] x1;
    logic signed [N:0] x2;

    // temp output
    logic signed [N:0] yn;

    // state counter
    logic [1:0] state;


    always_comb begin
        // 16 to 64 bit transfer with sign preservation
        x0 = { {(N-15){lowpassIn[15]}}, lowpassIn };

        // assign yn to output
        lowpassOut = yn;
        
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
        endcase
        
    end
    
 
    always_ff @ (posedge clk_144, negedge reset_n) begin

        // reset buffer & outputs
        if (~reset_n) begin
            y1 <= 0;
            y2 <= 0;
            x1 <= 0;
            x2 <= 0;

            yn <= '0;

            state <= '0;
        end

        else begin

            case (state)
                0 : begin
                    // differnce equation
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
