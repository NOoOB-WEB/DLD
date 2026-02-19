`timescale 1ns/1ns

module addsub (input signed[15:0]A,input signed[15:0]B,input as,output signed[15:0]O);
    if(!as)
        assign O = A + B;
    else
        assign O = A - B;
        
endmodule