module leap_check(
		input  [6:0] year,
		output leap_c
);
	wire w_remain;
	wire w_result;
	division leap (.divisor(4), .dividend(year), .remainder(w_remain), .result(w_result));

	assign leap_c = (w_remain == 0)?1:0;
	
endmodule