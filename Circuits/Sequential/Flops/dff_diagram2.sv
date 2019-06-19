module dff_diagram2 
(
  input clk,
  input d, 
  input r,
  output q
);

  always @(posedge clk) begin
    if (r) begin
      q <= 0;
    end
    else begin
      q <= d;
    end
  end

endmodule