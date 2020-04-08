// bcit_tb.sv - ELEX 7660 201710 testbench for lab1 decode2.sv
// Ed.Casas 2017-1-9

module decode2_tb ;

   logic [1:0] digit=0 ;
   logic [3:0] ct ;

   decode2 uut0 (.*) ;
   
   initial begin
      for ( int i=0 ; i<=3 ; i++ ) begin
         digit <= i ;
         #1us ;
      end
      $stop ;
   end
   
endmodule
