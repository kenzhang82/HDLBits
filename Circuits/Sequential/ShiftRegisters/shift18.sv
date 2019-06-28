module shift18 
(
  input clk,
  input load,
  input ena,
  input [1:0] amount,
  input [63:0] data,
  output reg [63:0] q
);
  
  always @(posedge clk) begin
    if (load) begin
      q <= data;
    end
    else begin
      if (ena) begin
        case (amount)
          2'b00: begin
            // shift left by 1 bit
            q <= q << 1;
          end
          2'b01: begin
            // shift left by 8 bits
            q <= q << 8;
          end
          2'b10: begin
            // shift right by 1 bit
            q <= {q[63], q[63:1]};
          end
          2'b11: begin
            q <= {{8{q[63]}}, q[63:8]};
          end
        endcase
      end
    end
  end

endmodule