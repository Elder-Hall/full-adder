module fa32_ref(a, b, cin, sum, cout);
   
   input [31:0] a,b;
   input cin;
   output [31:0] sum;
   output cout;

   assign {cout, sum} = a + b + cin;

endmodule // fa32_ref