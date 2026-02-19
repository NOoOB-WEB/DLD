`timescale 1ns/1ns

module sr64tb();
    parameter n = 64;
    reg [n-1:0] par_in;
    reg mode;
    reg load;
    reg serin;
    reg clock;
    reg reset;

    wire [n-1:0]Data_out;

    sr64 name(par_in,Data_out,mode,load,serin,clock,reset);

    initial begin
        clock = 0;
        forever #10 clock = ~clock;
    end

    initial begin
        par_in = 64'd0;
        mode = 0;
        load = 0;
        serin = 0;
        reset = 1;

        #10
        reset = 0;

        #10
        par_in = 64'd4294967296;
        load = 1;

        #15
        load = 0;
        
        #10
        mode = 0;
        serin = 0;

        #100
        mode = 1;
        serin = 0;
        
        #200
        reset = 1;

        #50
        $stop;
    end
endmodule