module LFSR5 
(
  input clk,
  input reset,
  output [4:0] q
);
  
  always @(posedge clk) begin
    if (reset) begin
      q <= 1;
    end
    else begin
    end
  end

endmodule