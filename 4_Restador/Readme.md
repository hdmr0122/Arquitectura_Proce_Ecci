## Arquitectura de Procesadores Grupo 7
### **Integrantes**:
* Henry Martinez
* Santiago Silva
* Julian Rojas
## Documentacion Restador de 4 bits



### **1. Restador 4 bits**
----------------------------------------------------------------


 Un restador de 4 bits es un circuito digital utilizado para realizar operaciones de sustracción en números binarios de 4 bits. En términos más sencillos, puede restar dos números binarios de 4 bits entre sí.


![Restador](./Nueva%20carpeta/resta1.png)

### 2.Explicacion Codigo Restadorr 4 bits
---------------------------------------------------------------
1.Este código es un módulo en Verilog que implementa un restador de 4 bits utilizando un sumador de 4 bits (sum4bit.v).



```
`include "sum4bit.v"

```
2.Procedemos  a definir nuestras entradas A(Minuendo 4 bits) , B(Sustraendo 4 bits) Y Sel(bit acarreo).

Tambien nuestras salidas salida y Co.

```
module restador_4bit (
        input [3:0] A,      // Minuendo de 4 bits
        input  [3:0] B,    // Sustraendo de 4 bits
        input  Sel,       // Préstamo de entrada
        output  [3:0] salida, // Diferencia de 4 bits
        output  Co        // Préstamo de salida final
    );
```
3.Declaracion de las Señales Internas para ajustar los bits del sustraendo en funcion del prestamo de entrada.
```
 wire b0, b1, b2, b3;
 wire salida, Co ;
    
```
4.Configuracion Sustraendo, En este diseño, para ajustar el sustraendo B se utiliza una operación XOR (^). Esta operación XOR sirve para "negar" los bits del sustraendo en función del bit de préstamo de entrada (Sel).
```
    assign b0 = B[0]^Sel;
    assign b1 = B[1]^Sel;
    assign b2 = B[2]^Sel;
    assign b3 = B[3]^Sel;
    
```
5.Instanciacion del sumador de 4 bits
```
  sum4b s0 (.A(A), .B({b3, b2, b1, b0}), .CI(Sel),  .Cout(Co) ,.Sum(salida));
```

### 3.Implementacion FPGA
---------------------------------------------------
Validamos el diagrama generado por el codigo para aseguranos tanto teoricamente como funcional su correcto funcionamiento.

1.Codigo Quartus
![gtkwave4bits](./Nueva%20carpeta/Cod%20verilog.jpeg)

2.Diagrama Quartus
![gtkwave4bits](./Nueva%20carpeta/Resta%20Diag.jpeg)

3.PinPLaner Distribucion:
![gtkwave4bits](./Nueva%20carpeta/Pinplan.jpeg)

4.Resultados FPGA:
![gtkwave4bits](./Nueva%20carpeta/Fun1.jpeg)
![gtkwave4bits](./Nueva%20carpeta/Fun2.jpeg)

EL modulo restador_4bit utiliza un sumador de 4 bits para llevar a cabo la resta. Primero, modifica los bits del número que se va a restar (B) según el bit de de entrada (Sel). Después, envía estos datos ajustados al sumador de 4 bits para calcular el resultado de la resta y determinar si hubo un préstamo final.esta implementacion permite realizar restas en los sistemas digitales de manera correcta.