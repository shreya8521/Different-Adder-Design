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

module four_1bit (a, b, sum3, cout3, cin);
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

module four_2bit (a, b, sum4, cout4);
input [3:0] a, b;
output [3:0] sum4;
output cout4;
wire [2:0] r;

half_adder ha1 (a[0], b[0], sum4[0], r[0]);
full_adder fa1 (a[1], b[1], sum4[1], r[1], r[0]);
full_adder fa2 (a[2], b[2], sum4[2], r[2], r[1]);
full_adder fa3 (a[3], b[3], sum4[3], cout4, r[2]);

 
endmodule
//......................................mux module for 4-bit

module mux_4(s0, s1, c0, c1, sel, sum_m, cout_m);
input sel;
input [3:0] s0, s1;
input c0, c1;
output [3:0] sum_m;
output cout_m;

assign sum_m= sel? s1 : s0;
assign cout_m= sel? c1 : c0;

endmodule

//...........................................mux module for 5-bit
module mux_5(s0, s1, c0, c1, sel, sum_m, cout_m);
input sel;
input [4:0] s0, s1;
input c0, c1;
output [4:0] sum_m;
output cout_m;

assign sum_m= sel? s1 : s0;
assign cout_m= sel? c1 : c0;

endmodule


//...............................................mux module for 6-bit

module mux_6(s0, s1, c0, c1, sel, sum_m, cout_m);
input sel;
input [5:0] s0, s1;
input c0, c1;
output [5:0] sum_m;
output cout_m;

assign sum_m= sel? s1 : s0;
assign cout_m= sel? c1 : c0;

endmodule

//...............................................mux module for 7-bit.
module mux_7(s0, s1, c0, c1, sel, sum_m, cout_m);
input sel;
input [6:0] s0, s1;
input c0, c1;
output [6:0] sum_m;
output cout_m;

assign sum_m= sel? s1 : s0;
assign cout_m= sel? c1 : c0;

endmodule

//...................................................mux module for 8-bit

module mux_8(s0, s1, c0, c1, sel, sum_m, cout_m);
input sel;
input [7:0] s0, s1;
input c0, c1;
output [7:0] sum_m;
output cout_m;

assign sum_m= sel? s1 : s0;
assign cout_m= sel? c1 : c0;

endmodule

//.........................................................mux module for 9-bit

module mux_9(s0, s1, c0, c1, sel, sum_m, cout_m);
input sel;
input [8:0] s0, s1;
input c0, c1;
output [8:0] sum_m;
output cout_m;

assign sum_m= sel? s1 : s0;
assign cout_m= sel? c1 : c0;

endmodule

//.......................................................mux module for 10-bit

module mux_10(s0, s1, c0, c1, sel, sum_m, cout_m);
input sel;
input [9:0] s0, s1;
input c0, c1;
output [9:0] sum_m;
output cout_m;

assign sum_m= sel? s1 : s0;
assign cout_m= sel? c1 : c0;

endmodule

//.........................................................mux module for 11-bit

module mux_11(s0, s1, c0, c1, sel, sum_m, cout_m);
input sel;
input [10:0] s0, s1;
input c0, c1;
output [10:0] sum_m;
output cout_m;

assign sum_m= sel? s1 : s0;
assign cout_m= sel? c1 : c0;

endmodule


//......................................extra modules for unequal bits.

module four5_1bit (a, b, sum5_1, cout5_1, cin);
input [4:0] a, b;
input cin;
output [4:0] sum5_1;
output cout5_1;
wire [3:0] r;

full_adder fa1 (a[0], b[0], sum5_1[0], r[0], cin);
full_adder fa2 (a[1], b[1], sum5_1[1], r[1], r[0]);
full_adder fa3 (a[2], b[2], sum5_1[2], r[2], r[1]);
full_adder fa4 (a[3], b[3], sum5_1[3], r[3], r[2]);
full_adder fa5 (a[4], b[4], sum5_1[4], cout5_1, r[3]);

endmodule

