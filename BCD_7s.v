module BCD_7s(

	input [5:0] sec_ctr, min_ctr,
	input [4:0] hrs_ctr,
	input [3:0] month_o, 
	input [6:0] year_o,
	input [4:0] day_o,
	input [6:0] cen_o,
	
	output [6:0] sec1s, sec10s,
	output [6:0] min1s, min10s,
	output [6:0] hrs1s, hrs10s,
	output [6:0] day1s, day10s,
	output [6:0] mon1s, mon10s,
	output [6:0] year1s,year10s,
	output [6:0] cen1s, cen10s
);
	wire [3:0] w_sec1s, w_sec10s;
	wire [3:0] w_min1s, w_min10s;
	wire [3:0] w_hrs1s, w_hrs10s;
	wire [3:0] w_day1s, w_day10s;
	wire [3:0] w_mon1s, w_mon10s;
	wire [3:0] w_year1s, w_year10s;
	wire [3:0] w_cen1s, w_cen10s;


// convert Binary to BCD
	
	division   sec(.divisor(10), .dividend(sec_ctr), 
				  .remainder(w_sec1s), .result(w_sec10s));
				  
	division   min(.divisor(10), .dividend(min_ctr), 
				  .remainder(w_min1s), .result(w_min10s));
				  
	division   hrs(.divisor(10), .dividend(hrs_ctr), 
				  .remainder(w_hrs1s), .result(w_hrs10s));
				  
	division   day(.divisor(10), .dividend(day_o), 
				  .remainder(w_day1s), .result(w_day10s));
	
	division   mon(.divisor(10), .dividend(mon_o), 
				  .remainder(w_mon1s), .result(w_mon10s));	
				  
	division   year(.divisor(10), .dividend(year_o), 
				  .remainder(w_year1s), .result(w_year10s));
	
	division   cen(.divisor(10), .dividend(cen_o), 
				  .remainder(w_cen1s), .result(w_cen10s));
				  
	// BCD
	
	decoder second1s (.sw(w_sec1s),.led(sec1s));
	decoder second10s (.sw(w_sec10s),.led(sec10s));
	
	decoder minute1s (.sw(w_min1s),.led(min1s));
	decoder minute10s (.sw(w_min10s),.led(min10s));
	
	decoder hour1s (.sw(w_hrs1s),.led(hrs1s));
	decoder hour10s (.sw(w_hrs10s),.led(hrs10s));
	
	decoder days1s (.sw(w_day1s),.led(day1s));
	decoder days10s (.sw(w_day10s),.led(day10s));
	
	decoder months1s (.sw(w_mon1s),.led(mon1s));
	decoder months10s (.sw(w_mon10s),.led(mon10s));
	
	decoder years1s (.sw(w_year1s),.led(year1s));
	decoder years10s (.sw(w_year10s),.led(year10s));
	
	decoder century1s (.sw(w_cen1s),.led(cen1s));
	decoder century10s (.sw(w_cen10s),.led(cen10s));
	
endmodule