module module_cseladd 
(
  input  [31:0] a,
  input  [31:0] b,
  output [31:0] sum
);

  wire [15:0] sum1;
  wire [15:0] sum2_1;
  wire [15:0] sum2_2;
  wire cout1;

  add16 add16_frist
  ( 
    .a(a[15:0]),
    .b(b[15:0]),
    .cin(),
    .sum(sum1),
    .cout(cout1) 
  );

  // Second stage  
  add16 add16_second_1
  ( 
    .a(a[31:16]),
    .b(b[31:16]),
    .cin(1'b1),
    .sum(sum2_1),
    .cout() 
  );

  add16 add16_second_2
  ( 
    .a(a[31:16]),
    .b(b[31:16]),
    .cin(1'b0),
    .sum(sum2_2),
    .cout() 
  );

  // Output mux
  assign sum = cout1 ? {sum2_1, sum1} : {sum2_2, sum1};

endmodule