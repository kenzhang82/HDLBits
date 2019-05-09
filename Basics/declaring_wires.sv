module declaring_wires
(
  input a,
  input b,
  input c,
  input d,
  output out,
  output out_n
);

  wire or_in1;
  wire or_in2;
  wire or_out;

  assign or_in1 = a & b;
  assign or_in2 = c & d;
  assign or_out = or_in1 | or_in2;
  assign out = or_out;
  assign out_n = ~or_out;


endmodule