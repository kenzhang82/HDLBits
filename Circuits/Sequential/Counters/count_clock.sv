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

  // Seconds
  always @(posedge clk) begin
    if (reset) begin
      ss[3:0] <= 0;
      ss[7:4] <= 0;
    end
    else begin
      if (ss[3:0] < 4'd9) begin
        ss[3:0] <= ss[3:0] + 1'b1;
      end
      else begin
        ss[3:0] <= 0;
        if (ss[7:4] < 4'd5) begin
          ss[7:4] <= ss[7:4] + 1'b1;
        end
        else begin
          ss[7:4] <= 0;
        end
      end
    end
  end

  // Minutes
  always @(posedge clk) begin
    if (reset) begin
      mm[3:0] <= 0;
      mm[7:4] <= 0;
    end
    else begin
      if (ena && (ss[7:4]==4'd5) && (ss[3:0]==4'd9)) begin
        if (mm[3:0] < 4'd9) begin
          mm[3:0] <= mm[3:0] + 1'b1;
        end
        else begin
          mm[3:0] <= 0;
          if (mm[7:4] < 4'd5) begin
            mm[7:4] <= mm[7:4] + 1'b1;
          end
          else begin
            mm[7:4] <= 0;
          end
        end
      end
    end
  end

  // Hours
  always @(posedge clk) begin
    if (reset) begin
      hh[3:0] <= 2;
      hh[7:4] <= 1;
      pm <= 0;
    end
    else begin
      if (ena && (ss[7:4]==4'd5) && (ss[3:0]==4'd9) &&
                 (mm[7:4]==4'd5) && (mm[3:0]==4'd9)) begin
      	if (hh < 8'h12) begin
      		if (hh[3:0] < 4'd9) begin
      			hh[3:0] <= hh[3:0] + 1'b1;
      		end
      		else begin
      			hh[3:0] <= 0;
      			if (hh[7:4] < 4'd1) begin
      				hh[7:4] <= hh[7:4] + 1'b1;
      			end
      			else begin
      				hh[7:4] <= 0;
      			end
      		end
      	end
      	else begin
      		hh[3:0] <= 1;
      		hh[7:4] <= 0;
      	end
      end
    end
  end

endmodule