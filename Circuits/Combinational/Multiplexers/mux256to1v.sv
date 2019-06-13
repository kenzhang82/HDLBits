module mux256to1v 
(
  input [1023:0] in,
  input [7:0] sel,
  output [3:0] out  
);
  

  assign out[0] = in[4*sel+0];
  assign out[1] = in[4*sel+1];
  assign out[2] = in[4*sel+2];
  assign out[3] = in[4*sel+3];

endmodule