module dff_tb ();

  logic      clk;
  logic      reset;

  logic      d;

  logic      q_noreset;
  logic      q_sync;
  logic      q_async;

  dff flip_flop (.*);

  always begin
    #10 clk=~clk;
  end

  initial
    begin
      reset=1'b1;
      d=1'b0;
      @(posedge clk);
      reset=1'b0;
      @(posedge clk);
      reset=1'b1;
      d=1'b1;
      $finish();
    end
endmodule

      
