module countbcd 
(
  input clk,
  input reset,
  output [3:1] ena,
  output [15:0] q  
);
  
  decade_count ones
  (
    .clk(clk),
    .reset(reset),
    .enable(1'b1),
    .q(q[3:0])
  );

  decade_count tens
  (
    .clk(clk),
    .reset(reset),
    .enable(ena[1]),
    .q(q[7:4])
  );

  decade_count hundreds
  (
    .clk(clk),
    .reset(reset),
    .enable(ena[2]),
    .q(q[11:8])
  );

  decade_count thousands
  (
    .clk(clk),
    .reset(reset),
    .enable(ena[3]),
    .q(q[15:12])
  );

  assign ena[1] = (q[3:0] == 4'd9);
  assign ena[2] = ena[1] && (q[7:4] == 4'd9);
  assign ena[3] = ena[2] && (q[11:8] == 4'd9);

endmodule

module decade_count
(
  input clk,
  input reset,
  input enable,
  output [3:0] q
);

  always @(posedge clk) begin
    if (reset) begin
      q <= 0;
    end
    else begin
      if (enable) begin
        if (q < 4'd9) begin
          q <= q + 1;
        end
        else begin
          q <= 0;
        end
      end
    end
  end

endmodule