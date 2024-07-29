module mux (
  input   logic a,
  input   logic b,
  input   logic s,
  output  logic y
);

  assign y=s?a:b;

endmodule
