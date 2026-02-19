`timescale 1ns/1ns

module sr64(par_in,Data_out,mode,load,serin,clock,reset);
parameter n = 64;
input [n-1:0]par_in;
input mode;
input load;
input serin;
input clock;
input reset;
output reg [n-1:0]Data_out;
integer k;

always @(posedge clock or posedge reset) begin
    if (reset)
        Data_out <= {n{1'b0}};
    else if(load)
        Data_out <= par_in;
    else
        begin
            if(!mode) begin
                for (k = 0;k < n-1 ;k = k + 1 ) begin
                    Data_out[k] <= Data_out[k + 1];
                end
                Data_out[n - 1] <= serin;
            end
            else begin
                for (k = n - 1;k > 0 ;k = k - 1 ) begin
                    Data_out[k] <= Data_out[k - 1];
                end
                Data_out[0] <= serin;
        end
        end
end
endmodule