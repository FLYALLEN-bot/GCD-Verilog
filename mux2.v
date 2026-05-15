module mux2(input [7:0] A0, A1,
                input select,
                output [7:0] Y
);
    assign Y= select ? A1 : A0; 
endmodule