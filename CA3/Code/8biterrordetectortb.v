`timescale 1ns/1ns

module error_d_tb8 ();

parameter n = 64;
parameter h = 8;

reg clock;
reg reset;
reg [h-1:0] in;
wire [h-1:0] warning;
wire [h-1:0] error;


error_d8 #(n,h) name(in,clock,reset,warning,error);

initial begin
    clock = 0;
    forever #1 clock = ~clock;
end

initial begin
    reset = 1;
    in = 0;

    #10
    reset = 0;

    repeat (10) begin
        #3 in[0] = ~in[0];
    end
    repeat (10) begin
        #1 in[1] = ~in[1];
    end    
    repeat (7) begin
        #3 in[2] = ~in[2];
    end    
    repeat (10) begin
        #5 in[3] = ~in[3];
    end    
    repeat (5) begin
        #7 in[4] = ~in[4];
    end    
    repeat (7) begin
        #13 in[5] = ~in[5];
    end    
    repeat (15) begin
        #3 in[6] = ~in[6];
    end    
    repeat (10) begin
        #19 in[7] = ~in[7];
    end
end
    
endmodule