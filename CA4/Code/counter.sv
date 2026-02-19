`timescale 1ns/1ns

module counter (input clock,input reset,input enable,output logic [7:0]count);

    always @(posedge clock or posedge reset) begin
        if(reset)
            count <= 8'd0;
        else if(enable)
            count <= count + 1;
    end
    
endmodule