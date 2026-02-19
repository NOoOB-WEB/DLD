`timescale 1ns/1ns
module toggletb ();
    
    reg reset;
    reg D;
    reg clock;
    wire out;

    td name(clock,D,reset,out);

    initial begin 
        clock = 0;
        forever #10 clock = ~clock;
    end

    initial begin
        D = 0;
        reset = 1;

        #10
        reset = 0;
        D = 1;

        #30
        D = 0;

        #40
        D = 1;

        #20
        reset = 1;

        #10
        $stop;
    end

endmodule
