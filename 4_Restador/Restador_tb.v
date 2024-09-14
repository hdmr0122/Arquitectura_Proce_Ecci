`include "Restador_4bit.v"
`timescale 1ns / 1ps

module testbench_restador_4bit();

        reg [3:0] A_tb;        // Minuendo
        reg [3:0] B_tb;        // Sustraendo
        reg Sel;            // Préstamo de entrada
        wire [3:0] salida;  // Diferencia
        wire Co;            // Préstamo de salida


        restador_4bit uut (
            .A(A_tb), 
            .B(B_tb), 
            .Sel(Sel), 
            .salida(salida), 
            .Co(Co)
        );


    initial begin
    Sel=1;
    A_tb=0;
    for (B_tb = 0; B_tb < 15; B_tb = B_tb + 1) begin
      if (B_tb==0) begin
        A_tb=A_tb+1;
      end
      #5 $display("el valor de %d - %d = %d", A_tb,B_tb,salida);
    end
    $finish;
  end      

  initial begin: TEST_CASE
		$dumpfile("restador_tb.vcd");
		$dumpvars(-1, uut);
	end

endmodule
