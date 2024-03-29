module sec_counter(
	input sig_1Hz,      			// 1Hz clk signal
	input reset,
	output [5:0] sec_ctr
);	
	reg [5:0] sec_counter = 6'b0;
	// Seconds counter control
	always@(posedge sig_1Hz or posedge reset)
	begin
		
		if(reset) begin
			sec_counter <= 6'b0;
		end
		else if (sec_counter == 59) begin
				sec_counter <= 6'b0;
				end
				else 
				sec_counter <= sec_counter +1;
	end

	assign sec_ctr = sec_counter;
endmodule
	