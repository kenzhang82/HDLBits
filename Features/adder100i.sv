module adder100i
(
	input      [99:0] a, b,
	input             cin,
	output     [99:0] cout,
	output reg [99:0] sum
);

	full_adder full_adder_0
	(
		.a(a[0]),
		.b(b[0]),
		.cin (cin),
		.cout(cout[0]),
		.sum (sum[0])
	);

	genvar i;
	generate
		for (i = 1; i <= 99; i = i + 1) begin: full_adders
			full_adder full_adder_inst
			(
				.a(a[i]),
				.b(b[i]),
				.cin(cout[i-1]),
				.cout(cout[i]),
				.sum(sum[i])
			);
		end
	endgenerate

endmodule

module full_adder
(
	input  a,
	input  b,
	input  cin,
	output cout,
	output sum
);

	assign sum = a ^ b ^ cin;
	assign cout = ((a ^ b) & cin) | (a & b);

endmodule