`timescale 1ns/1ns

module comparator8 #(parameter n = 8)(input [n-1:0]main_number,input [n-1:0]given_number,output eq,output gt,output lt);
    wire [n-1:0]p;
    wire [n-1:0]q;

    genvar k;
    genvar i;
    generate
        for (k = 0;k < n;k = k + 1)begin
            assign p[k] = ~(main_number[k] ^ given_number[k]);
        end 
        for (i = 0;i < n ;i = i+1)
        begin
            if (i == n-1)
                assign q[i] = main_number[i] & ~given_number[i];
            else
                assign q[i] = main_number[i] & ~given_number[i] & &p[n-1:i+1];
        end
    endgenerate
    
    assign eq = &p;
    assign gt = |q;
    assign lt = ~(eq | gt);
endmodule