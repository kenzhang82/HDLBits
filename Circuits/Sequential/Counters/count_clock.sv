module count_clock 
(
  input clk,
  input reset,
  input ena,
  output pm,
  output [7:0] hh,
  output [7:0] mm,
  output [7:0] ss 
);

  count_60 count_seconds
  (

  );

  count_60 count_minutes
  (
  );

  count_12 count_hours
  (
  );

  always @(posedge clk) begin

  end

endmodule

module count_60
(
  input clk,
  input reset,
  input enable,
  output [5:0] q
);
  
  always @(posedge clk) begin
    if (reset) begin
      q <= 0;
    end
    else begin
      if (enable) begin
        if (q < 6'd59) begin
          q <= q + 1;
        end
        else begin
          q <= 0;
        end
      end
    end
  end

endmodule

module count_12
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
        if (q < 4'd11) begin
          q <= q + 1;
        end
        else begin
          q <= 0;
        end
      end
    end
  end

endmodule