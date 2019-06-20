module edgedetect2 
(
  input clk,
  input [7:0] in,
  output [7:0] anyedge
);

  reg [7:0] in_capture;

  always @(posedge clk) begin
    in_capture <= in;
    anyedge <= in ^ in_capture;
  end

endmodule