module eightBitAdder(input [7:0] A, B,
                     input Cin,
                     output [7:0] S,
                     output Cout);
    wire[7:0] Icout;
    fulladder Adder0(.A(A[0]), .B(B[0]), .Cin(Cin), .S(S[0]), .Cout(Icout[0]));
    fulladder Adder1(.A(A[1]), .B(B[1]), .Cin(Icout[0]), .S(S[1]), .Cout(Icout[1]));
    fulladder Adder2(.A(A[2]), .B(B[2]), .Cin(Icout[1]), .S(S[2]), .Cout(Icout[2]));
    fulladder Adder3(.A(A[3]), .B(B[3]), .Cin(Icout[2]), .S(S[3]), .Cout(Icout[3]));
    fulladder Adder4(.A(A[4]), .B(B[4]), .Cin(Icout[3]), .S(S[4]), .Cout(Icout[4]));
    fulladder Adder5(.A(A[5]), .B(B[5]), .Cin(Icout[4]), .S(S[5]), .Cout(Icout[5]));
    fulladder Adder6(.A(A[6]), .B(B[6]), .Cin(Icout[5]), .S(S[6]), .Cout(Icout[6]));
    fulladder Adder7(.A(A[7]), .B(B[7]), .Cin(Icout[6]), .S(S[7]), .Cout(Icout[7]));
    assign Cout=Icout[7];
endmodule