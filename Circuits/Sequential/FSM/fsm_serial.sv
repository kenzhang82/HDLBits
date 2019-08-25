module fsm_serial
(
	input clk,
	input in,
	input reset,
	output done
);

	parameter [1:0] IDLE = 2'b00,
									START = 2'b01,
						      DATA = 2'b10,
						      STOP = 2'b11;

	reg [1:0] state, next_state;
	reg [3:0] rx_count;

	// State flip-flops
	always @(posedge clk) begin
		if (reset) begin
			state <= IDLE;
		end
		else begin
			state <= next_state;
		end
	end

	always @(posedge clk) begin
		if (reset) begin
			rx_count <= 0;
		end
		else begin
			if (state == DATA) begin
				rx_count <= rx_count + 1;
			end
			else begin
				rx_count <= 0;
			end
		end
	end

	// State transition
	always @(*) begin
		case (state)
			IDLE: next_state = (in == 1'b0) ? START : IDLE;
			START: next_state = DATA;
			DATA: next_state = (rx_count == 7) ? STOP : DATA;
			STOP: next_state = (in == 1'b1) ? IDLE : START;
		endcase
	end

	assign done = (state == STOP);

endmodule