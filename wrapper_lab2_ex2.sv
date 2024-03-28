module wrapper_lab2_ex2 (
	input logic [1:0] SW,
	input logic [3:0] KEY,
	output logic [9:0] LEDR
);

lab2_ex2 lab2ex2 (.rst(SW[0]), .w(SW[1]), .clk(KEY[0]), .out(LEDR[9]), .state(LEDR[3:0]));

endmodule
