`timescale 1ns/1ns

module GCD_tb;
  reg clk, go_i, sync_reset;
  reg [7:0] x_i, y_i;
  wire [7:0] d_o;
  
  parameter PERIOD = 20; //define clk period to be 20 x 1ns = 20ns
  
  GCD GCD0(
    .go_i(go_i), 
    .sync_reset(sync_reset), 
    .clk(clk),
    .x_i(x_i), 
    .y_i(y_i), 
    .d_o(d_o)
  ); 
  
  initial begin
    #0 clk = 1'b0;
       sync_reset = 1; // reset state to 4b'00000
       go_i=1'b0;
    #15 sync_reset = 0; //after 15ns, sync_reset goes to 0. FSM starts to run!!
       x_i=8'b00000110; //x=6
       y_i=8'b00001001; //y=9
    #100 go_i = 1'b1;     //jump out of the while(!go_i) loop
    #20 go_i = 1'b0;   // go_i reset to 0
    #400  x_i=8'b00001100; //x=12
       y_i=8'b00001000; //y=8
     #40  go_i =1'b1;
     #20  go_i =1'b0;
  end
  
  // clk runs at 50MHz: every 20/2=10ns, clk is inverted
  always #(PERIOD/2) clk = ~clk;
endmodule