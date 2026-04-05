`timescale 1ns/1ps

module cla5_gate (
    input  wire [4:0] A,
    input  wire [4:0] B,
    output wire [4:0] S,
    output wire       Cout
);

    wire G0, G1, G2, G3, G4;
    wire P0, P1, P2, P3, P4;

    and (G0, A[0], B[0]);
    and (G1, A[1], B[1]);
    and (G2, A[2], B[2]);
    and (G3, A[3], B[3]);
    and (G4, A[4], B[4]);

    or  (P0, A[0], B[0]);
    or  (P1, A[1], B[1]);
    or  (P2, A[2], B[2]);
    or  (P3, A[3], B[3]);
    or  (P4, A[4], B[4]);

    wire X0, X1, X2, X3, X4;
    xor (X0, A[0], B[0]);
    xor (X1, A[1], B[1]);
    xor (X2, A[2], B[2]);
    xor (X3, A[3], B[3]);
    xor (X4, A[4], B[4]);

    wire C1, C2, C3, C4, C5;

    assign C1 = G0;

    wire c2_t1;
    and (c2_t1, P1, G0);
    or  (C2, G1, c2_t1);

    wire c3_t1, c3_t2a, c3_t2;
    and (c3_t1,  P2,   G1);
    and (c3_t2a, P2,   P1);
    and (c3_t2,  c3_t2a, G0);
    wire c3_or1;
    or  (c3_or1, G2, c3_t1);
    or  (C3, c3_or1, c3_t2);

    wire c4_t1, c4_t2a, c4_t2, c4_t3a, c4_t3b, c4_t3;
    and (c4_t1,   P3, G2);
    and (c4_t2a,  P3, P2);
    and (c4_t2,   c4_t2a, G1);
    and (c4_t3a,  P3, P2);
    and (c4_t3b,  c4_t3a, P1);
    and (c4_t3,   c4_t3b, G0);
    wire c4_or1, c4_or2;
    or  (c4_or1, G3, c4_t1);
    or  (c4_or2, c4_or1, c4_t2);
    or  (C4, c4_or2, c4_t3);

    wire c5_t1, c5_t2a, c5_t2, c5_t3a, c5_t3b, c5_t3,
         c5_t4a, c5_t4b, c5_t4c, c5_t4;
    and (c5_t1,   P4, G3);
    and (c5_t2a,  P4, P3);
    and (c5_t2,   c5_t2a, G2);
    and (c5_t3a,  P4, P3);
    and (c5_t3b,  c5_t3a, P2);
    and (c5_t3,   c5_t3b, G1);
    and (c5_t4a,  P4, P3);
    and (c5_t4b,  c5_t4a, P2);
    and (c5_t4c,  c5_t4b, P1);
    and (c5_t4,   c5_t4c, G0);

    wire c5_or1, c5_or2, c5_or3;
    or  (c5_or1, G4, c5_t1);
    or  (c5_or2, c5_or1, c5_t2);
    or  (c5_or3, c5_or2, c5_t3);
    or  (C5, c5_or3, c5_t4);

    assign Cout = C5;

    assign S[0] = X0;
    xor (S[1], X1, C1);
    xor (S[2], X2, C2);
    xor (S[3], X3, C3);
    xor (S[4], X4, C4);

endmodule


module tb_cla_5bit;

    reg  [4:0] A;
    reg  [4:0] B;
    wire [4:0] Sum;
    wire       Cout;

    cla5_gate uut (
        .A(A),
        .B(B),
        .S(Sum),
        .Cout(Cout)
    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_cla_5bit);

        A = 5'd20;
        B = 5'd25;

        #10;

        $display("A=%0d, B=%0d -> Sum=%0d, Cout=%b", A, B, Sum, Cout);
        $finish;
    end

endmodule
