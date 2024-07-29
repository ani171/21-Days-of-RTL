module day2_tb ();

  logic      clk;
  logic      reset;

  logic      d_i;

  logic      q_norst_o;
  logic      q_syncrst_o;
  logic      q_asyncrst_o;

  day2 DAY2 (.*);
