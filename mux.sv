module mux (
  input   logic [7:0]    a,
  input   logic [7:0]    b,
  input   logic          s,
  output  logic [7:0]    y
);

  assign y=s?a:b;

endmodule
