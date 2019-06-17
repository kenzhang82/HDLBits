module add_ovrflow_det 
(
  input signed [7:0] a,
  input signed [7:0] b,
  output signed [7:0] s,
  output overflow 
);

  wire cout;

  assign {cout, s} = a + b; 
  assign overflow = cout ^ s[7];

endmodule