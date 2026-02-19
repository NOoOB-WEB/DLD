`timescale 1ns/1ns

module comparator#(parameter n = 8)(input [n-1:0]in,output warning,output error);
wire eq;
wire lt;
wire gt;
wire eq1;
wire lt1;
wire gt1;

comparator8 #(n) first(in,8'b00000011,eq,gt,lt);
comparator8 #(n) second(in,8'b00000111,eq1,gt1,lt1);

assign warning = gt & lt1;

assign error = (gt1 & gt) | (gt1 & ~gt);

endmodule