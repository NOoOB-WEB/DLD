    `timescale 1ns/1ns

    module sqrt (
        input clock,input reset,input signed [15:0] N,input start,
        output logic done,output invalid,output [7:0]sqrtans
    );
        wire select;
        wire msb;
        wire rs;
        wire enable;
        wire reg_load;

        controller_sqrt control_unit_sqrt(start,msb,clock,reset,select,reg_load,invalid,done,rs,enable);
        Datapathsqrt Datapath_unit_sqrt(enable,N,clock,rs,reg_load,select,msb,sqrtans);
        
    endmodule