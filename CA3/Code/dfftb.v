`timescale 1ns/1ns

module dfftb ();
reg D;
reg clock;
reg reset;
wire Q;

msdff name(D,reset,clock,Q);

initial begin
    clock = 0;
    forever #10 clock = ~clock;
end
    
initial begin
    D = 0;
    reset = 1;

    #5
    reset = 0;

    #10
    D = 1;
    #10
    D = 1;
    #10
    D = 0;
    #10
    D = 1;
    #5
    reset = 1;

    #5
    reset = 0;
end
endmodule