module rotate100 
(
  input clk,
  input load,
  input [1:0] ena,
  input [99:0] data,
  output reg [99:0] q
);

  always @(posedge clk) begin
    if (load) begin
      q <= data;
    end
    else begin
      // Left
      if (ena == 2'b10) begin
        q <= {q[98:0], q[99]};
      end
      // Right
      else if (ena == 2'b01) begin
        q <= {q[0], q[99:1]};
      end
    end
  end

endmodule