`timescale 1ns/1ns

module tctb ();
    parameter n = 64;
    parameter h = 8;
    reg clock;
    reg reset;
    reg load;
    reg mode;
    reg [n-1:0]par_in;
    reg D;
    wire [h-1:0]out;

    Toggle_Counting #(n,h)name  (par_in,clock,reset,mode,load,D,out);

    initial begin
        clock = 0;
        forever #1 clock = ~clock;
    end

    initial begin
        D = 0;
        forever #5 D = ~D;
    end

    initial begin
        mode = 0;
        reset = 1;
        load = 0;
        par_in = 64'd0;

        #2
        reset = 0;
        
        #600
        $stop;

    end
    
endmodule