module four5_0bit (a, b, sum5_0, cout5_0);
input [4:0] a, b;
output [4:0] sum5_0;
output cout5_0;
wire [3:0] r;

half_adder ha1 (a[0], b[0], sum5_0[0], r[0]);
full_adder fa1 (a[1], b[1], sum5_0[1], r[1], r[0]);
full_adder fa2 (a[2], b[2], sum5_0[2], r[2], r[1]);
full_adder fa3 (a[3], b[3], sum5_0[3], r[3], r[2]);
full_adder fa5 (a[4], b[4], sum5_0[4], cout5_0, r[3]);

 
endmodule

//......................................................................... 6-bit module

module four6_1bit (a, b, sum6_1, cout6_1, cin);
input [5:0] a, b;
input cin;
output [5:0] sum6_1;
output cout6_1;
wire [4:0] r;

full_adder fa1 (a[0], b[0], sum6_1[0], r[0], cin);
full_adder fa2 (a[1], b[1], sum6_1[1], r[1], r[0]);
full_adder fa3 (a[2], b[2], sum6_1[2], r[2], r[1]);
full_adder fa4 (a[3], b[3], sum6_1[3], r[3], r[2]);
full_adder fa5 (a[4], b[4], sum6_1[4], r[4], r[3]);
full_adder fa6 (a[5], b[5], sum6_1[5], cout6_1, r[4]);

endmodule

module four6_0bit (a, b, sum6_0, cout6_0);
input [5:0] a, b;
output [5:0] sum6_0;
output cout6_0;
wire [4:0] r;

half_adder ha1 (a[0], b[0], sum6_0[0], r[0]);
full_adder fa1 (a[1], b[1], sum6_0[1], r[1], r[0]);
full_adder fa2 (a[2], b[2], sum6_0[2], r[2], r[1]);
full_adder fa3 (a[3], b[3], sum6_0[3], r[3], r[2]);
full_adder fa4 (a[4], b[4], sum6_0[4], r[4], r[3]);
full_adder fa5 (a[5], b[5], sum6_0[5], cout6_0, r[4]);

 
endmodule

//.......................................7 bit module

module four7_1bit (a, b, sum7_1, cout7_1, cin);
input [6:0] a, b;
input cin;
output [6:0] sum7_1;
output cout7_1;
wire [5:0] r;

full_adder fa1 (a[0], b[0], sum7_1[0], r[0], cin);
full_adder fa2 (a[1], b[1], sum7_1[1], r[1], r[0]);
full_adder fa3 (a[2], b[2], sum7_1[2], r[2], r[1]);
full_adder fa4 (a[3], b[3], sum7_1[3], r[3], r[2]);
full_adder fa5 (a[4], b[4], sum7_1[4], r[4], r[3]);
full_adder fa6 (a[5], b[5], sum7_1[5], r[5], r[4]);
full_adder fa7 (a[6], b[6], sum7_1[6], cout7_1, r[5]);

endmodule

module four7_0bit (a, b, sum7_0, cout7_0);
input [6:0] a, b;
output [6:0] sum7_0;
output cout7_0;
wire [5:0] r;

half_adder ha1 (a[0], b[0], sum7_0[0], r[0]);
full_adder fa2 (a[1], b[1], sum7_0[1], r[1], r[0]);
full_adder fa3 (a[2], b[2], sum7_0[2], r[2], r[1]);
full_adder fa4 (a[3], b[3], sum7_0[3], r[3], r[2]);
full_adder fa5 (a[4], b[4], sum7_0[4], r[4], r[3]);
full_adder fa6 (a[5], b[5], sum7_0[5], r[5], r[4]);
full_adder fa7 (a[6], b[6], sum7_0[6], cout7_0, r[5]);

endmodule

//..................................................8-bit module

module four8_1bit (a, b, sum8_1, cout8_1, cin);
input [7:0] a, b;
input cin;
output [7:0] sum8_1;
output cout8_1;
wire [6:0] r;

