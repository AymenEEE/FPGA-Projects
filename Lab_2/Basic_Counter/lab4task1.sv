module lab4task1(
	input logic [0:1] KEY,
	output logic [6:0] HEX0
);
	logic [3:0]			count; //internal signal
	counter CTR (	.clk(~KEY[1]), //ACTIVE LOW KEY1 and KEY2
						.rst(~KEY[0]),
						.en(1'b1),
						.count(count));

hexto7seg SEG0 (	.out(HEX0),
						.in(count));
endmodule