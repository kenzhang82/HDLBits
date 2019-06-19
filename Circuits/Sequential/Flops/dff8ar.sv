module dff8ar
(
  input            clk,
  input            areset,
  input      [7:0] d,
  output reg [7:0] q
);

	always @ (posedge clk or posedge areset) begin
		if (areset) begin
			q <= 8'b0;
		end
		else begin
			q <= d;
		end
	end

endmodule