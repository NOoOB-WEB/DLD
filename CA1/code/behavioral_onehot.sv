`timescale 1ns/1ns

module OnehotDetector (input [3:0]S,output Zero,output Valid);
    assign #(7) Zero = ~S[0] & ~S[1] & ~S[2] & ~S[3];
    assign #(11) Valid = (~S[0] & ~S[1] & ~S[2] & S[3]) | (~S[0] & ~S[1] & S[2] & ~S[3]) | (~S[0] & S[1] & ~S[2] & ~S[3]) | (S[0] & ~S[1] & ~S[2] & ~S[3]) ;
endmodule