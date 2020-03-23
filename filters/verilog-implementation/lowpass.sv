module lowpass #( parameter L = 3 ) (
                input logic clk, reset_n,
                input logic [15:0] lowpassIn,
                output logic [31:0] lowpassOut2, // for testing only
                output logic [15:0] lowpassOut3, // for testing only
                output logic [31:0] lowpassOut4, // for testing only
                output logic [15:0] lowpassOut);

    logic [15:0] data [L-1:0];

    // coefficients
    logic [31:0] y1_coeff = 1.982*1024;
    logic [31:0] y2_coeff = -0.982*1024;
    logic [31:0] x0_coeff = 1*0.991*1024;
    logic [31:0] x1_coeff = 2*0.991*1024;
    logic [31:0] x2_coeff = 1*0.991*1024;

    // buffer
    logic [31:0] y1;
    logic [31:0] y2;
    logic [31:0] x0;
    logic [31:0] x1;
    logic [31:0] x2;

    // temp output
    logic [31:0] yn;

    always_ff @ (posedge clk, negedge reset_n) begin

        // reset buffer & outputs
        if (~reset_n) begin
            y1 <= 0;
            y2 <= 0;
            x0 <= 0;
            x1 <= 0;
            x2 <= 0;

            yn <= '0;
        end

        else begin
            // FIR buffer - NOT USED FOR IIR
            // for (int i = 0; i < L-1; i++)
            //     data[i] <= data[i+1];
            // data[L-1] <= lowpassIn;

            // 16 to 32 bit transfer with sign preservation
            x0 <= { {16{lowpassIn[15]}}, lowpassIn };

            // differnce equation
            yn <= y1_coeff*y1 + y2_coeff*y2 + x0_coeff*x0 + x1_coeff*x1 + x2_coeff*x2;

            // rotate buffer
            x2 <= x1;
            x1 <= x0;
            y2 <= y1;
            y1 <= yn;

            lowpassOut2 <= yn; // testing

            lowpassOut3 <= yn / 1024; // testing

            lowpassOut4 <= x0_coeff*x0 + x1_coeff*x1; // testing

            // divide by 1024 (10 bits) & assign to output
            lowpassOut <= yn >>> 10;
        end
        
    end

endmodule
