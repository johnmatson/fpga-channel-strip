module encodeButton_tb;

    logic [15:0] buttons;
    logic reset_n;
    logic [2:0] freqSelect;
    logic [2:0] lowpassSelect, highpassSelect;

    encodeButton dut_0 (.*);

    initial begin
        reset_n = 0;
        buttons = '1;

        #10ns reset_n = 1;

        for (int i = 0; i<16; i++)
            #5ns buttons = '1 & (~(2**i));
        
        $stop;
    end


endmodule