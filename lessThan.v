module lessThan(input [7:0] A, B,
                output Y);
    wire [7:0] S;
    wire Cout; 
    eightBitSubtracter sub1(.A(A), .B(B), .S(S), .Cout(Cout));
    assign Y=S[7];
endmodule