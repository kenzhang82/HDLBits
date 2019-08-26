module fsm_serialdata
(
  input clk,
  input in,
  input reset,
  output [7:0] out_byte,
  output done
);

  parameter [3:0] IDLE = 4'h0,
                  RX_B0 = 4'h1,
                  RX_B1 = 4'h2,
                  RX_B2 = 4'h3,
                  RX_B3 = 4'h4,
                  RX_B4 = 4'h5,
                  RX_B5 = 4'h6,
                  RX_B6 = 4'h7,
                  RX_B7 = 4'h8,
                  CHK_STOP = 4'h9,
                  OKAY = 4'hA,
                  ERR = 4'hB;

  reg [3:0] state, next_state;
  reg [8:0] rx_data;

  // State flip-flops
  always @(posedge clk) begin
    if (reset) begin
      state <= IDLE;
    end
    else begin
      state <= next_state;
    end
  end

  // State transition
  always @(*) begin
    case (state)
      IDLE: next_state = (in == 1'b0) ? RX_B0 : IDLE;
      RX_B0: next_state = RX_B1;
      RX_B1: next_state = RX_B2;
      RX_B2: next_state = RX_B3;
      RX_B3: next_state = RX_B4;
      RX_B4: next_state = RX_B5;
      RX_B5: next_state = RX_B6;
      RX_B6: next_state = RX_B7;
      RX_B7: next_state = CHK_STOP;
      CHK_STOP: next_state = in ? OKAY : ERR;
      OKAY: next_state = (in == 1'b0) ? RX_B0 : IDLE; // Next batch
      ERR: next_state = in ? IDLE : ERR; // Wait until stop bit present
      default: next_state = IDLE;
    endcase
  end

  assign done = (state == OKAY);

  // Datapath
  always @(posedge clk) begin
    if (reset) begin
      rx_data <= 9'h0;
    end
    else begin
      rx_data <= {in, rx_data[8:1]};
    end
  end

  assign out_byte = rx_data[7:0];

endmodule