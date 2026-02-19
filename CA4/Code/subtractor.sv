`timescale 1ns/1ns

module subtractor (input signed [15:0]first_input,input signed [15:0] second_input,output signed [15:0] output_number);

    assign output_number = first_input - second_input;
    
endmodule