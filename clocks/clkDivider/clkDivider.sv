module clkDivider #( parameter divide = 3 ) (
                    input logic reset_n,
                    input logic clkIn,
                    output logic clkOut );

    logic [1:0] count;

    always_ff @ ( posedge clkIn, negedge clkIn, negedge reset_n ) begin
        if (~reset_n) begin
            clkOut <= 0;
            count <= 0;
        end
        else begin
            if (count >= divide - 1) begin
                count <= 0;
                clkOut <= ~clkOut;
            end
            else
                count <= count + 1;
        end
    end
endmodule