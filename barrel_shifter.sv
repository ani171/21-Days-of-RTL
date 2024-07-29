module barrel_shifter #( parameter
  DATA_W = 32,
  DIST_W = $clog2(DATA_W)
)(
  input clk,                        
  input nrst,                       // negative reset
  input ena,                        // enable
  input l_nr,                       // shift left or right
  input [DIST_W-1:0] dst,           // shift distance in bits

  input [DATA_W-1:0] id,            // input data vector
  output logic [DATA_W-1:0] od = '0 // shifted data vector
);

  always_ff @(posedge clk) begin
    if( ~nrst ) begin
      od[DATA_W-1:0] <= '0;
    end else begin
      if( ena ) begin

        if( l_nr ) begin
          od[DATA_W-1:0] <= ({2{id[DATA_W-1:0]}} << dst[DIST_W-1:0]) >> DATA_W;
        end else begin
          od[DATA_W-1:0] <= {2{id[DATA_W-1:0]}} >> dst[DIST_W-1:0];
        end

      end 
    end 
  end

endmodule
