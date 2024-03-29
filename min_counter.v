module min_counter(
	input sig_1Hz,    			// 1Hz clk signal
	input reset,
	input min_b,
	input [5:0] sec_ctr,
	output [5:0] min_ctr
);	
	reg [5:0] min_counter = 6'b0;
	
	
	// Minutes counter control
	always@(posedge sig_1Hz or posedge reset)
	begin
		
		if(reset) begin
			min_counter <= 6'b0;
		end
		else begin
			if((sec_ctr == 59) || min_b) begin
				if(min_counter == 59) begin
					min_counter <= 6'b0;
				end
				else min_counter <= min_counter+1;
			end
		end
	end
	assign min_ctr = min_counter;
endmodule