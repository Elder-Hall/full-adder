module fa32(a, b, cin, sum, cout);
   input [31:0] a, b;
   input        cin;
   output [31:0] sum;
   output        cout;

   reg [32:0]    cout_int;
   genvar        i;

   assign cout_int[0] = cin;

   genvar        i;
   generate
      for (i = 0; i < 32; i = i+1)
         fa adder_i(.a(a[i]), .b(b[i]), .cin(cout_int[i]), .sum(sum[i]), .cout(cout_int[i+1]));
   endgenerate

   assign cout = cout_int[32];

endmodule // fa32