`timescale 1ns/1ns

module Toggle_Counting #(parameter n = 64,parameter h = 8)(par_in,clock,reset,mode,load,D,out);
    input clock;
    input reset;
    input load;
    input mode;
    input [n-1:0]par_in;
    input D;
    wire Q;
    wire [n-1:0]Data_out;
    wire co;
    output [h-1:0]out;

    td toggle(~clock,D,reset,Q);
    sr64 shift(par_in,Data_out,mode,load,Q,clock,reset);
    counter #(h) count(clock,reset,Data_out[n-1],co,out);

endmodule