// bcit_tb.sv - ELEX 7660 201710 testbench for lab1 bcitid.sv
// Ed.Casas 2017-1-9

module displayMux_tb ;

   logic [1:0] digit;
   logic [3:0] num2, num1, num0;
   logic neg;

   logic decimal;
   logic [3:0] num;

   displayMux dut_0 (.*);

   initial begin
      for (int i1=0; i1<4; i1++) begin
         digit = i1;
         for (int i2=0; i2<2; i2++) begin
            neg = i2;
            for (int i3=0; i3<10; i3++) begin
               num2 = i3;
               #1us;
            end
            for (int i3=0; i3<10; i3++) begin
               num1 = i3;
               #1us;
            end
            for (int i3=0; i3<10; i3++) begin
               num0 = i3;
               #1us;
            end
         end
      end

      $stop;
   end
   
endmodule
