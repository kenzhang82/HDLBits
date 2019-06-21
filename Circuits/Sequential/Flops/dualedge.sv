module dualedge 
(
  input clk,
  input d,
  output q
);
  
  reg posedge_out;
  reg negedge_out;

  always @(posedge clk) begin
    posedge_out <= d;
  end

  always @(posedge ~clk) begin
    negedge_out <= d;
  end

  assign q = clk ? posedge_out : negedge_out;

endmodule