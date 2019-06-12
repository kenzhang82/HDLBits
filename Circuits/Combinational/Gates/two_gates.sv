module two_gates
(
	input in1,
	input in2,
	input in3,
	output out
);

	wire xor1_out;

	assign xor1_out = ~(in1 ^ in2);
	assign out = xor1_out ^ in3;

endmodule