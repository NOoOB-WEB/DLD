`timescale 1ns/1ns

module  mux2to1(input s,input signed [15:0]zero,input signed [15:0]one,output signed [15:0]o);

    assign o = s?one:zero;
    
endmodule