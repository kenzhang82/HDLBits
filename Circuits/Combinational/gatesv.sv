module gatesv
(
	input [3:0] in,
	output [2:0] out_both,
	output [3:1] out_any,
	output [3:0] out_different
);

	integer i;
	always @(*) begin
		out_both = 0;
		out_any = 0;
		out_different = 0;
		for(i = 1; i <= 3; i = i + 1) begin
			if (in[i] && in[i-1]) begin
				out_both[i] = 1;
			end
		end
		for(i = 3; i >= 1; i = i - 1) begin
			if (in[i] || in[i-1]) begin
				out_any[i] = 1;
			end
		end
		for(i = 0; i < 5; i = i + 1) begin
			if (i == 4) begin
				if (in[i-1] ^ in[0]) begin
					out_different[3] = 1;
				end
			end
			else begin
				if (in[i] ^ in[i+1])
			end
		end
	end

endmodule