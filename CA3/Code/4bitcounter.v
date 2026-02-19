`timescale 1ns/1ns

module counter #(parameter n = 4)(input clock,input reset,input cnt,output co,output [n-1:0]out);
    wire [n-1:0]D;
    wire[n-1:0]toggle;
    genvar  k;
    generate
    for (k = 0;k < n;k = k + 1)begin
        if (k == 0)
            assign toggle[k] = cnt;
        else
            assign toggle[k] = cnt & &out[k-1:0];

        assign D[k] = out[k] ^ toggle[k];

        msdff ins(D[k],reset,clock,out[k]); 
    end
    endgenerate
    assign co = cnt & &out;
endmodule