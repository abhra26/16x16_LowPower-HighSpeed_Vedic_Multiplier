module vedic4x4(a, b, result);

input  [3:0] a,b;
output [7:0] result;
wire [7:0] result;

wire [3:0] temp1;
wire [3:0] temp2;
wire [3:0] temp3;
wire [5:0] temp4;
wire [5:0] temp5;
wire [3:0] temp6;
wire [3:0] temp7;
wire [5:0] w1;

vedic_2x2 V1(a[1:0], b[1:0], temp1);
assign result[1:0] = temp1[1:0];

vedic_2x2 V2(a[3:2], b[1:0], temp2);
vedic_2x2 V3(a[1:0], b[3:2], temp3);

assign w1 = {4'b0000, temp1[3:2]};

adder6 A1({2'b00, temp3}, {2'b00, temp2}, temp4);
adder6 A2(temp4, w1, temp5);

assign result[3:2] = temp5[1:0];

vedic_2x2 V4(a[3:2], b[3:2], temp6);

adder4 A3(temp6, temp5[5:2], temp7);
assign result[7:4] = temp7;


endmodule