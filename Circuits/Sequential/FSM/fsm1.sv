module fsm1
(
	input clk,
	input areset,
	input in,
	output out
);

	parameter A = 1'b0, B = 1'b1;

	reg state;
	// State transition, sequential logic
	always @(posedge clk or posedge areset) begin
		if (areset) begin
			state <= B;
			out <= 1;
		end
		else begin
			case (state)
				A: begin
					if (in) begin
						state <= A;
						out <= 0;
					end
					else begin
						state <= B;
						out <= 1;
					end
				end
				B: begin
					if (in) begin
						state <= B;
						out <= 1;
					end
					else begin
						state <= A;
						out <= 0;
					end
				end
			endcase
		end
	end

endmodule