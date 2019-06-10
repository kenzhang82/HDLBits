module bcdadd100
(
	input [399:0] a, b,
	input cin,
	output cout,
	output [399:0] sum
);

	wire [99:0] carry;

	bcd_fadd bcd_fadd_0
	(
		.a(a[1*4-1:0]),
		.b(b[1*4-1:0]),
		.cin(cin),
		.cout(carry[0]),
		.sum(sum[1*4:0])
	);

	genvar i;

	generate
		for(i = 1; i <= 99; i = i + 1) begin: bcd_full_adders
			bcd_fadd bcd_fadd_inst
			(
				.a(a[ 4*(i+1)-1 : i*4 ]),
				.b(b[ 4*(i+1)-1 : i*4 ]),
				.cin(carry[i-1]),
				.cout(carry[i]),
				.sum(sum[ 4*(i+1)-1 : i*4 ])
			);
		end
	endgenerate

	assign cout = carry[99];

endmodule