module module_add 
(
    input  [31:0] a,
    input  [31:0] b,
    output [31:0] sum  
);
  
  wire [15:0] sum1;
  wire [15:0] sum2;
  wire cout1;

  add16 add16_inst1
  (
    .a(a[15:0]),
    .b(b[15:0]),
    .cin(),
    .sum(sum1),
    .cout(cout1)
  );

  add16 add16_inst2
  (
    .a(a[31:16]),
    .b(b[31:16]),
    .cin(cout1),
    .sum(sum2),
    .cout()
  );

  assign sum = cout1 ? {sum2, sum1} : (sum1 + sum2);

endmodule