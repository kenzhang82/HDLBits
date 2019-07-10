module lemmings3
(
  input clk,
  input areset,
  input bump_left,
  input bump_right,
  input ground,
  input dig,
  output walk_left,
  output walk_right,
  output aaah,
  output digging
);

  parameter LEFT = 3'b000, RIGHT = 3'b001, LEFT_GROUND = 3'b010, RIGHT_GROUND = 3'b011, LEFT_DIG = 3'b100, RIGHT_DIG = 3'b101;

  reg [2:0] curr_dir, next_dir;

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
      LEFT : begin
        // Priority: fall > dig > switch direction
        if(!ground)
          next_dir = LEFT_GROUND;
        else if(dig && ground)
          next_dir = LEFT_DIG;
        else if(bump_left)
          next_dir = RIGHT;
        else
          next_dir = LEFT;
        end
      RIGHT: begin
        if(!ground)
          next_dir = RIGHT_GROUND;
        else if(dig && ground)
          next_dir = RIGHT_DIG;
        else if(bump_right)
          next_dir = LEFT;
        else 
          next_dir = RIGHT;
      end
      LEFT_DIG: begin
        if(!ground)
          next_dir = LEFT_GROUND;
        else
          next_dir = LEFT_DIG;
      end
      RIGHT_DIG: begin
        if(!ground)
          next_dir = RIGHT_GROUND;
        else
          next_dir = RIGHT_DIG;
      end
      LEFT_GROUND: begin
        if (ground)
          next_dir = LEFT;
        else
          next_dir = LEFT_GROUND;
      end
      RIGHT_GROUND: begin
        if (ground)
          next_dir = RIGHT;
        else
          next_dir = RIGHT_GROUND;
      end
    endcase
  end

  assign walk_left = curr_dir == LEFT;
  assign walk_right = curr_dir == RIGHT;
  assign aaah = (curr_dir == LEFT_GROUND) || (curr_dir == RIGHT_GROUND);
  assign digging = (curr_dir == LEFT_DIG) || (curr_dir == RIGHT_DIG);

endmodule