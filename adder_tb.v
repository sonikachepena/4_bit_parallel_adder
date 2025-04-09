`timescale 1ns / 1ps

module adder_tb();
reg [3:0]A;
reg [3:0]B;
reg cin;
wire carry;
wire [3:0] sum;

parallel_4_bit_adder uut(
    .A(A),
    .B(B),
    .cin(cin),
    .carry(carry),
    .sum(sum)
    );
initial begin
#10;
 A=4'b1010;
 B=4'b1000;
 cin=1'b0;
#10;
A=4'b1001;
B=4'b1001;
cin=1'b1;
#50;

$finish;
 end

endmodule
