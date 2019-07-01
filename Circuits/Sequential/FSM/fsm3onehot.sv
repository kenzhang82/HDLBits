module fsm3onehot
(
	input in,
	input [3:0] state,
	output [3:0] next_state,
	output out
);

	parameter A=0, B=1, C=2, D=3;

	assign next_state[A] = (state[A] & (~in)) | (state[C] & (~in));
	assign next_state[B] = (state[A] & in) | (state[B] & in) | (state[D] & in);
	assign next_state[C] = (state[B] & (~in)) | (state[D] & (~in));
	assign next_state[D] = state[C] & in;

	assign out = state[D] ? 1 : 0;

endmodule