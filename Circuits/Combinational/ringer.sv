module ringer
(
	input ring,
	input vibrate_mode,
	output reg ringer,    // Make sound
	output reg motor      // Vibrate
);

  assign ringer = ring & (~vibrate_mode);
  assign motor = ring & vibrate_mode;

endmodule