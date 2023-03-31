`timescale 1ns / 1ps

module program_counter(input logic clk, rst, take_branch,
    input logic [8:0] offset,
	output logic [8:0] pc);

	always_ff @(posedge clk, posedge rst)
		if (rst) pc <= 0;
		else if (take_branch) pc <= pc + offset;
		else pc <= pc + 1;

endmodule