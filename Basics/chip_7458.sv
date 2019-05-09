module chip_7458 
( 
  input p1a, 
  input p1b, 
  input p1c, 
  input p1d, 
  input p1e, 
  input p1f,
  input p2a, 
  input p2b, 
  input p2c, 
  input p2d,
  output p1y,
  output p2y 
);

  wire left_or_in1;
  wire left_or_in2;
  wire right_or_in1;
  wire right_or_in2;

  assign left_or_in1 = p2c & p2d;
  assign left_or_in2 = p2a & p2b;

  assign p2y = left_or_in1 | left_or_in2;

  assign right_or_in1 = p1a & p1b & p1c;
  assign right_or_in2 = p1d & p1e & p1f;

  assign p1y = right_or_in1 | right_or_in2;

endmodule