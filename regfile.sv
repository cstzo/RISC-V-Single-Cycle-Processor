`timescale 1ns / 1ps

module regfile(input logic rst, clk, wr_en,
	input logic [2:0] rd0_addr, rd1_addr, wr_addr,
	input logic [15:0] wr_data,
	output logic [15:0] rd0_data, rd1_data);

	reg [15:0] reg_vals [0:7];

	int i;

	always_ff @(posedge clk, posedge rst)
	begin
		if (rst)
		begin
			for (i = 0; i < 7; i = i + 1)
			reg_vals[i] <= 0;
		end
		else if (wr_en)     
			reg_vals[wr_addr] <= wr_data;
	end
	
	always_comb
	begin
	    rd0_data <= reg_vals[rd0_addr];
		rd1_data <= reg_vals[rd1_addr];
	end

endmodule