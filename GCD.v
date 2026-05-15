module GCD(
  input go_i, sync_reset, clk,
  input [7:0] x_i, y_i,
  output [7:0] d_o,
  output done_o
);
  wire x_sel, y_sel, x_ld, y_ld, d_ld, x_neq_y, x_lt_y;
  DataPath D0(.x_i(x_i), .y_i(y_i), .x_sel(x_sel),.y_sel(y_sel), .x_ld(x_ld), .y_ld(y_ld), .d_ld(d_ld), .clk(clk), .d_o(d_o), .x_neq_y(x_neq_y), .x_lt_y(x_lt_y));
  Controller C0(.go_i(go_i), .sync_reset(sync_reset), .clk(clk), .x_neq_y(x_neq_y), .x_lt_y(x_lt_y), .x_sel(x_sel),.y_sel(y_sel), .x_ld(x_ld), .y_ld(y_ld), .d_ld(d_ld),.done_o(done_o)); 
endmodule
