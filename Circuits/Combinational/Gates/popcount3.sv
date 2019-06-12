module popcount3 
(
  input [2:0] in,
  output [1:0] out 
);
  
  integer i;
  always @(*) begin
    out = 0;
    for(i = 0; i < 3; i = i + 1) begin: find_ones
      if (in[i]) begin
        out = out + 1;
      end
    end
  end

endmodule