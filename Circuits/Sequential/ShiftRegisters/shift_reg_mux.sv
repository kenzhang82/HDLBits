module shift_reg_mux
(
	input [3:0] SW,
	input [3:0] KEY,
	output [3:0] LEDR
);

	reg [3:0] dff_out;

	MUXDFF mux_dff_inst3
	(
		.clk(KEY[0]),
		.E(KEY[1]),
		.L(KEY[2]),
		.w(KEY[3]),
		.R(SW[3]),
		.Q(dff_out[3])
	);

	genvar i;
	generate
		for (i = 0; i < 3; i = i + 1) begin: mux_dffs
			MUXDFF mux_dff_insts
			(
				.clk(KEY[0]),
				.E(KEY[1]),
				.L(KEY[2]),
				.w(dff_out[i+1]),
				.R(SW[i]),
				.Q(dff_out[i])
			);
		end
	endgenerate

	assign LEDR = dff_out;

endmodule

module MUXDFF
(
  input clk,
  input w, R, E, L,
  output Q
);

  reg mux_out;
  reg flop_in;

  always @(posedge clk) begin
    Q <= flop_in;
  end

  always @(*) begin
    mux_out = E ? w : Q;
    flop_in = L ? R : mux_out;
  end

endmodule