module gatesv100 
(
  input  [99:0] in,
  output [98:0] out_both,
  output [99:1] out_any,
  output [99:0] out_different
);

  integer i;
  always @(*) begin
    out_both = 0;
    out_any = 0;
    out_different = 0;
    for(i = 1; i <= 99; i = i + 1) begin
      if (in[i] && in[i-1]) begin
        out_both[i-1] = 1;
      end
    end
    for(i = 99; i >= 1; i = i - 1) begin
      if (in[i] || in[i-1]) begin
        out_any[i] = 1;
      end
    end
    for(i = 0; i < 100; i = i + 1) begin
      if (i == 99) begin
        if (in[99] ^ in[0]) begin
          out_different[99] = 1;
        end
      end
      else begin
        if (in[i] ^ in[i+1]) begin
          out_different[i] = 1;
        end
      end
    end
  end

endmodule