full_adder fa1 (a[0], b[0], sum8_1[0], r[0], cin);
full_adder fa2 (a[1], b[1], sum8_1[1], r[1], r[0]);
full_adder fa3 (a[2], b[2], sum8_1[2], r[2], r[1]);
full_adder fa4 (a[3], b[3], sum8_1[3], r[3], r[2]);
full_adder fa5 (a[4], b[4], sum8_1[4], r[4], r[3]);
full_adder fa6 (a[5], b[5], sum8_1[5], r[5], r[4]);
full_adder fa7 (a[6], b[6], sum8_1[6], r[6], r[5]);
full_adder fa8 (a[7], b[7], sum8_1[7], cout8_1, r[6]);

endmodule



module four8_0bit (a, b, sum8_0, cout8_0);
input [7:0] a, b;
output [7:0] sum8_0;
output cout8_0;
wire [6:0] r;

half_adder ha1 (a[0], b[0], sum8_0[0], r[0]);
full_adder fa2 (a[1], b[1], sum8_0[1], r[1], r[0]);
full_adder fa3 (a[2], b[2], sum8_0[2], r[2], r[1]);
full_adder fa4 (a[3], b[3], sum8_0[3], r[3], r[2]);
full_adder fa5 (a[4], b[4], sum8_0[4], r[4], r[3]);
full_adder fa6 (a[5], b[5], sum8_0[5], r[5], r[4]);
full_adder fa7 (a[6], b[6], sum8_0[6], r[6], r[5]);
full_adder fa8 (a[7], b[7], sum8_0[7], cout8_0, r[6]);

endmodule

//...................................................9-bit module

module four9_1bit (a, b, sum9_1, cout9_1, cin);
input [8:0] a, b;
input cin;
output [8:0] sum9_1;
output cout9_1;
wire [7:0] r;

full_adder fa1 (a[0], b[0], sum9_1[0], r[0], cin);
full_adder fa2 (a[1], b[1], sum9_1[1], r[1], r[0]);
full_adder fa3 (a[2], b[2], sum9_1[2], r[2], r[1]);
full_adder fa4 (a[3], b[3], sum9_1[3], r[3], r[2]);
full_adder fa5 (a[4], b[4], sum9_1[4], r[4], r[3]);
full_adder fa6 (a[5], b[5], sum9_1[5], r[5], r[4]);
full_adder fa7 (a[6], b[6], sum9_1[6], r[6], r[5]);
full_adder fa8 (a[7], b[7], sum9_1[7], r[7], r[6]);
full_adder fa9 (a[8], b[8], sum9_1[8], cout9_1, r[7]);

endmodule


module four9_0bit (a, b, sum9_0, cout9_0);
input [8:0] a, b;
output [8:0] sum9_0;
output cout9_0;
wire [7:0] r;

half_adder ha1 (a[0], b[0], sum9_0[0], r[0]);
full_adder fa2 (a[1], b[1], sum9_0[1], r[1], r[0]);
full_adder fa3 (a[2], b[2], sum9_0[2], r[2], r[1]);
full_adder fa4 (a[3], b[3], sum9_0[3], r[3], r[2]);
full_adder fa5 (a[4], b[4], sum9_0[4], r[4], r[3]);
full_adder fa6 (a[5], b[5], sum9_0[5], r[5], r[4]);
full_adder fa7 (a[6], b[6], sum9_0[6], r[6], r[5]);
full_adder fa8 (a[7], b[7], sum9_0[7], r[7], r[6]);
full_adder fa9 (a[8], b[8], sum9_0[8], cout9_0, r[7]);

endmodule

//...............................................................10 bit module

module four10_1bit (a, b, sum10_1, cout10_1, cin);
input [9:0] a, b;
input cin;
output [9:0] sum10_1;
output cout10_1;
wire [8:0] r;

