module fsm1
(
	input clk,
	input reset,
	input in,
	output out
);

	parameter A = 1'b0, B = 1'b1;

	reg curr_state, next_state;

	// Synchronous state transition, sequential logic
	always @(posedge clk) begin
		if (reset) begin
			curr_state <= B;
		end
		else begin
			curr_state <= next_state;
		end
	end

	// Next state transition, combinational logic
	always @(*) begin
		case (curr_state)
			A: next_state = in ? A : B;
			B: next_state = in ? B : A;
		endcase
	end

	// Output, combinational logic
	always @(*) begin
		case (curr_state)
			A:  out = 0;
			B: 	out = 1;
		endcase
	end

endmodule