module fsm_ps2
(
	input clk,
	input [7:0] in,
	input reset,
	output done
);

	// Byte 1 - 3
  parameter [2:0] B1 = 3'h0,
                  B2 = 3'h1,
                  B3 = 3'h2,
                  DONE = 3'h3;

  reg [2:0] state, next_state;

  // State flip-flops
	always @(posedge clk) begin
		if (reset) begin
			state <= B1;
		end
		else begin
			state <= next_state;
		end
	end

	// State transition
	always @(*) begin
		case (state)
			B1: next_state = (in[3]) ? B2 : B1;
			B2: next_state = B3;
			B3: next_state = DONE;
			DONE: next_state = (in[3]) ? B2 : B1;
      default: next_state = B1;
		endcase
	end

	// Output
	assign done = (state == DONE);

endmodule