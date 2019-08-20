module lemmings4
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

  parameter [2:0] LEFT = 3'b000, 
                  RIGHT = 3'b001, 
                  LEFT_GROUND = 3'b010, 
                  RIGHT_GROUND = 3'b011, 
                  LEFT_DIG = 3'b100, 
                  RIGHT_DIG = 3'b101,
                  DEATH = 3'b110;
                
  reg [2:0] curr_dir, next_dir;
  reg [31:0] aaah_count;

  always @(posedge clk or posedge areset) begin
    // Freshly brainwashed Lemmings walk left.
    if (areset) begin
      curr_dir <= LEFT;
    end
    else begin
      curr_dir <= next_dir;
    end
  end

  always @(posedge clk) begin
    if (areset) begin
      aaah_count <= 0;
    end
    else if (curr_dir == LEFT_GROUND || curr_dir == RIGHT_GROUND) begin
      aaah_count <= aaah_count + 1;
    end
    else begin
      aaah_count <= 0;
    end
  end

  always @(*) begin
    case(curr_dir)
      LEFT: next_dir = ground ? (dig ? LEFT_DIG : (bump_left ? RIGHT : LEFT)): LEFT_GROUND;
      RIGHT: next_dir = ground ? (dig ? RIGHT_DIG : (bump_right ? LEFT : RIGHT)) : RIGHT_GROUND;
      LEFT_GROUND: next_dir = ground ? (aaah_count >= 20 ? DEATH : LEFT) : LEFT_GROUND;
      RIGHT_GROUND: next_dir = ground ? (aaah_count >= 20 ? DEATH : RIGHT) : RIGHT_GROUND;
      LEFT_DIG: next_dir = ground ? LEFT_DIG : LEFT_GROUND;
      RIGHT_DIG: next_dir = ground ? RIGHT_DIG : RIGHT_GROUND;
      DEATH: next_dir = DEATH;
    endcase
  end

  assign walk_left = curr_dir == LEFT;
  assign walk_right = curr_dir == RIGHT;
  assign aaah = (curr_dir == LEFT_GROUND) || (curr_dir == RIGHT_GROUND);
  assign digging = (curr_dir == LEFT_DIG) || (curr_dir == RIGHT_DIG);

endmodule