module dff16e
(
	input clk,
	input resetn,
	input [1:0] byteena,
	input [15:0] d,
	output [15:0] q
);

	reg [15:0] stored_input;

	always @ (posedge clk) begin
		if (~resetn) begin
			q <= 16'b0;
		end
		else begin
			// FIXME
		end
	end

endmodule