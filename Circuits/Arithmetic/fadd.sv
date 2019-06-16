module fadd 
(
  input a, b, cin,
  output cout, sum
);

  assign sum   = a ^ b ^ cin;
  assign cout = ((a ^ b) & cin) | (a & b);

endmodule