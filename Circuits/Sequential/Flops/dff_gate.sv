module dff_gate 
(
  input clk,
  input in, 
  output out 
);

  always @(posedge clk) begin
    out <= in ^ out;
  end

endmodule