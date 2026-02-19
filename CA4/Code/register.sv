`timescale 1ns/1ns

module register(input clock,input signed [15:0]number,input enable,input reset,output logic signed[15:0]number_out);

    always @(posedge clock or posedge reset) begin
        if(reset)
            number_out <= 0;
        else if (enable) 
        
            number_out <= number;    
    end
endmodule