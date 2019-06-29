// 32-bit Galois LFSR with taps at bit positions 32, 22, 2, and 1.

module LFSR32
(
	input clk,
	input reset, // Active-high synchronous reset to 32'h1
	output [31:0] q
);

	integer i;
	generate
		always @(posedge clk) begin
			if (reset) begin
				q <= 32'h1;
			end
			else begin
				for (i = 1; i <= 32; i = i + 1) begin: gen_tap
					if (i == 32) begin
						q[i-1] <= 1'b0 ^ q[0];
					end
					else if ((i == 22) || (i == 2) || (i == 1)) begin
						q[i-1] <= q[i] ^ q[0];
					end
					else begin
						q[i-1] <= q[i];
					end
				end
			end
		end
	endgenerate

endmodule