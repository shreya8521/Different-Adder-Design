`timescale 1ns/10ps
module half_adder(a, b, sum1, cout1);
input a, b;
output sum1, cout1;

assign sum1= a^b;
assign cout1= a&b;

endmodule

module full_adder(a, b, sum2, cout2, cin);
input a, b, cin;
output sum2, cout2;
wire r1, r2, r3;

assign sum2= a^b^cin;
assign cout2= (a&b) | ((a^b)&cin);

endmodule

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

module four_0bit (a, b, sum4, cout4);
input [3:0] a, b;
output [3:0] sum4;
output cout4;
wire [2:0] r;

half_adder ha1 (a[0], b[0], sum4[0], r[0]);
full_adder ffa1 (a[1], b[1], sum4[1], r[1], r[0]);
full_adder ffa2 (a[2], b[2], sum4[2], r[2], r[1]);
full_adder ffa3 (a[3], b[3], sum4[3], cout4, r[2]);

endmodule

module rca_64bit (op1, op2, sum, crout, reset, clock);
input [63:0] op1, op2;
input reset, clock;
output reg [63:0] sum;
wire [63:0] sumf;
output reg crout;
wire [14:0] r;
reg [63:0] a, b;
wire coutf;

always @(posedge clock or negedge reset)
begin
 if (reset==0)
  begin
   a<=0;
//   $display("op1=%h", a);
   b<=0; 
//   $display("op2=%h", b);
   sum<=0;
//   $display("sum=%h", sum);
   crout<=0; 
//   $display("crout=%h", crout);
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

four_0bit fa1 (a[3:0], b[3:0], sumf[3:0], r[0]);
four_1bit fa2 (a[7:4], b[7:4], sumf[7:4], r[1], r[0]);
four_1bit fa3 (a[11:8], b[11:8], sumf[11:8], r[2], r[1]);
four_1bit fa4 (a[15:12], b[15:12], sumf[15:12], r[3], r[2]);
four_1bit fa5 (a[19:16], b[19:16], sumf[19:16], r[4], r[3]);
four_1bit fa6 (a[23:20], b[23:20], sumf[23:20], r[5], r[4]);
four_1bit fa7 (a[27:24], b[27:24], sumf[27:24], r[6], r[5]);
four_1bit fa8 (a[31:28], b[31:28], sumf[31:28], r[7], r[6]);
four_1bit fa9 (a[35:32], b[35:32], sumf[35:32], r[8], r[7]);
four_1bit fa10 (a[39:36], b[39:36], sumf[39:36], r[9], r[8]);
four_1bit fa11 (a[43:40], b[43:40], sumf[43:40], r[10], r[9]);
four_1bit fa12 (a[47:44], b[47:44], sumf[47:44], r[11], r[10]);
four_1bit fa13 (a[51:48], b[51:48], sumf[51:48], r[12], r[11]);
four_1bit fa14 (a[55:52], b[55:52], sumf[55:52], r[13], r[12]);
four_1bit fa15 (a[59:56], b[59:56], sumf[59:56], r[14], r[13]);
four_1bit fa16 (a[63:60], b[63:60], sumf[63:60], coutf, r[14]);

endmodule