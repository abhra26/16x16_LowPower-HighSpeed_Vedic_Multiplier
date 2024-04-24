module vedic8x8(a, b, result);

input  [7:0] a,b;
output [15:0] result;
wire [15:0] result;

wire [7:0] temp1;
wire [7:0] temp2;
wire [7:0] temp3;
wire [9:0] temp4;
wire [9:0] temp5;
wire [7:0] temp6;
wire [7:0] temp7;

vedic4x4 M1(a[3:0], b[3:0], temp1);
assign result[3:0] = temp1[3:0];

vedic4x4 M2(a[7:4], b[3:0], temp2);
vedic4x4 M3(a[3:0], b[7:4], temp3);

adder10 A1({2'b00, temp2}, {2'b00,temp3}, temp4);
adder10 A2(temp4, {6'b000000, temp1[7:4]}, temp5);
assign result[7:4] = temp5[3:0];

vedic4x4 M4(a[7:4], b[7:4], temp6);
adder8 A3(temp6, {2'b00,temp5[9:4]}, temp7);

assign result[15:8] = temp7;

endmodule