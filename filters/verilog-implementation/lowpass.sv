module lowpass #( parameter L = 3 ) (
                input logic clk, reset_n,
                input logic [15:0] lowpassIn,
                output logic [31:0] lowpassOut2, // for testing only
                output logic [15:0] lowpassOut3, // for testing only
                output logic [31:0] lowpassOut4, // for testing only
                output logic [15:0] lowpassOut);

    logic [15:0] data [L-1:0];

    // coefficients
    logic [127:0] y1_coeff = 1.8125*1024*1024*1024;
    logic [127:0] y2_coeff = -0.828125*1024*1024*1024;
    logic [127:0] x0_coeff = 1*0.9140625*1024*1024*1024;
    logic [127:0] x1_coeff = -2*0.9140625*1024*1024*1024;
    logic [127:0] x2_coeff = 1*0.9140625*1024*1024*1024;

    // buffer
    logic [127:0] y1;
    logic [127:0] y2;
    logic [127:0] x0;
    logic [127:0] x1;
    logic [127:0] x2;

    // temp output
    logic [127:0] yn;

    // state counter
    logic [1:0] state;


    always_comb begin
        // 16 to 128 bit transfer with sign preservation
        x0 <= { {112{lowpassIn[15]}}, lowpassIn };

        // divide by 2^30 (30 bits) & assign to output
        lowpassOut <= yn >>> 30;
    end
 
    always_ff @ (posedge clk, negedge reset_n) begin

        // reset buffer & outputs
        if (~reset_n) begin
            y1 <= 0;
            y2 <= 0;
            x1 <= 0;
            x2 <= 0;

            yn <= '0;
        end

        else begin

            case (state) begin
                0 : begin
                    // differnce equation
                    yn <= y1_coeff*y1 + y2_coeff*y2 + x0_coeff*x0 + x1_coeff*x1 + x2_coeff*x2;

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
                    y1 <= 0;
                    y2 <= 0;
                    x1 <= 0;
                    x2 <= 0;

                    yn <= '0;
                end
            end

        end
        
    end

endmodule
