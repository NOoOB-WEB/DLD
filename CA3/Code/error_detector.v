`timescale 1ns/1ns

module error_d #(parameter n = 64,parameter h = 8) (input in,input clock,input reset,output warning,output error );
wire mode;
wire [n-1:0] par_in;
wire load;

assign mode = 0;
assign par_in = {n{1'b0}};
assign load = 0;

wire [h-1:0] tempout;

Toggle_Countingd #(n,h) inst(par_in,clock,reset,mode,load,in,tempout);
comparator #(h) temp(tempout,warning,error);

    
endmodule