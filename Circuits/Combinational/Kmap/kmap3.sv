module kmap3 
(
  input a,
  input b,
  input c,
  input d,
  output out
);

  assign out = a | ((~b) & c);

endmodule