module lab4task2(
		input logic [1:0] KEY,
		output logic HEX0, HEX1, HEX2, HEX3, HEX4, HEX5
);
	logic [15:0] count;
	counter #(.WIDTH(16)) CTR16 (
							.clk(MAX10_CLK1_50), // FPGA internal clock
							.rst(~KEY[1]),
							.en(~KEY[0]),
							.count(count)
	);

	bin2bcd_16 (
				.BCD0(BCD0),
				.BCD1(BCD1),
				.BCD2(BCD2),
				.BCD3(BCD3),
				.BCD4(BCD4)
	);

	hexto7seg (
				SEG0 (.out(HEX0), .in(BCD0)),
				SEG1 (.out(HEX1), .in(BCD1)),
				SEG2 (.out(HEX2), .in(BCD2)),
				SEG3 (.out(HEX3), .in(BCD3)),
				SEG4 (.out(HEX4), .in(BCD4))
	);
endmodule
			
