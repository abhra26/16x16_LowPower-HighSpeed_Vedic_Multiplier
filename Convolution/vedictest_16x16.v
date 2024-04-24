module test_16x16;
reg [15:0] a,b;
wire [31:0] result;

vedic16x16 V0(a, b, result);

wire [31:0] wresult;
wire[15:0]  wa;
wire[15:0] wb;

assign wresult = result;
assign wa = a;
assign wb = b;


initial begin

    $display("TestBench Running...");
	$dumpfile("Mul.vcd");
    $dumpvars(0, test_16x16);

    #20 a= 16'b0000000000110000; b= 16'b0000101000100011;
    
    #20 a= 16'b0000001010100000; b= 16'b0000101000100101;
    
    #20 a= 16'b0000101000010011; b= 16'b0000101001110011;
    
    #20 a= 16'b0000001001000000; b= 16'b0000101000110000;
    
    //#50 $finish; 
end

//always #5 clk = ~clk  ; 

endmodule