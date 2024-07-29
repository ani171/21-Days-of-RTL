module day2_tb ();

  logic      clk;
  logic      reset;

  logic      d_i;

  logic      q_norst_o;
  logic      q_syncrst_o;
  logic      q_asyncrst_o;

  day2 DAY2 (.*);

  always begin
    #10 clk=~clk;
  end

  initial
    begin
      reset=1'b1;
      d_i=1'b0;
      @(posedge clk);
      reset=1'b0;
      @(posedge clk);
      reset=1'b1;
      d_i=1'b1;
      $finish();
    end
endmodule

      
