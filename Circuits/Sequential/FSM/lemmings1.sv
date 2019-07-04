module lemmings1
(
	input clk,
	input areset,
	input bump_left,
	input bump_right,
	output walk_left,
	output walk_right
);

	parameter LEFT = 1'b0, RIGHT = 1'b1;

	reg curr_dir, next_dir;

	always @(posedge clk or posedge areset) begin
		// Freshly brainwashed Lemmings walk left.
		if (areset) begin
			curr_dir <= LEFT;
		end
		else begin
			curr_dir <= next_dir;
		end
	end

	always @(*) begin
		case (curr_dir)
			LEFT: next_dir = bump_left ? RIGHT : LEFT;
			RIGHT: next_dir = bump_right ? LEFT : RIGHT;
		endcase
	end

	assign walk_left = curr_dir == LEFT;
	assign walk_right = curr_dir == RIGHT;

endmodule