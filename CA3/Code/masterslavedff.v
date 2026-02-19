`timescale 1ns/1ns

module msdff (
    input D,Reset,clock,output  Q
);

    wire D_bar;
    wire C_bar;
    wire N_r;
    wire upper1;
    wire upper2;
    wire upper3;
    wire upper4;
    wire down1;
    wire down2;
    wire down3;
    wire Q_bar;

    not d_comp(D_bar,D);
    not C_comp(C_bar,clock);
    not R_comp(N_r,Reset);
    //master
    nand first_upper(upper1,D,C_bar);
    nand first_down(down1,D_bar,C_bar);
    nand second_upper(upper2,upper1,down2);
    nand second_down(down2,down1,upper2,N_r);

    //slave
    nand s_first_upper(upper3,upper2,clock);
    nand s_first_down(down3,down2,clock);
    nand s_second_upper(Q,upper3,Q_bar);
    nand s_second_down(Q_bar,Q,down3,N_r);

endmodule