`timescale 1ns/1ns

module moduleName #(parameter n = 8) (input signed[n-1:0] regin,input reset,
input enable,input reg_in_load,input reg_out_load,output logic signed [n-1:0] regout);
    always @(posedge clock or posedge reset) begin
        if(reset)
        begin
            regout <= 0;
        end
        else if(enable)
        begin
            if(reg_in_load)
                regout <= regin;
        end
    end
endmodule