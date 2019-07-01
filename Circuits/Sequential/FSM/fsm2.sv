module fsm2
(
	input clk,
	input areset,
	input j,
	input k,
	output out
);

	parameter OFF=0, ON=1;

	reg curr_state, next_state;

	// Synchronous state transition, sequential logic
	always @(posedge clk or posedge areset) begin
		if (areset) begin
			curr_state <= OFF;
		end
		else begin
			curr_state <= next_state;
		end
	end

	// Next state transition, combinational logic
	always @(*) begin
		case (curr_state)
			OFF: next_state = j ? ON : OFF;
			ON : next_state = k ? OFF : ON;
		endcase
	end

	// Output, combinational logic
	always @(*) begin
		case (curr_state)
			OFF: out = 0;
			ON : out = 1;
		endcase
	end

endmodule