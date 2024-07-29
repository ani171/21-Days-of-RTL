// Different DFF

module dff (
  input     logic      clk,
  input     logic      reset,

  input     logic      d,

  output    logic      q_noreset,
  output    logic      q_sync,
  output    logic      q_async
);
  // No reset
  always_ff @ (posedge clk)
    q_noreset<=d;
  //Synchronous 
  always_ff @ (posedge clk)
    begin
      if (reset)
        q_sync<=0;
      else
        q_sync<=d;
    end
  //Asynchronous 
  always_ff @ (posedge clk or posedge reset)
    if(reset)
      q_async<=0;
    else
      q_async<=d;
        
endmodule
