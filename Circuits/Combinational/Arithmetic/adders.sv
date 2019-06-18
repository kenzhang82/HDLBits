module adders 
(
  input [3:0] x, y,
  output [4:0] sum
);

  wire [3:0] inter_cout;

  fadd fadd0_inst
  (
    .a(x[0]),
    .b(y[0]),
    .cin(1'b0),
    .cout(inter_cout[0]),
    .sum(sum[0])
  );

  genvar i;
  generate
    for (i = 1; i <= 3; i = i + 1) begin: gen_adders
      fadd fadds_inst
      (
        .a(x[i]),
        .b(y[i]),
        .cin(inter_cout[i-1]),
        .cout(inter_cout[i]),
        .sum(sum[i])
      );      
    end
  endgenerate

  assign sum[4] = inter_cout[3];

endmodule

module fadd 
(
  input a, b, cin,
  output cout, sum
);

  assign sum   = a ^ b ^ cin;
  assign cout = ((a ^ b) & cin) | (a & b);

endmodule