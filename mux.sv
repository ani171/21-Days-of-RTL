module mux (
  input   wire [7:0]    a,
  input   wire [7:0]    b,
  input   wire          s,
  output  wire [7:0]    y
);

  assign y=s?a:b;

endmodule
