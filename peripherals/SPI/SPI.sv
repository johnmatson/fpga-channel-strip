module SPI (

    // SPI I/O
    input logic SCLK, CS, MOSI,
    output logic MISO,
    
    // local I/O
    input logic clk_48, reset_n,
    input logic signed [15:0] left, right,
    output logic signed [63:0] hp_y1_coeff, hp_y2_coeff, hp_x0_coeff, hp_x1_coeff, hp_x2_coeff,
    output logic signed [63:0] lp_y1_coeff, lp_y2_coeff, lp_x0_coeff, lp_x1_coeff, lp_x2_coeff);


    // four-phase handshake signals
    logic req, new_req, last_req;
    logic xack_pipe, old_ack;
    logic busy, valid_data;
    logic [15:0] left_xfer, right_xfer;
    logic [15:0] left_safe, right_safe;

    logic [7:0] cmd;
    logic [7:0] count;


    // read MOSI data
    always_ff @ (posedge SCLK, negedge reset_n) begin
        if (~reset_n) begin
            cmd <= 0;
            count <= 0;
        end
        else begin
            // read command byte
            if (~CS && count < 8) begin
            cmd[7-count] <= MOSI;
            count <= count + 1;
            end
        end
    end

    // write MISO data
    always_ff @ (negedge SCLK, negedge reset_n) begin
        if (~reset_n) begin
            MISO <= 0;
        end
        else begin
            // transmit left sample
            if (count >= 8 && count < 24 && cmd == 1) begin
                MISO <= left[23-count];
                count <= count + 1;
            end
            // transmit right sample
            else if (count >= 24 && count < 40 && cmd == 1) begin
                MISO <= right[39-count];
                count <= count + 1;
            end
        end
    end

    // reset after transfer cycle
    always_ff @ (posedge CS) begin
        cmd <= 0;
        count <= 0;
    end

    
    /*
    /// CLOCK DOMAIN CROSSING HANDSHAKE ///
    the following logic is based on this CDC tutorial:
    https://zipcpu.com/blog/2017/10/20/cdc.html
    */

    // copy data to transfer region
    always_ff @(posedge clk_48, negedge reset_n) begin
        if (~reset_n) begin
            left_xfer <= 0;
            right_xfer <= 0;
            valid_data <= 0;
        end
	    else begin
            if ((!busy)&&(!valid_data)) begin
                left_xfer <= left;
                right_xfer <= right;
                valid_data <= 1'b1;
            end
            else if (old_ack)
                valid_data <= 1'b0;
        end
    end

    // assert req to initiate transfer
    always @(posedge clk_48, negedge reset_n) begin
        if (~reset_n) begin
            req <= 0;
        end
        else begin
            if ((!busy)&&(valid_data))
                req <= 1'b1;
            else if (old_ack)
                req <= 1'b0;
        end
    end
    assign	busy = (req)||(old_ack);

    // copy data into SCLK region
    always_ff @(posedge SCLK, negedge reset_n) begin
        if (~reset_n) begin
            left_safe <= 0;
            right_safe <= 0;
        end
        else if ((!last_req)&&(new_req)) begin
            left_safe <= left_xfer;
            right_safe <= right_xfer;
        end
    end

    // pipe last_req through to old_ack to reduce metastability
    always_ff @(posedge clk_48, negedge reset_n) begin
        if (~reset_n)
            { old_ack, xack_pipe } <= { 0, 0 };
        else
            { old_ack, xack_pipe } <= { xack_pipe, last_req };
    end

    // pipe req to new_req to last_req to track transfer timeline
    always_ff @(posedge SCLK, negedge reset_n) begin
        if (~reset_n)
            { last_req, new_req } <= { 0, 0 };
        else
            { last_req, new_req } <= { new_req, req };
    end

endmodule