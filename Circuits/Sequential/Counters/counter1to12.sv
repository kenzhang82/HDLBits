module counter1to12
(
	input clk,
	input reset,
	input enable,
	output [3:0] Q,
	output c_enable,
	output c_load,
	output [3:0] c_d
);

	count4 count4_inst
	(
		.clk(clk),
		.enable(c_enable),
		.load(c_load),
		.d(c_d),
		.Q(Q)
	);

	always @(posedge clk) begin
		if (reset) begin
			c_load <= 1;
			c_enable <= 0;
			c_d <= 1;
		end
		else begin
			c_load <= 0;
			if (enable) begin
				c_enable <= 1;
				if (Q == 12) begin

				end
			end
		end
	end

endmodule

// count4 the_counter (clk, c_enable, c_load, c_d /*, ... */ );