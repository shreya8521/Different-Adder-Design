`timescale 1ns/1ps
module cla64b_tb;
reg [63:0] op1,op2;
reg clock;
reg reset;
wire crout;
wire [63:0]sum;

cla64b_tb dut(op1,op2,sum,clock,crout,reset);

initial begin
   clock=1'b1;
   forever #3 clock=~clock;
 end
  
initial begin
		reset=1;op1=64'h0000000000000000; op2=64'h0000000000000000;
		#2; reset=0; op1=64'hffff_ffff_ffff_ffff; op2=64'h0000_0000_0000_0001;
		#6; reset=0; op1=64'h14ab_78ef_d853_5c7d; op2=64'h8dfd_eded_cbed_8243;
		#6; reset=0; op1=64'h224f_9910_23fa_39c6; op2=64'h28ad_bc24_bd8f_defa;
		#6; reset=0; op1=64'hbd82_a234_b339_315c; op2=64'h66ff_abba_239f_abcd;
  		#6; reset=0; op1=64'hd2a9_b3c7_72fa_7444; op2=64'h8822_2333_5575_5892;
		#6; reset=0; op1=64'h58ab_68fa_259a_3333; op2=64'h512c_438b_4bba_2fab;
		#80 $finish;
	end
  
 initial begin
   $dumpfile ("cla64b.vcd");
   $dumpvars (0, cla64b_tb);
	end
  
endmodule