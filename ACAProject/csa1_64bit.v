//.......................................half-adder module.
`timescale 1ns/1ps

module half_adder(a, b, sum1, cout1);
input a, b;
output sum1, cout1;

assign sum1= a^b;
assign cout1= a&b;

endmodule

//.......................................full-adder module

module full_adder(a, b, sum2, cout2, cin);
input a, b, cin;
output sum2, cout2;
//wire [2:0] r;

assign sum2= a^b^cin;
assign cout2= (a&b) | ((a^b)&cin);

endmodule

//........................................4-bit adder using four 1-bit full adders.

module four_1bit(a, b, sum3, cout3, cin);
input [3:0] a, b;
input cin;
output [3:0] sum3;
output cout3;
wire [2:0] r;

full_adder fa1 (a[0], b[0], sum3[0], r[0], cin);
full_adder fa2 (a[1], b[1], sum3[1], r[1], r[0]);
full_adder fa3 (a[2], b[2], sum3[2], r[2], r[1]);
full_adder fa4 (a[3], b[3], sum3[3], cout3, r[2]);

endmodule

//.......................................4-bit adder using half adder and fulladder combination.

module four_2bit(a, b, sum4, cout4);
input [3:0] a, b;
output [3:0] sum4;
output cout4;
wire [2:0] r;

half_adder ha1 (a[0], b[0], sum4[0], r[0]);
full_adder fa1 (a[1], b[1], sum4[1], r[1], r[0]);
full_adder fa2 (a[2], b[2], sum4[2], r[2], r[1]);
full_adder fa3 (a[3], b[3], sum4[3], cout4, r[2]);

 
endmodule
//......................................mux module 

module mux(s0, s1, c0, c1, sel, sum_m, cout_m);
input sel;
input [3:0] s0, s1;
input c0, c1;
output [3:0] sum_m;
output cout_m;

assign sum_m= sel? s1 : s0;
assign cout_m= sel? c1 : c0;

endmodule

//......................................64-bit adder with mux.

module csa1_64bit(op1, op2, sum, crout, reset, clock); //inputs are j and k.
input [63:0] op1, op2;
input reset, clock;
output reg [63:0] sum;
wire [63:0] sumf;
wire coutf;
output reg crout;
wire [59:0] x, y;
reg [63:0] a, b;
wire [14:0] w, z;
wire [14:0] cout_m; 


always @(posedge clock or negedge reset)
begin
 if (reset==0)
  begin
   sum<=0;
   a<=0;
   b<=0; 
   crout<=0; 
  end
 else
  begin
   a<=op1;
   $display("op1=%h", a);
   b<=op2;
   $display("op2=%h", b);
   sum<=sumf;
   $display("sum=%h", sumf);
   crout<=coutf;
   $display("crout=%h", coutf);

  end
end

four_2bit fa1 (a[3:0], b[3:0], sumf[3:0], cout_m[0]);

four_1bit fa2 (a[7:4], b[7:4], x[3:0], w[0], 1'b1);  //starting with full adder 
four_2bit fa3 (a[7:4], b[7:4], y[3:0], z[0]);  //starting with half adder.
mux m1 (y[3:0], x[3:0], z[0], w[0], cout_m[0], sumf[7:4], cout_m[1]);  // ...........................................correct code.


four_1bit fa4 (a[11:8], b[11:8], x[7:4], w[1], 1'b1);  //starting with full adder 
four_2bit fa5 (a[11:8], b[11:8], y[7:4], z[1]);  //starting with half adder.
mux m2 (y[7:4], x[7:4], z[1], w[1], cout_m[1], sumf[11:8], cout_m[2]); //.....................................correct code.


four_1bit fa6 (a[15:12], b[15:12], x[11:8], w[2], 1'b1);  //starting with full adder 
four_2bit fa7 (a[15:12], b[15:12], y[11:8], z[2]);  //starting with half adder.
mux m3 (y[11:8], x[11:8], z[2], w[2], cout_m[2], sumf[15:12], cout_m[3]);  //......................................correct code.\

//................................................................................................................................................


four_1bit fa8 (a[19:16], b[19:16], x[15:12], w[3], 1'b1);  //starting with full adder 
four_2bit fa9 (a[19:16], b[19:16], y[15:12], z[3]);  //starting with half adder.
mux m4 (y[15:12], x[15:12], z[3], w[3], cout_m[3], sumf[19:16], cout_m[4]);



four_1bit fa10 (a[23:20], b[23:20], x[19:16], w[4], 1'b1);  //starting with full adder 
four_2bit fa11 (a[23:20], b[23:20], y[19:16], z[4]);  //starting with half adder.
mux m5 (y[19:16], x[19:16], z[4], w[4], cout_m[4], sumf[23:20], cout_m[5]);


four_1bit fa12 (a[27:24], b[27:24], x[23:20], w[5], 1'b1);  //starting with full adder 
four_2bit fa13 (a[27:24], b[27:24], y[23:20], z[5]);  //starting with half adder.
mux m6 (y[23:20], x[23:20], z[5], w[5], cout_m[5], sumf[27:24], cout_m[6]);



four_1bit fa14 (a[31:28], b[31:28], x[27:24], w[6], 1'b1);  //starting with full adder 
four_2bit fa15 (a[31:28], b[31:28], y[27:24], z[6]);  //starting with half adder.
mux m7 (y[27:24], x[27:24], z[6], w[6], cout_m[6], sumf[31:28], cout_m[7]);


four_1bit fa16 (a[35:32], b[35:32], x[31:28], w[7], 1'b1);  //starting with full adder 
four_2bit fa17 (a[35:32], b[35:32], y[31:28], z[7]);  //starting with half adder.
mux m8 (y[31:28], x[31:28], z[7], w[7], cout_m[7], sumf[35:32], cout_m[8]);



four_1bit fa18 (a[39:36], b[39:36], x[35:32], w[8], 1'b1);  //starting with full adder 
four_2bit fa19 (a[39:36], b[39:36], y[35:32], z[8]);  //starting with half adder.
mux m9 (y[35:32], x[35:32], z[8], w[8], cout_m[8], sumf[39:36], cout_m[9]);


four_1bit fa20 (a[43:40], b[43:40], x[39:36], w[9], 1'b1);  //starting with full adder 
four_2bit fa21 (a[43:40], b[43:40], y[39:36], z[9]);  //starting with half adder.
mux m10 (y[39:36], x[39:36], z[9], w[9], cout_m[9], sumf[43:40], cout_m[10]);


four_1bit fa22 (a[47:44], b[47:44], x[43:40], w[10], 1'b1);  //starting with full adder 
four_2bit fa23 (a[47:44], b[47:44], y[43:40], z[10]);  //starting with half adder.
mux m11 (y[43:40], x[43:40], z[10], w[10], cout_m[10], sumf[47:44], cout_m[11]);


four_1bit fa24 (a[51:48], b[51:48], x[47:44], w[11], 1'b1);  //starting with full adder 
four_2bit fa25 (a[51:48], b[51:48], y[47:44], z[11]);  //starting with half adder.
mux m12 (y[47:44], x[47:44], z[11], w[11], cout_m[11], sumf[51:48], cout_m[12]);


four_1bit fa26 (a[55:52], b[55:52], x[51:48], w[12], 1'b1);  //starting with full adder 
four_2bit fa27 (a[55:52], b[55:52], y[51:48], z[12]);  //starting with half adder.
mux m13 (y[51:48], x[51:48], z[12], w[12], cout_m[12], sumf[55:52], cout_m[13]);


four_1bit fa28 (a[59:56], b[59:56], x[55:52], w[13], 1'b1);  //starting with full adder 
four_2bit fa29 (a[59:56], b[59:56], y[55:52], z[13]);  //starting with half adder.
mux m14 (y[55:52], x[55:52], z[13], w[13], cout_m[13], sumf[59:56], cout_m[14]);


four_1bit fa30 (a[63:60], b[63:60], x[59:56], w[14], 1'b1);  //starting with full adder 
four_2bit fa31 (a[63:60], b[63:60], y[59:56], z[14]);  //starting with half adder.
mux m15 (y[59:56], x[59:56], z[14], w[14], cout_m[14], sumf[63:60], coutf);  


endmodule 