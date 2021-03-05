// bcit_tb.sv - ELEX 7660 201710 testbench for lab1 decode7.sv
// Ed.Casas 2017-1-9

module decodeButton_tb ;

   logic [3:0] buttonNum;
   logic [15:0] buttons;

   decodeButton dut_0 (.*);
   
   initial begin
      for ( int i=0 ; i<16 ; i++) begin
         buttonNum <= i ;
         #1us ;
      end
      $stop ;
   end
   
endmodule
