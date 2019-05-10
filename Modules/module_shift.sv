module module_shift (
( 
  input clk, 
  input d, 
  output q
);

  wire q1, q2;
  
  my_dff my_diff_inst1
  (
    .clk(clk),
    .d(d)
    .q(q1)
  );

  my_dff my_dff_inst2
  (
    .clk(clk),
    .d(q1),
    .q(q2),
  );

  my_dff my_dff_inst3
  (
    .clk(clk),
    .d(q2),
    .q(q)
  );


endmodule