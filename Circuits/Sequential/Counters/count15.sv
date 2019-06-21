module count15 
(
  input clk,
  input reset,
  output [3:0] q 
);

  always @(posedge clk) begin
    if (reset) begin
      q <= 0;
    end
    else begin
      q <= q + 1;
    end
  end

endmodule