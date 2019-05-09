module nor_gate (
	input a,
	input b,
  output out
);

  assign out = ~(a | b);

endmodule