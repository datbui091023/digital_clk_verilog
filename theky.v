module theky( 
			input sig_1Hz,
			input cen_b,//but_month la de tang thang
			input reset,
			
			input end_century,
			output [6:0] cen_o);
			
	 //gan gia tri thang ban dau bang 1
	 reg [6:0] cen=0;
	 
	 always@(posedge reset or posedge sig_1Hz)begin
	    if(reset) cen=7'd0;
		 else 
				if(cen_b|end_century)
					if(cen ==99) cen <=1;
					else cen<=cen+1;
			end
		assign cen_o=cen;
endmodule