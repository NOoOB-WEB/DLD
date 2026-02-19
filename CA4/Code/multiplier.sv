`timescale 1ns/1ns

module multiplier (input signed[15:0] A,input signed [15:0]B,output signed [30:0] mult);
    assign mult = A * B;
    
endmodule