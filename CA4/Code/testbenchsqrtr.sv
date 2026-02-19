`timescale 1ns/1ns

module sqrttb();

    logic clock;
    logic reset;
    logic start;
    logic signed [15:0]N;
    wire invalid;
    wire done;
    wire [7:0]answer;

    sqrt ins(clock,reset,N,start,done,invalid,answer);
    
    initial begin
        clock = 0;
        forever #1 clock = ~clock;
    end

    initial begin
        reset = 1;
        start = 0;

        
        #4
        reset = 0;

        #10
        N = 30047;
        
        #2
        start = 1;
        
        #2
        start = 0;
        
        #400
        N = 1289;
        
        #2
        start = 1;
        
        #2
        start = 0;
        
 

        #400
        N = 17654;
        
        
        #2
        start = 1;
        
        #2
        start = 0;
        
        #400
        N = -9376;

        
        #2
        start = 1;
        
        #2
        start = 0;
        
        #400
        N = 24258;
        
        #2
        start = 1;
        
        #2
        start = 0;
        
        #400
        N = -12483;
        
        #2
        start = 1;
        
        #2
        start = 0;
        
        #400
        N = 1548;
        
        #2
        start = 1;
        
        #2
        start = 0;
        
        #400
        N = 27048;
        
        #2
        start = 1;
        
        #2
        start = 0;
        
        #400
        N = -5;
        
        #2
        start = 1;
        
        #2
        start = 0;
        
        #400
        N = 4571;
        
        #2
        start = 1;
        
        #2
        start = 0;
        
        #400
        $stop;
    end
endmodule