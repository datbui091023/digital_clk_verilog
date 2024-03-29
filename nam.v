module nam( 
			input sig_1Hz,
			input year_b,//but_month la de tang thang
			input reset,
			
			input end_year,// tin hieu da ket thuc 1 nam
			output end_century,
			output [6:0] year_o);
			
		//nhan dien nut bam   	
	 //gan gia tri thang ban dau bang 1
	 reg [6:0] year=0;
	 
	 always@(posedge reset or posedge sig_1Hz)begin
	    if(reset) year=7'd0;
		 else 
				if(year_b|end_year)
					if(year == 99) year <=1;
					else year<=year+1;
			end
		assign end_century= (year==99 && end_year)?1:0;
		assign year_o=year;
endmodule