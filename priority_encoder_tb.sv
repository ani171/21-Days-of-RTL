`timescale 1ns / 1ps

module priority_encoder_tb();

  localparam WIDTH = 32;
  localparam WIDTH_W = $clog2(WIDTH);

  logic [WIDTH-1:0] id;
  logic od_valid;
  logic [WIDTH-1:0] od_filt;
  logic [WIDTH_W-1:0] od_bin;

  priority_encoder #(
    .WIDTH(WIDTH),
    .WIDTH_W(WIDTH_W)
  ) uut (
    .id(id),
    .od_valid(od_valid),
    .od_filt(od_filt),
    .od_bin(od_bin)
  );

  initial begin
    id = 32'b0;
    #10;
    
    id = 32'b00000000000000000000000000000001;
    #10;
    
    id = 32'b00000000000000000000000000000010;
    #10;
    
    id = 32'b00000000000000000000000000001100;
    #10;
    
    id = 32'b1;
    #10;
    
    #10;
    $finish;
  end

endmodule
