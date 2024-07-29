module mux_tb();
  logic a;
  logic b;
  logic s;
  logic y;
  
  mux MUX21(.a(a),.b(b),.s(s), .y(y));

  initial begin
    a=1'b1;
    b=1'b0;
    s=1'b1;
    #10;
    a=1'b0;
    s=1'b0;
    #10;
    $finish();    
  end
endmodule

  
