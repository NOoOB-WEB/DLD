`timescale 1ns/1ns

module odd_counter(input clock,input reset,input enable,output logic [15:0]count);
    always @(posedge clock or posedge reset) begin
        if(reset)
            count <= 16'd1;
        else if(enable)
                count <= count + 16'd2;
    end
endmodule