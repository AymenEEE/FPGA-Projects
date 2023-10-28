module lab4task3(
		//input logic rst,
		input logic [1:0] KEY,
		output logic [6:0] HEX0, HEX1
		
);
	
	logic [7:1] data_out;
	
	sreg7 jeffery(
		.clk(~KEY[1]),
		.rst(~KEY[0]),
		.data_out(data_out)
);

hexto7seg SEG0(.out(HEX0), .in(data_out[4:1]));
hexto7seg SEG1(.out(HEX1), .in({1'b0,data_out[7:5]}));
endmodule
