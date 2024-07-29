module priority_encoder #(
  parameter WIDTH = 32,
  parameter WIDTH_W = $clog2(WIDTH)
)(
  input  [WIDTH-1:0] id,
  output reg od_valid,
  output reg [WIDTH-1:0] od_filt,
  output reg [WIDTH_W-1:0] od_bin
);

  integer i;
  reg [WIDTH-1:0] id_r;

  always @* begin
    od_filt = 0;
    od_bin = 0;
    od_valid = 0;

    // Find the highest priority active bit
    for (i = WIDTH-1; i >= 0; i = i - 1) begin
      if (id[i]) begin
        od_filt = 1 << i; // Set only the bit corresponding to the highest priority
        od_bin = i;
        od_valid = 1;
        break;
      end
    end
  end

endmodule
