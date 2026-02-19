`timescale 1ns/1ns

module Datapathsqrt (
    input iter,input signed [15:0] N,input clock,input reset,
    input select,input reg_load,output msb,output logic [7:0]ISQRT
);
    
    wire signed [15:0] sub_out;
    wire signed [15:0] reg_in;
    wire signed [15:0] reg_out;
    wire signed [15:0] count;

    mux2to1 mux(select,N,sub_out,reg_in);
    
    wire reg_enable;
    wire update_enable;

    assign update_enable = iter & ~sub_out[15];
    assign reg_enable = reg_load | update_enable;

    register reg1(clock,reg_in,reg_enable,reset,reg_out);

    odd_counter odd1(clock,reset,update_enable,count);

    subtractor sub1(reg_out,count,sub_out);

    assign msb = sub_out[15];

    counter cnt(clock,reset,update_enable,ISQRT);

endmodule