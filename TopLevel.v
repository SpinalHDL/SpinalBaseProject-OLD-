
module TopLevel
( 
  input  [3:0] io_a,
  input  [3:0] io_b,
  output reg [3:0] io_result,
  input   clk 
);

  wire [3:0] zz_1;
  assign zz_1 = (io_a + io_b);
  always @ (posedge clk)
  begin
    io_result <= zz_1;
  end

endmodule

