`timescale 1ns/1ns

module controller_sqrt (
    input start,input msb,input clock,input rst,output logic s,
    output logic reg_load,output logic invalid,output logic Done,output logic reset,output logic enable
);
    reg [2:0] ps,ns;
    parameter [2:0]  A = 3'd0,B = 3'd1,C = 3'd2,D = 3'd3,E = 3'd4,F = 3'd5;
    always @(*) begin
        ns = ps;
        case (ps)
            A:
                ns = (start)?B:A;
            B:
                ns = (start)?B:C; 
            C:
                ns = (msb)?F:D;
            D:
                ns = (msb)?E:D;
            E:
                ns = A;
            F:
                ns = A;
            default:
                ns = A;
        endcase
    end

    always @(*) begin
        Done = 0;
        s = 1;
        reset = 0;
        enable = 0;
        reg_load = 0;
        invalid = 0;

        case (ps)
            A:
                reset = 1;
            B:
            begin
                reset = 0;
            end
            C:
            begin
                s = 0;
                reg_load = 1;
                enable = 1;
            end
            D:
            begin
                s = 1;
                enable = 1;
                reg_load = 1;
            end
            E:
            begin
                Done = 1;
            end
            F:
                invalid = 1;
        endcase
    end

    always @(posedge clock or posedge rst) begin
        if(rst)
            ps <= A;
        else
            ps <= ns;
    end
endmodule
