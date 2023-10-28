
module lab5task1 (
	input logic MAX10_CLK1_50,
	input logic [1:0] KEY,
	input logic [9:0] SW,
	output logic pwmout,
	output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4
);

logic tick;
logic [3:0] BCD0, BCD1, BCD2, BCD3, BCD4;


clktick tick_50k(
	.clk(MAX10_CLK1_50),
	.N(500),
	.en(1'b1),
	.rst(1'b0),
	.tick(tick)
);

pwm pulse_generator(
	.max(10'd999), 
	.load(tick),
	.clk(MAX10_CLK1_50),
	.data_in(SW),
	.pwm_out(pwmout)
);

bin2bcd_16 bin2bcd(
	.x({6'b0,SW}),
	.BCD0(BCD0),
	.BCD1(BCD1),
	.BCD2(BCD2),
	.BCD3(BCD3),
	.BCD4(BCD4)
);

hexto7seg SEG0(.in(BCD0), .out(HEX0));
hexto7seg SEG1(.in(BCD1), .out(HEX1));
hexto7seg SEG2(.in(BCD2), .out(HEX2));
hexto7seg SEG3(.in(BCD3), .out(HEX3));
hexto7seg SEG4(.in(BCD4), .out(HEX4));

endmodule