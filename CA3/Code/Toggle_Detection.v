`timescale 1ns/1ns

module td (input clock,input D,input reset,output Q);
    wire temp;
    msdff new(D,reset,clock,temp);
    assign Q = D ^ temp;
    
endmodule