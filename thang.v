module thang( 
			input sig_1Hz,
			input end_day,
			input end_month,
			input mon_b,//but_month la de tang thang
			input reset,
			input [4:0] day,
			output end_year,// tin hieu da ket thuc 1 nam
			output [3:0] month_o);
			
			
			

	 //gan gia tri thang ban dau bang 1
	 reg [3:0] month=1;
	 
	 always@(posedge reset or posedge sig_1Hz)begin
	    if(reset) month=4'd1;
		 else 
				if(mon_b|end_month)
					if(month == 12) month <=1;
					else month<=month+1;
			end
		

		assign end_year= ((day==31 && month==12) && end_day)?1:0;
		assign month_o=month;
endmodule