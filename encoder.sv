//The encoder module is designed to produce two outputs, plus1 and minus1, based on the input signals inp_A and inp_B

module encoder(clk,reset,inp_A,inp_B,plus1,minus1);

input wire clk;
input wire reset; 
input wire inp_A, inp_B;	
output reg plus1 = 0, minus1 = 0;

reg regA = 0, regB = 0;	//Registers to store the previous values of inp_A and inp_B, respectively

always @ (posedge clk) begin
	if (reset) begin
		regA <= 0;
		regB <= 0;
		plus1 <= 0;
		minus1 <= 0;
	end
	else begin
		plus1 <= (regA^inp_B)&~(inp_A^regA);
		minus1 <= (inp_A^regA)&~(regA^inp_B);
		regA <= inp_A;
		regB <= inp_B;
	end		
end

end module
