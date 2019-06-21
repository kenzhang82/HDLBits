module edgecapture 
(
  input clk,
  input reset,
  input [31:0] in,
  output [31:0] out
);
  
  reg [31:0] in_capture;
  wire [31:0] rising_edge;

  always @(posedge clk) begin
      in_capture <= in;
  end

  assign rising_edge = in_capture & (~in);

  always @(posedge clk) begin
    if (reset) begin
      out <= 0;
    end
    else begin
      for (int i=0; i<32; i=i+1) begin
        if(rising_edge[i] == 1'b1) begin
          out[i] <= 1'b1;
        end
      end
    end
  end

endmodule