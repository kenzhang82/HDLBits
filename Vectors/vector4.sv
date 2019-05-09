module vector4 
(
  input  [7:0] in,
  output [31:0] out 
);
  
  assign out = in[7]? {{24{1'b1}}, in}: {{24{1'b0}}, in};

endmodule