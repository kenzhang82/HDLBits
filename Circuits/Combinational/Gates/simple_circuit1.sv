module simple_circuit1
(
	input x,
	input y,
	output z
);

	assign z = (x ^ y) & x;

endmodule