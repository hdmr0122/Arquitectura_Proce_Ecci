
module alu(
     input  [3:0] A,
     input  [3:0] B,
     input  [1:0] sel,
     input  CI,
	  input clk,
     output  reg [7:0] cout
);

//Instancia Operaciones s

wire [3:0] sum_out;

sum4b  sum1 (.A(A),.B(B),.Sum(sum_out));

wire [3:0] rest_out;

restador_4bit  res1(.A(A),.B(B),.salida(rest_out));

wire [7:0] mul_out;

multiplicador mul1(.MR(A),.MD(B),.pp(mul_out)); 

always @(*) begin
     case(sel)
          2'b00: cout = sum_out ;
          2'b01: cout = rest_out ;
          2'b10: cout = mul_out ;

          default : cout = 8'b00000000;  
     endcase
end


endmodule