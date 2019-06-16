module hadd 
(
  input a, b,
  output cout, sum
);

  assign {cout, sum} = a + b;


endmodule