`timescale 1ns/1ns

module comptb ();
parameter n = 8;
reg [n-1:0]in;
wire warning;
wire error;

comparator #(n) inst(in,warning,error);
initial begin
    in = 8'd5;

    #10
    in = 8'd1;

    #5
    in = 8'd64;

    #10
    $stop;
end

endmodule