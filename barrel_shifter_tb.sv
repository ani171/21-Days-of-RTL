`timescale 1ns / 1ps

module barrel_shifter_tb();

  localparam DATA_W = 32;
  localparam DIST_W = $clog2(DATA_W);

  logic clk;
  logic nrst;
  logic ena;
  logic l_nr;
  logic [DIST_W-1:0] dst;
  logic [DATA_W-1:0] id;
  logic [DATA_W-1:0] od;

  barrel_shifter #(
    .DATA_W(DATA_W),
    .DIST_W(DIST_W)
  ) dut (
    .clk(clk),
    .nrst(nrst),
    .ena(ena),
    .l_nr(l_nr),
    .dst(dst),
    .id(id),
    .od(od)
  );

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    nrst = 0;
    ena = 0;
    l_nr = 0;
    dst = 0;
    id = 0;

    #10;
    nrst = 1;
    #10;
    
    ena = 1;
    l_nr = 1;
    id = 32'hA5A5A5A5;
    dst = 8;
    #10;
    
    ena = 1;
    l_nr = 0;
    id = 32'h12345678;
    dst = 4;
    #10;
    
    #10;
    $finish;
  end

endmodule
