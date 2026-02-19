`timescale 1ns/1ns

module OnehotDetector (input [3:0]S,output Zero,output Valid);

wire n0,n1,n2,n3;

not #(1) s0_not(n0,S[0]);
not #(1) s1_not(n1,S[1]);
not #(1) s2_not(n2,S[2]);
not #(1) s3_not(n3,S[3]);


wire z1,z2;

and #(3) zero_first(z1,n0,n1);
and #(3) zero_second(z2,n2,n3);
and #(3) zero_third(Zero,z1,z2);

wire a0,a1,a2;

and #(3) first_1_and(a0,S[3],n2);
and #(3) second_1_and(a1,n1,n0);
and #(3) third_1_and(a2,a1,a0);

wire b0,b1,b2;

and #(3) first_2_and(b0,n3,S[2]);
and #(3) second_2_and(b1,n0,n1);
and #(3) third_2_and(b2,b1,b0);

wire c0,c1,c2;

and #(3) first_4_and(c0,n3,n2);
and #(3) second_4_and(c1,n0,S[1]);
and #(3) third_4_and(c2,c1,c0);

wire d0,d1,d2;

and #(3) first_8_and(d0,n3,n2);
and #(3) second_8_and(d1,S[0],n1);
and #(3) third_8_and(d2,d1,d0);

wire o1,o2;

or #(2) first_or(o1,a2,b2);
or #(2) second_or(o2,c2,d2);
or #(2) last_or(Valid,o1,o2);

endmodule