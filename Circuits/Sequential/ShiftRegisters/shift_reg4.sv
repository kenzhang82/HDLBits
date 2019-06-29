module shift_reg4
(
	input clk,
	input resetn,
	input in,
	output out
);

	reg [3:0] pipe;

	// 4-stage pipeline
	always @(posedge clk) begin
		if (~resetn) begin
			pipe <= 0;
			out <= 0;
		end
		else begin
			pipe[3] <= in;
			pipe[2] <= pipe[3];
			pipe[1] <= pipe[2];
			pipe[0] <= pipe[1];
			out <= pipe[0];
		end
	end

endmodule