full_adder fa1 (a[0], b[0], sum10_1[0], r[0], cin);
full_adder fa2 (a[1], b[1], sum10_1[1], r[1], r[0]);
full_adder fa3 (a[2], b[2], sum10_1[2], r[2], r[1]);
full_adder fa4 (a[3], b[3], sum10_1[3], r[3], r[2]);
full_adder fa5 (a[4], b[4], sum10_1[4], r[4], r[3]);
full_adder fa6 (a[5], b[5], sum10_1[5], r[5], r[4]);
full_adder fa7 (a[6], b[6], sum10_1[6], r[6], r[5]);
full_adder fa8 (a[7], b[7], sum10_1[7], r[7], r[6]);
full_adder fa9 (a[8], b[8], sum10_1[8], r[8], r[7]);
full_adder fa10 (a[9], b[9], sum10_1[9], cout10_1, r[8]);

endmodule



module four10_0bit (a, b, sum10_0, cout10_0);
input [9:0] a, b;
output [9:0] sum10_0;
output cout10_0;
wire [8:0] r;


half_adder ha1 (a[0], b[0], sum10_0[0], r[0]);
full_adder fa2 (a[1], b[1], sum10_0[1], r[1], r[0]);
full_adder fa3 (a[2], b[2], sum10_0[2], r[2], r[1]);
full_adder fa4 (a[3], b[3], sum10_0[3], r[3], r[2]);
full_adder fa5 (a[4], b[4], sum10_0[4], r[4], r[3]);
full_adder fa6 (a[5], b[5], sum10_0[5], r[5], r[4]);
full_adder fa7 (a[6], b[6], sum10_0[6], r[6], r[5]);
full_adder fa8 (a[7], b[7], sum10_0[7], r[7], r[6]);
full_adder fa9 (a[8], b[8], sum10_0[8], r[8], r[7]);
full_adder fa10 (a[9], b[9], sum10_0[9], cout10_0, r[8]);

endmodule

//.................................................11-bit module


module four11_1bit (a, b, sum11_1, cout11_1, cin);
input [10:0] a, b;
input cin;
output [10:0] sum11_1;
output cout11_1;
wire [9:0] r;

full_adder fa1 (a[0], b[0], sum11_1[0], r[0], cin);
full_adder fa2 (a[1], b[1], sum11_1[1], r[1], r[0]);
full_adder fa3 (a[2], b[2], sum11_1[2], r[2], r[1]);
full_adder fa4 (a[3], b[3], sum11_1[3], r[3], r[2]);
full_adder fa5 (a[4], b[4], sum11_1[4], r[4], r[3]);
full_adder fa6 (a[5], b[5], sum11_1[5], r[5], r[4]);
full_adder fa7 (a[6], b[6], sum11_1[6], r[6], r[5]);
full_adder fa8 (a[7], b[7], sum11_1[7], r[7], r[6]);
full_adder fa9 (a[8], b[8], sum11_1[8], r[8], r[7]);
full_adder fa10 (a[9], b[9], sum11_1[9], r[9], r[8]);
full_adder fa11 (a[10], b[10], sum11_1[10], cout11_1, r[9]);

endmodule


module four11_0bit (a, b, sum11_0, cout11_0);
input [10:0] a, b;
output [10:0] sum11_0;
output cout11_0;
wire [9:0] r;

half_adder ha1 (a[0], b[0], sum11_0[0], r[0]);
full_adder fa2 (a[1], b[1], sum11_0[1], r[1], r[0]);
full_adder fa3 (a[2], b[2], sum11_0[2], r[2], r[1]);
full_adder fa4 (a[3], b[3], sum11_0[3], r[3], r[2]);
full_adder fa5 (a[4], b[4], sum11_0[4], r[4], r[3]);
full_adder fa6 (a[5], b[5], sum11_0[5], r[5], r[4]);
full_adder fa7 (a[6], b[6], sum11_0[6], r[6], r[5]);
full_adder fa8 (a[7], b[7], sum11_0[7], r[7], r[6]);
full_adder fa9 (a[8], b[8], sum11_0[8], r[8], r[7]);
full_adder fa10 (a[9], b[9], sum11_0[9], r[9], r[8]);
full_adder fa11 (a[10], b[10], sum11_0[10], cout11_0, r[9]);

