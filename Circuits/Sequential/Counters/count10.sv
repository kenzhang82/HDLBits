module count10
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
			if (q < 4'd9) begin
				q <= q + 1;
			end
			else begin
				q <= 0;
			end
		end
	end

endmodule