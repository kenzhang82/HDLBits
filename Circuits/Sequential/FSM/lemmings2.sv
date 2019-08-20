module lemmings2
(
	input clk,
	input areset,
	input bump_left,
	input bump_right,
	input ground,
	output walk_left,
	output walk_right,
	output aaah
);

	parameter LEFT = 2'd0,
            LEFT_GROUND = 2'd1,
            RIGHT = 2'd2,
            RIGHT_GROUND = 2'd3;

	reg [1:0] curr_dir, next_dir;

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
			LEFT:  next_dir = ground ? (bump_left ? RIGHT : LEFT) : LEFT_GROUND;
			RIGHT: next_dir = ground ? (bump_right ? LEFT : RIGHT) : RIGHT_GROUND;
			LEFT_GROUND:  next_dir = ground ? LEFT : LEFT_GROUND;
			RIGHT_GROUND: next_dir = ground ? RIGHT : RIGHT_GROUND;
		endcase
	end

	assign walk_left = curr_dir == LEFT;
	assign walk_right = curr_dir == RIGHT;
	assign aaah = (curr_dir == LEFT_GROUND) || (curr_dir == RIGHT_GROUND);

endmodule