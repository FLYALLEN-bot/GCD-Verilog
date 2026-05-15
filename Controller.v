module Controller(
  input x_neq_y, x_lt_y, go_i, clk, sync_reset,
  output x_sel, y_sel, x_ld, y_ld, d_ld,done_o
);
  reg [3:0] Q;
  reg [3:0] I;
  reg [4:0] all_outputs;
  wire [7:0] all_inputs;  
  
  //state register
  always@(posedge clk)
  begin
    if(sync_reset)
      Q <= 4'b0000;
    else
      Q <= I;
  end
  
  
  //output logic
  assign done_o = (Q==4'b1100) ? 1'b1 : 1'b0;
  assign x_sel=all_outputs[4];
  assign y_sel=all_outputs[3];
  assign x_ld =all_outputs[2];
  assign y_ld =all_outputs[1];
  assign d_ld =all_outputs[0];
  
  always @(Q) 
  begin
    case(Q)
      4'b0000: all_outputs=5'bxx000;
      4'b0001: all_outputs=5'bxx000; 
      4'b0010: all_outputs=5'bxx000;
      4'b0011: all_outputs=5'b0x100; 
      4'b0100: all_outputs=5'bx0010; 
      4'b0101: all_outputs=5'bxx000;
      4'b0110: all_outputs=5'bxx000;
      4'b0111: all_outputs=5'bx1010;
      4'b1000: all_outputs=5'b1x100;
      4'b1001: all_outputs=5'bxx000;  
      4'b1010: all_outputs=5'bxx000;
      4'b1011: all_outputs=5'bxx001;
      4'b1100: all_outputs=5'bxx000;
      default: all_outputs=5'bxx000;
    endcase
  end 
  
  
   //next state logic
  assign all_inputs ={Q, x_neq_y, x_lt_y, go_i};
  always@(all_inputs)
  begin
    casez(all_inputs)
     7'b0000???: I=4'b0001;
     7'b0001??0: I=4'b0010;
     7'b0001??1: I=4'b0011; 
     7'b0010???: I=4'b0001;
     7'b0011???: I=4'b0100;
     7'b0100???: I=4'b0101;
     7'b01010??: I=4'b1011;
     7'b01011??: I=4'b0110;
     7'b0110?0?: I=4'b1000;
     7'b0110?1?: I=4'b0111;
     7'b0111???: I=4'b1001;
     7'b1000???: I=4'b1001;
     7'b1001???: I=4'b1010;
     7'b1010???: I=4'b0101;
     7'b1011???: I=4'b1100; 
     7'b1100???: I=4'b0000;
     default:    I=4'b0000;
    endcase
  end
   
endmodule
