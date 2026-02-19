`timescale 1ns/1ns

module err_tb ();
parameter n =64;
parameter h = 8;

reg in;
reg clock;
reg reset;

wire warning;
wire error;

error_d #(n,h) name(in,clock,reset,warning,error);

initial begin
    clock = 0;
    forever #1 clock = ~clock;
end


initial begin
    reset = 1;

    #10
    reset = 0;
    in = 0;

    repeat (8) begin
        #5 in = ~in;
    end

    #10
    $stop;
end
    
endmodule