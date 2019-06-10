module combine_circuits
(
	input x,
	input y,
	output z
);

	wire ia1_out;
	wire ib1_out;
	wire ia2_out;
	wire ib2_out;
	wire xor_in1;
	wire xor_in2;

	A IA1
	(
		.x(x),
		.y(y),
		.z(ia1_out)
	);

	B IB1
	(
		.x(x),
		.y(y),
		.z(ib1_out)
	);

	A IA2
	(
		.x(x),
		.y(y),
		.z(ia2_out)
	);

	B IB2
	(
		.x(x),
		.y(y),
		.z(ib2_out)
	);

	assign xor_in1 = ia1_out | ib1_out;
	assign xor_in2 = ia2_out & ib2_out;
	assign z = xor_in1 ^ xor_in2;

endmodule

module A
(
	input x,
	input y,
	output z
);

	assign z = (x ^ y) & x;

endmodule

module B
(
	input x,
	input y,
	output z
);

	assign z = ~(x ^ y);

endmodule