module LFSR5
(
  input clk,
  input reset,
  output [4:0] q
);

  always @(posedge clk) begin
    if (reset) begin
      q <= 1;
    end
    else begin
    	q[4] <= 1'b0 ^ q[0];
    	q[3] <= q[4];
    	q[2] <= q[3] ^ q[0];
    	q[1] <= q[2];
    	q[0] <= q[1];
    end
  end

endmodule