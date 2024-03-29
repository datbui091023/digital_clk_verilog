module ngay( 
			input sig_1Hz,
			input end_day,
			input day_b,//but_day la de tang ngay
			input reset,
			input [3:0] month,
			input leap_year,
			output end_month,// tin hieu da ket thuc 1 thang
			output [4:0] day_o);
			
			
	 //gan gia tri ngay ban dau bang 1
	 reg [4:0] day=1;
	 
	 always@(posedge reset or posedge sig_1Hz)begin
	    if(reset) day=5'd1;
		 else 
				if(day_b|end_day)
					case(month)
						1: begin 
								if (day==31) day<=1;
								else day<=day+1;
							end
						2: begin 
								if (~leap_year && day ==28) day <=1;
								else if(leap_year && day ==29) day<=1;
										else day <=day+1;
							end
						3: begin 
								if (day==31) day<=1;
								else day<=day+1;
							end
						4: begin 
								if (day==30) day<=1;
								else day<=day+1;
							end
						5: begin 
								if (day==31) day<=1;
								else day<=day+1;
							end
						6: begin 
								if (day==30) day<=1;
								else day<=day+1;
							end
						7: begin 
								if (day==31) day<=1;
								else day<=day+1;
							end
						8: begin 
								if (day==31) day<=1;
								else day<=day+1;
							end
						9: begin 
								if (day==30) day<=1;
								else day<=day+1;
							end
						10: begin 
								if (day==31) day<=1;
								else day<=day+1;
							end
						11: begin 
								if (day==30) day<=1;
								else day<=day+1;
							end
						12: begin 
								if (day==31) day<=1;
								else day<=day+1;
							end
						default: day<=1;
					endcase
			end
		
	
		assign end_month= (day==31||
								(day==30 && (month==4||month==6||month==9||month==11)) ||
								(day==29 && month==2 && leap_year)||
								(day==28 && month==2 && ~leap_year))&end_day?1:0;

		assign day_o=day;
endmodule