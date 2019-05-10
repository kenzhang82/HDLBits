module module_pos (
  input a, 
  input b, 
  input c,
  input d,
  output out1,
  output out2
);

  mod_a mod_inst (out1, out2, a, b, c, d);

endmodule