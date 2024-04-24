module adder18(a,b,sum);

input [17:0] a,b;
output [17:0] sum;
wire [17:0] sum;

assign sum = a + b;

endmodule