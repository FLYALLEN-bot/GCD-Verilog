module eightBitSubtracter(input [7:0] A, B,
                          output[7:0] S,
                          output Cout);
    wire [7:0] NotB;
    assign NotB = ~B; 
    eightBitAdder e1(.A(A), .B(NotB), .Cin(1'b1), .S(S), .Cout(Cout));
endmodule