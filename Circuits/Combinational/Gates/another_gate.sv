module another_gate
(
	input in1,
	input in2,
	output out
);

	assign out = in1 & (~in2);

endmodule