module DataPath(
  input [7:0] x_i, y_i,
  input x_sel, y_sel, x_ld, y_ld, d_ld, clk,
  output [7:0] d_o,
  output x_neq_y, x_lt_y
);
    wire [7:0] x_minus_y, y_minus_x, xp, yp, x, y;
    wire Cout0, Cout1;
    
    mux2 I0(.A0(x_i), .A1(x_minus_y), .select(x_sel), .Y(xp));
    mux2 I1(.A0(y_i), .A1(y_minus_x), .select(y_sel), .Y(yp));

    DataReg I2(.D(xp), .clk(clk), .load(x_ld), .Q(x));
    DataReg I3(.D(yp), .clk(clk), .load(y_ld), .Q(y));

    notEqual I4(.A(x), .B(y), .Y(x_neq_y));
    lessThan I5(.A(x), .B(y), .Y(x_lt_y));
    
    eightBitSubtracter I7(.A(y), .B(x), .S(y_minus_x), .Cout(Cout1));
    eightBitSubtracter I8(.A(x), .B(y), .S(x_minus_y), .Cout(Cout0));
    
    DataReg I9(.D(x), .clk(clk), .load(d_ld), .Q(d_o));
endmodule