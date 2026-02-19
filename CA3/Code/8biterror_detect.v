`timescale 1ns/1ns

module  error_d8 #(parameter n = 64,parameter h = 8)(input [h-1:0]in,input clock,input reset,output [h-1:0] warning,output [h-1:0] error);
    genvar k;
    generate
    for (k = 0;k < h ;k = k + 1) begin
        error_d #(n,h) temp(in[k],clock,reset,warning[k],error[k]);
    end
    endgenerate
    
endmodule