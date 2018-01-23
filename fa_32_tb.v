`timescale 1ns/1ps
module testbench
   reg [31:0] in1, in2;
   reg        carry_in;

   wire       sum, cout;

   fa32 FULL_ADDER(.a(in1), .b(in2), .cin(cin), .sum(sum), .cout(cout));

   initial begin
      $monitor("A = %b B = %b CIN=%b SUM = %b COUT=%b", in1, in2, cin, sum, cout);

      in1 = 32'h00000001;
      in2 = 32'h00000000;
      cin = 0;

      #1 in1 = 32'h00000001; in2 = 32'h00000000; cin = 1;

   end // initial begin                                                                                  
endmodule // testbench