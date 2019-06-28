module count_clock
(
  input clk,
  input reset,
  input ena,
  output pm,
  output [7:0] hh,
  output [7:0] mm,
  output [7:0] ss
);
  
  always @(posedge clk) begin
    if (reset) begin
      // Reset values
      pm <= 0;
      hh <= 8'h12;
      mm <= 8'h00;
      ss <= 8'h00;
    end
    else begin
      if (ena) begin
        // Seconds
        if (ss < 8'h59) begin
          if (ss[3:0] < 4'h9) begin
            ss[3:0] <= ss[3:0] + 1'h1;
          end
          else begin
            ss[3:0] <= 0;
            ss[7:4] <= ss[7:4] + 1'h1;
          end
        end
        // Second roll-over
        else begin
          ss <= 0;
          // Minutes
          if (mm < 8'h59) begin
            if (mm[3:0] < 4'h9) begin
              mm[3:0] <= mm[3:0] + 1'h1;
            end
            else begin
              mm[3:0] <= 0;
              mm[7:4] <= mm[7:4] + 1'h1;
            end
          end
          // Hour roll-over
          else begin
            mm <= 0;
            // AM - PM switch
            if (hh == 8'h11) begin
              pm <= ~pm;
            end
            // Hours
            if (hh < 8'h12) begin
              if (hh[3:0] < 4'h9) begin
                hh[3:0] <= hh[3:0] + 1'h1;
              end
              else begin
                hh[3:0] <= 0;
                hh[7:4] <= hh[7:4] + 1'h1;
              end
            end
            // 12 -> 1 roll-over
            else begin
              hh <= 1'h1;
            end
          end
        end
      end
    end
  end

endmodule