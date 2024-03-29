module hrs_counter(
	input sig_1Hz,      			// 1Hz clk signal
	input reset,
	input hrs_b,
	input [5:0] min_ctr, 
	input [5:0] sec_ctr,
	output [4:0] hrs_crt,
	output end_day
);	
	reg [4:0] hrs_counter = 5'b00;
	// Hours counter control
	always@(posedge sig_1Hz or posedge reset)
	begin
		
		if(reset) begin
			hrs_counter <= 5'b0;
		end
		else if((min_ctr == 59) && (sec_ctr == 59) || hrs_b ) begin
			if(hrs_counter == 23) begin
				hrs_counter <= 5'b0;
			end
			else hrs_counter <= hrs_counter +1;
		
		end
		
	end
	assign hrs_crt = hrs_counter;
	assign end_day = ((hrs_counter == 23) && (min_ctr == 59) && (sec_ctr == 59))?1:0 ;
endmodule