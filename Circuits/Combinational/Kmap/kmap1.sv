module kmap1 
(
  input a,
  input b,
  input c,
  output out 
);

  assign out = a | b | c;

endmodule