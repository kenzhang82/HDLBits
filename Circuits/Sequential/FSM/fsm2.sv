module fsm2
(
	input clk,
	input areset,
	input j,
	input k,
	output out
);

	parameter OFF=0, ON=1;

	reg state;

	// State transition, sequential logic
	always @(posedge clk or posedge areset) begin
		if (areset) begin
			state <= OFF;
		end
		else begin
			case (state)
				OFF: begin
					if (j) begin
						state <= ON;
					end
					else begin
						state <= OFF;
					end
				end
				ON: begin
					if (k) begin
						state <= OFF;
					end
					else begin
						state <= ON;
					end
				end
			endcase
		end
	end

	// Outputs, combinational logic
	always @(*) begin
		if (areset) begin
			out = 0;
		end
		else begin
			case (state)
				OFF: out = 0;
				ON : out = 1;
			endcase
		end
	end

endmodule