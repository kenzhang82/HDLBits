module simple_circuit2
(
	input x,
	input y,
	output z
);

	assign z = ~(x ^ y);

endmodule