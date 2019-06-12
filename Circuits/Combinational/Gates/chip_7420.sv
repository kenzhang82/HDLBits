module chip_7420
(
  input p1a, p1b, p1c, p1d,
  output p1y,
  input p2a, p2b, p2c, p2d,
  output p2y
);

	assign p1y = ~(p1a & p1b & p1c & p1d);
	assign p2y = ~(p2d & p2c & p2b & p2a);

endmodule