`timescale 1ns/1ns

module ALUCoreBehavioral (input [3:0]g1,g2,input [1:0]op,output Zero,Overflow,output [3:0]R);
    
    //Converting from gray to binary
    wire [3:0]b1;
    wire [3:0]b2;

    assign b1[3] = g1[3];
    assign #(3) b1[2] = b1[3] ^ g1[2];
    assign #(6) b1[1] = b1[2] ^ g1[1];
    assign #(9) b1[0] = b1[1] ^ g1[0];

    assign b2[3] = g2[3];
    assign #(3) b2[2] = b2[3] ^ g2[2];
    assign #(6) b2[1] = b2[2] ^ g2[1];
    assign #(9) b2[0] = b2[1] ^ g2[0];

    // selecting carry
    wire cin;
    wire [3:0]sb;

    assign #(3) cin = op[0] ^ op[1];

    assign #(3) sb[0] = cin ^ b2[0];
    assign #(3) sb[1] = cin ^ b2[1];
    assign #(3) sb[2] = cin ^ b2[2];
    assign #(3) sb[3] = cin ^ b2[3];

    //adding
    wire cout;
    wire [3:1]c;
    wire [3:0]s;
    wire [3:0]go;
    wire [3:0]po;

    assign #(2) go[0] = b1[0] & sb[0];
    assign #(2) go[1] = b1[1] & sb[1];  
    assign #(2) go[2] = b1[2] & sb[2];  
    assign #(2) go[3] = b1[3] & sb[3];

    assign #(3) po[0] = b1[0] ^ sb[0];
    assign #(3) po[1] = b1[1] ^ sb[1];  
    assign #(3) po[2] = b1[2] ^ sb[2];  
    assign #(3) po[3] = b1[3] ^ sb[3]; 

    assign #(7) c[1] = go[0] | (po[0] & cin);
    assign #(9) c[2] = go[1] | (po[1] & go[0]) | (po[1] & po[0] & cin);   
    assign #(11) c[3] = go[2] | (po[2] & go[1]) | (po[2] & po[1] & go[0]) | (po[2] & po[1] & po[0] & cin);   
    assign #(13) cout = go[3] | (po[3] & go[2]) | (po[3] & po[2] & go[1]) | (po[3] & po[2] & po[1] & go[0]) | (po[3] & po[2] & po[1] & po[0] & cin);

    assign #(6) s[0] = b1[0] ^ sb[0] ^ cin;
    assign #(10) s[1] = b1[1] ^ sb[1] ^ c[1];    
    assign #(12) s[2] = b1[2] ^ sb[2] ^ c[2];    
    assign #(14) s[3] = b1[3] ^ sb[3] ^ c[3];    

    //overflow

    assign #(3) Overflow = cout ^ c[3];

    //zero

    assign #(5) Zero = ~(s[0] | s[1]) & ~(s[2] | s[3]);

    //abs
    wire [3:0] abs;
    wire [3:0] first_layer;
    wire [2:0] second_layer;

    assign #(3) first_layer[0] = s[3] ^ s[0];
    assign #(3) first_layer[1] = s[3] ^ s[1];
    assign #(3) first_layer[2] = s[3] ^ s[2];
    assign #(3) first_layer[3] = s[3] ^ s[3];

    assign #(3) abs[0] = s[3] ^ first_layer[0];
    assign #(2) second_layer[0] = s[3] & first_layer[0];

    assign #(3) abs[1] = second_layer[0] ^ first_layer[1];
    assign #(2) second_layer[1] = second_layer[0] & first_layer[1];

    assign #(3) abs[2] = second_layer[1] ^ first_layer[2];
    assign #(2) second_layer[2] = second_layer[1] & first_layer[2];

    assign #(3) abs[3] = second_layer[2] ^ first_layer[3];

    //selecting  

    assign #(5) mux1 = (~op[0] & s[0]) | (op[0] & s[0]);
    assign #(5) mux2 = (~op[0] & s[1]) | (op[0] & s[1]);
    assign #(5) mux3 = (~op[0] & s[2]) | (op[0] & s[2]);
    assign #(5) mux4 = (~op[0] & s[3]) | (op[0] & s[3]);

    assign #(5) mux5 = (op[0] & s[1]) | (~op[0] & abs[0]);
    assign #(5) mux6 = (op[0] & s[2]) | (~op[0] & abs[1]);
    assign #(5) mux7 = (op[0] & s[3]) | (~op[0] & abs[2]);
    assign #(5) mux8 = (op[0] & s[3]) | (~op[0] & abs[3]);

    assign #(5) mux9 = (~op[1] & mux1) | (op[1] & mux5);
    assign #(5) mux10 = (~op[1] & mux2) | (op[1] & mux6);
    assign #(5) mux11 = (~op[1] & mux3) | (op[1] & mux7);
    assign #(5) mux12 = (~op[1] & mux4) | (op[1] & mux8);

    assign #(3) R[0] = mux9 ^ mux10;
    assign #(3) R[1] = mux11 ^ mux10;       
    assign #(3) R[2] = mux12 ^ mux11;       
    assign R[3] = mux12;       

endmodule