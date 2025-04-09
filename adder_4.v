module half_adder(
input A,
input B,
output sum,
output carry
);

assign sum=A^B;
assign carry=A&B;

endmodule

module full_adder(
input A,
input B, 
input cin, 
output sum, 
output carry
);
wire w1,w2,w3;

half_adder HA1(.A(A),.B(B),.sum(w1),.carry(w2));

half_adder HA2(.A(w1),.B(cin),.sum(sum),.carry(w3));

or g1(carry,w2,w3);

endmodule

module seven_seg(
input [3:0]sum,
output reg [6:0]seg,
output reg [3:0]anode
);
always @(*) begin
   case(sum)
               4'b0000: seg = 7'b1000000; // 0
               4'b0001: seg   = 7'b1111001; // 1
                4'b0010: seg  = 7'b0100100; // 2
                4'b0011: seg  = 7'b0110000; // 3
                4'b0100: seg  = 7'b0011001; // 4
                4'b0101: seg  = 7'b0010010; // 5
                4'b0110: seg   = 7'b0000010; // 6
                4'b0111: seg  = 7'b1111000; // 7
                4'b1000: seg  = 7'b0000000; // 8
                4'b1001: seg  = 7'b0010000; // 9
                4'b1010: seg   = 7'b0001000; // 
                4'b1011: seg  = 7'b0000011; // b
                4'b1100: seg = 7'b1000110; // C
                4'b1101: seg  = 7'b0100001; // d
               4'b1110: seg  = 7'b0000110; // E
               4'b1111: seg   = 7'b0001110; // F
               default: seg = 7'b0000000;
            endcase
           anode = 4'b1110;
         end
    endmodule


module parallel_4_bit_adder(

input [3:0]A,
input [3:0]B,
input cin,
output carry ,
output [3:0]sum,
output  [6:0]seg,
output [3:0]anode

);  
wire C0,C1,C2 ;
    
full_adder FA0(.A(A[0]), .B(B[0]), .cin(cin), .carry(C0), .sum(sum[0]));    
full_adder FA1(.A(A[1]), .B(B[1]), .cin(C0), .carry(C1), .sum(sum[1]));    
full_adder FA2(.A(A[2]), .B(B[2]), .cin(C1), .carry(C2), .sum(sum[2]));    
full_adder FA3(.A(A[3]), .B(B[3]), .cin(C2), .carry(carry), .sum(sum[3]));

seven_seg U1(
        .sum(sum),
        .seg(seg),
        .anode(anode)
        );
endmodule