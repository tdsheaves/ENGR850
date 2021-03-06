//-----------------------------------------------------------------------------
// This confidential and proprietary software may be used only as authorized
// by a licensing agreement from Synopsys Inc. In the event of publication,
// the following notice is applicable:
//
// (C) COPYRIGHT 2006 Chris Spear and Synopsys Inc.  All rights reserved
//
// The entire notice above must be reproduced on all authorized copies.
//-----------------------------------------------------------------------------
// Testbench for arbiter example
//-----------------------------------------------------------------------------

program automatic test (arb_if.TEST arbif);

    task reset_test();
    begin
      $display("Task reset_test: asserting and checking reset");
      arbif.reset <= 0;
      #100 arbif.reset <= 1;
      arbif.cb.request <= 0;
      repeat (2) @arbif.cb;
      arbif.reset <= 0;
      @arbif.cb;
      a0: assert (arbif.cb.grant == 2'b00);
      end
    endtask


    task request_grant_test();
    $monitor("@%0d: grant=%b", $time, arbif.cb.grant);
    
    // Test out bit 0
    $display("Task request_grant_test: asserting and checking reset");

    ##1 arbif.cb.request <= 2'b01;
    $display("@%0d: Drove req=01", $time);
    repeat (2) @arbif.cb;
    a1: assert (arbif.cb.grant == 2'b01);

    ##1 arbif.cb.request <= 2'b00;
    $display("@%0d: Drove req=00", $time);
    repeat (2) @arbif.cb;
    a2: assert (arbif.cb.grant == 2'b00);

    ##1 arbif.cb.request <= 2'b10;
    $display("@%0d: Drove req=10", $time);
    repeat (2) @arbif.cb;
    a3: assert (arbif.cb.grant == 2'b10);

    ##1 arbif.cb.request <= 2'b00;
    $display("@%0d: Drove req=00", $time);
    repeat (2) @arbif.cb;
    a4: assert (arbif.cb.grant == 2'b00);

    ##1 arbif.cb.request <= 2'b11;
    $display("@%0d: Drove req=11", $time);
    repeat (2) @arbif.cb;
    a5: assert (arbif.cb.grant == 2'b01);

    ##1 arbif.cb.request <= 2'b00;
    $display("@%0d: Drove req=00", $time);
    repeat (2) @arbif.cb;
    a6: assert (arbif.cb.grant == 2'b00);
    endtask


    initial begin
      repeat (10) @arbif.cb;

      reset_test();

      request_grant_test();

      repeat (10) @arbif.cb;
      $finish;

    end
endprogram
