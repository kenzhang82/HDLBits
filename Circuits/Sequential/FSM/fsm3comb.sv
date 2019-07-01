module fsm3comb
(
	input in,
	input [1:0] state,
	output [1:0] next_state,
	output out
);

	parameter A=2'b00, B=2'b01, C=2'b10, D=2'b11;

	// state transition
	always @(*) begin
		case (state)
			A: next_state = in ? B : A;
			B: next_state = in ? B : C;
			C: next_state = in ? D : A;
			D: next_state = in ? B : C;
		endcase
	end

	// Output
	always @(*) begin
		case (state)
			A: out = 0;
			B: out = 0;
			C: out = 0;
			D: out = 1;
		endcase
	end

endmodule