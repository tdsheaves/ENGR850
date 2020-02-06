module router_test_top;
  parameter simulation_cycle = 100;

  bit SystemClock;

  router dut(
    .reset_n	(reset_n),
    .clock		(clock),
    .din		(din),
    .frame_n	(frame_n),
    .valid_n	(valid_n),
    .dout		(dout),
    .valido_n	(valido_n),
    .busy_n		(busy_n),
    .frameo_n	(frameo_n)
  );

  initial begin
    SystemClock = 0;
    forever begin
      #(simulation_cycle/2)
        SystemClock = ~SystemClock;
    end
  end

endmodule
