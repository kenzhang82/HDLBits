module fsm3s
(
	input clk,
	input in,
	input reset,
	output out
);

	parameter A=0, B=1, C=2, D=3;

	reg [1:0] curr_state, next_state;

	always @(posedge clk) begin
		if (reset) begin
			curr_state <= A;
		end
		else begin
			curr_state <= next_state;
		end
	end

	always @(*) begin
		case (curr_state)
			A: next_state = in ? B : A;
			B: next_state = in ? B : C;
			C: next_state = in ? D : A;
			D: next_state = in ? B : C;
		endcase
	end

	assign out = (curr_state == D);

endmodule