module test_counter (
  input clk_0,
  input clk_1,
  input i_reg_rstn,
  output [255: 0] o_counter_0,
  output [255: 0] o_counter_1
);

  reg [255: 0] counter_1, counter_2;
  reg [20:0] delay_1, delay_2;

  always@(posedge clk_0 or negedge i_reg_rstn) begin
    if (!i_reg_rstn) begin
      counter_1 <= 0;
      delay_1 <= 0;
    end

    else begin 
      if (delay_1 < 9999) delay_1 <= delay_1 + 1;
      else if (delay_1 == 9999) begin 
        counter_1 <= counter_1 + 1;
        delay_1 <= 0;
      end
    end
  end
  
  always@(posedge clk_1 or negedge i_reg_rstn) begin
    if(!i_reg_rstn) begin
      counter_2 <= 0;
      delay_2 <= 0;
    end

    else begin
      if (delay_2 < 9999) delay_2 <= delay_2 + 1;
      else if (delay_2 == 9999) begin 
        counter_2 <= counter_2 + 1;
        delay_2 <= 0;
      end
    end
  end

  assign o_counter_0 = counter_1;
  assign o_counter_1 = counter_2;

endmodule
