module kmap2 
(
  input a,
  input b,
  input c,
  input d,
  output out
);

  assign out = ((~b)&(~c)) | ((~a) & (~d)) | (b & c & d) | (a & (~b) & d);

endmodule