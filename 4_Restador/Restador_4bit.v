`include "sum4bit.v"

    module restador_4bit (
        input [3:0] A,           // Minuendo de 4 bits
        input  [3:0] B,           // Sustraendo de 4 bits
        input  Sel,         // Préstamo de entrada
        output  [3:0] salida, // Diferencia de 4 bits
        output  Co        // Préstamo de salida final
    );
    // Señales internas para los préstamos
    wire b0, b1, b2, b3;
    wire salida, Co ;
    
    assign b0 = B[0]^Sel;
    assign b1 = B[1]^Sel;
    assign b2 = B[2]^Sel;
    assign b3 = B[3]^Sel;
    


    sum4b s0 (.A(A), .B({b3, b2, b1, b0}), .CI(Sel),  .Cout(Co) ,.Sum(salida));
    
    
    
endmodule