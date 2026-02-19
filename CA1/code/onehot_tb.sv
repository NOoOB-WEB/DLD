`timescale 1ns/1ns

module test_bench();

logic [3:0]S;
wire Zero;
wire Valid;

OnehotDetector inst(.S(S),.Zero(Zero),.Valid(Valid));

initial begin
    S = 4'd0;

    #50 S = 4'd1;
    #50 S = 4'd2;
    #50 S = 4'd3;
    #50 S = 4'd4;
    #50 S = 4'd5;
    #50 S = 4'd6;
    #50 S = 4'd7;
    #50 S = 4'd8;
    #50 S = 4'd9;
    #50 S = 4'd10;
    #50 S = 4'd11;
    #50 S = 4'd12;
    #50 S = 4'd13;
    #50 S = 4'd14;
    #50 S = 4'd15;
    #50 $stop;

end

endmodule;