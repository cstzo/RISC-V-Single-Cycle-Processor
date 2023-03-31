`timescale 1ns / 1ps

module TwoToOneMux(input logic [15:0] a, b,
	input logic sel_mux,
	output logic [15:0] out);

    always_comb
	    out <= sel_mux ? b : a;

endmodule