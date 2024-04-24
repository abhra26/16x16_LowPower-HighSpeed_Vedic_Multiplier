`include "adder4.v"
`include "adder6.v"
`include "adder8.v"
`include "adder10.v"
`include "adder12.v"
`include "adder18.v"
`include "adder16.v"
`include "halfAdder.v"
`include "vedic2x2.v"
`include "vedic4x4.v"
`include "vedic8x8.v"

module vedic16x16(a, b, result);

input  [15:0] a,b;
output [31:0] result;
wire [31:0] result;

wire [15:0] temp1;
wire [15:0] temp2;
wire [15:0] temp3;
wire [17:0] temp4;
wire [17:0] temp5;
wire [15:0] temp6;
wire [15:0] temp7;

vedic8x8 M1(a[7:0], b[7:0], temp1);
assign result[7:0] = temp1[7:0];

vedic8x8 M2(a[15:8], b[7:0], temp2);
vedic8x8 M3(a[7:0], b[15:8], temp3);

adder18 A1({2'b00, temp2}, {2'b00,temp3}, temp4);
adder18 A2(temp4, {10'b0000000000, temp1[15:8]}, temp5);
assign result[15:8] = temp5[7:0];

vedic8x8 M4(a[15:8], b[15:8], temp6);
adder16 A3(temp6, {6'b000000,temp5[17:8]}, temp7);

assign result[31:16] = temp7;

endmodule