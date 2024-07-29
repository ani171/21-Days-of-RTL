`timescale 1ns / 1ps

module encoder_tb();

  localparam CLK_PERIOD = 10;

  logic clk;
  logic reset;
  logic inp_A;
  logic inp_B;

  logic plus1;
  logic minus1;

  encoder uut (
    .clk(clk),
    .reset(reset),
    .inp_A(inp_A),
    .inp_B(inp_B),
    .plus1(plus1),
    .minus1(minus1)
  );

  initial begin
    clk = 0;
    forever #(CLK_PERIOD / 2) clk = ~clk;
  end

  initial begin
    reset = 1;
    inp_A = 0;
    inp_B = 0;

    #15;
    reset = 0;
    
    inp_A = 1;
    inp_B = 0;
    #20;
    
    inp_A = 0;
    inp_B = 1;
    #20;

    inp_A = 1;
    inp_B = 1;
    #20;
    
    #10;
    $finish;
  end

endmodule
