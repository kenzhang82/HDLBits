module fsm_ps2data
(
	input clk,
	input [7:0] in,
	input reset,
	output [23:0] out_bytes,
	output done
);

	// Byte 1 - 3
  parameter [2:0] B1 = 2'b00,
                  B2 = 2'b01,
                  B3 = 2'b10,
                  DONE = 2'b11;

  reg [2:0] state, next_state;
  reg [23:0] incoming_bytes;

  // State flip-flops
	always @(posedge clk) begin
		if (reset) begin
			state <= B1;
		end
		else begin
			state <= next_state;
			// Shift register
			incoming_bytes <= {incoming_bytes[15:0], in};
		end
	end

	// State transition
	always @(*) begin
		case (state)
			B1: next_state = (in[3]) ? B2 : B1;
			B2: next_state = B3;
			B3: next_state = DONE;
			DONE: next_state = (in[3]) ? B2 : B1;
		endcase
	end

	// Output
	assign done = (state == DONE);
	assign out_bytes = incoming_bytes;

endmodule