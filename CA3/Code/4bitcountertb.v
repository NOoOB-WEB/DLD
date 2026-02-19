`timescale 1ns/1ns

module countertb ();

    parameter n = 4;
    reg cnt;
    wire co;
    reg clock;
    reg reset;
    wire [n-1:0]out;

    counter #(n) name(clock,reset,cnt,co,out);

    initial begin
        clock = 0;
        forever #10 clock = ~clock;
    end

    initial begin
        reset = 1;
        cnt = 0;

        #12
        reset = 0;
        
        #8
        cnt = 1;

        #800
        cnt = 0;

        #10
        reset = 1;

        #5
        $stop;
    end
    
endmodule