endmodule



//......................................64-bit adder with mux.

module csa2_64bit (op1, op2, sum, crout, reset, clock); //inputs are j and k.
input [63:0] op1, op2;
input  reset, clock;
output reg [63:0] sum;
wire [63:0] sumf;
output reg crout;
wire coutf;
wire [59:0] x, y;
reg [63:0] a, b;
wire [7:0] w, z;
wire [7:0] cout_m; 


always @(posedge clock or negedge reset)
begin
 if (reset==0)
  begin
   a<=0;
   b<=0;
   sum<=0; 
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
   crout<= coutf;
   $display("crout=%h", coutf);

  end
end

four_2bit fa1 (a[3:0], b[3:0], sumf[3:0], cout_m[0]);

four_1bit fa2 (a[7:4], b[7:4], x[3:0], w[0], 1'b1);  //starting with full adder 
four_2bit fa3 (a[7:4], b[7:4], y[3:0], z[0]);  //starting with half adder.
mux_4 m1 (y[3:0], x[3:0], z[0], w[0], cout_m[0], sumf[7:4], cout_m[1]);  // ...........................................correct code.

//................................................................................code need to be changed after this.




four5_1bit fa4 (a[12:8], b[12:8], x[8:4], w[1], 1'b1);  //starting with full adder 
four5_0bit fa5 (a[12:8], b[12:8], y[8:4], z[1]);  //starting with half adder.
mux_5 m2 (y[8:4], x[8:4], z[1], w[1], cout_m[1], sumf[12:8], cout_m[2]); //.....................................correct code.


four6_1bit fa6 (a[18:13], b[18:13], x[14:9], w[2], 1'b1);  //starting with full adder 
four6_0bit fa7 (a[18:13], b[18:13], y[14:9], z[2]);  //starting with half adder.
mux_6 m3 (y[14:9], x[14:9], z[2], w[2], cout_m[2], sumf[18:13], cout_m[3]);  //......................................correct code.\

//................................................................................................................................................


four7_1bit fa8 (a[25:19], b[25:19], x[21:15], w[3], 1'b1);  //starting with full adder 
four7_0bit fa9 (a[25:19], b[25:19], y[21:15], z[3]);  //starting with half adder.
mux_7 m4 (y[21:15], x[21:15], z[3], w[3], cout_m[3], sumf[25:19], cout_m[4]);



four8_1bit fa10 (a[33:26], b[33:26], x[29:22], w[4], 1'b1);  //starting with full adder 
four8_0bit fa11 (a[33:26], b[33:26], y[29:22], z[4]);  //starting with half adder.
mux_8 m5 (y[29:22], x[29:22], z[4], w[4], cout_m[4], sumf[33:26], cout_m[5]);


four9_1bit fa12 (a[42:34], b[42:34], x[38:30], w[5], 1'b1);  //starting with full adder 
four9_0bit fa13 (a[42:34], b[42:34], y[38:30], z[5]);  //starting with half adder.
mux_9 m6 (y[38:30], x[38:30], z[5], w[5], cout_m[5], sumf[42:34], cout_m[6]);



four10_1bit fa14 (a[52:43], b[52:43], x[48:39], w[6], 1'b1);  //starting with full adder 
four10_0bit fa15 (a[52:43], b[52:43], y[48:39], z[6]);  //starting with half adder.
mux_10 m7 (y[48:39], x[48:39], z[6], w[6], cout_m[6], sumf[52:43], cout_m[7]);


four11_1bit fa16 (a[63:53], b[63:53], x[59:49], w[7], 1'b1);  //starting with full adder 
four11_0bit fa17 (a[63:53], b[63:53], y[59:49], z[7]);  //starting with half adder.
mux_11 m8 (y[59:49], x[59:49], z[7], w[7], cout_m[7], sumf[63:53], coutf);

endmodule 