module LUT
(
	input clk,
	input enable,
	input S,
	input A, B, C,
	output Z
);

	reg [0:7] mem = 8'h0;

	always @(posedge clk) begin
		if (enable) begin
      mem <= {S, mem[1:7]};
		end
	end

	assign Z = mem[{A,B,C}];

endmodule