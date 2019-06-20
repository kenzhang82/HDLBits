module muxdff2 
(
  input clk,
  input w, R, E, L,
  output Q
);

  reg mux_out;
  reg flop_in;

  always @(posedge clk) begin
    Q <= flop_in;
  end

  always @(*) begin
    mux_out = E ? w : Q;
    flop_in = L ? R : mux_out;
  end

endmodule