module edgedetect 
(
  input clk,
  input [7:0] in,
  output [7:0] pedge 
);

  reg [7:0] in_capture;

  always @(posedge clk) begin
    in_capture <= in;
    pedge <= (~in_capture) & in;
  end

endmodule