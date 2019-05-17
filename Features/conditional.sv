module conditional 
(
  input [7:0] a, b, c, d,
  output [7:0] min
);

  wire [7:0] ab_min;
  wire [7:0] cd_min;

  assign ab_min = (a < b) ? a : b;
  assign cd_min = (c < d) ? c : d;
  assign min = (ab_min < cd_min) ? ab_min : cd_min;


endmodule