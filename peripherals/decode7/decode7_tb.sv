// bcit_tb.sv - ELEX 7660 201710 testbench for lab1 decode7.sv
// Ed.Casas 2017-1-9

module decode7_tb ;

   logic [3:0] num;
   logic decimal;
   logic [7:0] leds;

   decode7 uut2 (.*);
   
   initial begin
      decimal = 0;
      for ( int i=0 ; i<=9 ; i++ ) begin
         num <= i ;
         #1us ;
      end

      decimal = 1;
      for ( int i=0 ; i<=9 ; i++ ) begin
         num <= i ;
         #1us ;
      end
      
      $stop ;
   end
   
endmodule
