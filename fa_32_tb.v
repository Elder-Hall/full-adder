`timescale 1ns/1ps
module fa32_testbench;

   reg [31:0] in1, in2, i, j;
   reg        cin, k;
   wire        cout, cout_ref;
   wire [31:0] sum, sum_ref;

   fa32 FULL_ADDER(.a(in1), .b(in2), .cin(cin), .sum(sum), .cout(cout));                                                                                                           
   fa32_ref FULL_ADDER_REF(.a(in1), .b(in2), .cin(cin), .sum(sum), .cout(cout));

   initial begin
      $monitor("A = %h B = %h CIN = %b SUM = %h COUT = %b SUM_REF = %h COUT_REF = %b", in1, in2, cin, sum, cout, sum_ref, cout_ref);
      #0

      in1 = 32'h00000000;                                                                                                                                                          
      in2 = 32'h00000000;                                                                                                                                                          
      cin = 1'b0;

      // consider making i, j, k integers                                                                                                                                                                   

      for (i = 32'h00000000; i < 32'h0000000F; i = i + 32'h00000001) begin
         #1
         for (j = 32'h00000000; j < 32'h0000000F; j = j + 32'h00000001) begin
            #1
            in1 = i; in2 = j; cin = 1'b0; // a, b, and cin respectively
            #1
            if (sum != sum_ref)
               $display("Error: sum should be %h, but instead it is %h", sum_ref, sum); // display sums in hex
            if (cout != cout_ref)
               $display("Error: cout should be %b, but instead it is %b", cout_ref, cout); // display carry out in binary
            #1
            cin = 1'b1; // update cin
            #1
            if (sum != sum_ref)
               $display("Error: sum should be %h, but instead it is %h", sum_ref, sum); // display sums in hex
            if (cout != cout_ref)
               $display("Error: cout should be %b, but instead it is %b", cout_ref, cout); // display carry out in binary
            // end
         end
      end

      for (i = 32'hFFFFFFF0; i < 32'hFFFFFFFF; i = i + 32'h00000001) begin
         #1
         for (j = 32'hFFFFFFF0; j < 32'hFFFFFFFF; j = j + 32'h00000001) begin
            #1
            in1 = i; in2 = j; cin = 1'b0; // a, b, and cin respectively
            #1
            if (sum != sum_ref)
               $display("Error: sum should be %h, but instead it is %h", sum_ref, sum); // display sums in hex
            if (cout != cout_ref)
               $display("Error: cout should be %b, but instead it is %b", cout_ref, cout); // display carry out in binary
            #1
            cin = 1'b1; // update cin
            #1
            if (sum != sum_ref)
               $display("Error: sum should be %h, but instead it is %h", sum_ref, sum); // display sums in hex
            if (cout != cout_ref)
               $display("Error: cout should be %b, but instead it is %b", cout_ref, cout); // display carry out in binary
            // end
         end
      end                                                                                                                         

   end // initial begin                                                                                                                                                              
endmodule // fa32_testbench