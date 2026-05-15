module DataReg(
    input [7:0] D, // Data input
    input clk, //clk input
    input load,//load input
    output reg [7:0] Q //Q output
);
    always @(posedge clk)
        begin
            if(load == 1'b1)
                Q <= D;
        end
endmodule
