module top_module(

	input clk_50MHz,													// system clock
	input reset,														// reset switch
	input min_b, hrs_b, day_b, mon_b, year_b, cen_b,		// seting button
	
	output [6:0] sec_1s, sec_10s,
	output [6:0] min_1s, min_10s,
	output [6:0] hrs_1s, hrs_10s,
	output [6:0] day_1s, day_10s,
	output [6:0] mon_1s, mon_10s,
	output [6:0] year_1s, year_10s,
	output [6:0] cen_1s, cen_10s
);	
	// wire cho 1Hz

	wire w_sig_1Hz; 
	
	// wire cho button
	
	wire  w_min_b,w_hrs_b,w_day_b,w_mon_b,w_year_b,w_cen_b;
	
	// Reset cho cac module 
	wire w_end_day,w_end_month,w_end_year,w_end_century;
	wire w_leap_year;
	
	// output cua cac module counter
	
	wire [5:0] w_sec_ctr, w_min_ctr;
	wire [4:0] w_hrs_ctr;
	
	wire [3:0] w_month_o; 
	wire [6:0] w_year_o;
	wire [4:0] w_day_o;
	wire [6:0] w_cen_o;
	
	
	
	
	// 1Hz
	Generator_1Hz Gen1s(.clk_50MHz(clk_50MHz), .reset(reset), .sig_1Hz(w_sig_1Hz));
	
	// Button module
	
	debounce_button button (.clk_50MHz(clk_50MHz),
									.min_b(min_b),.hrs_b(hrs_b),.day_b(day_b), 
									.mon_b(mon_b),.year_b(year_b),.cen_b(cen_b),
									.w_min_b(w_min_b),.w_hrs_b(w_hrs_b),.w_day_b(w_day_b),
									.w_mon_b(w_mon_b),.w_year_b(w_year_b),.w_cen_b(w_cen_b)
									);
	
	
	/* 
	debouncing_b min_db (.clk_50MHz(clk_50MHz),.button(min_b),.xxx_b(w_min_b));
	debouncing_b hrs_db (.clk_50MHz(clk_50MHz),.button(hrs_b),.xxx_b(w_hrs_b));
	debouncing_b day_db (.clk_50MHz(clk_50MHz),.button(day_b),.xxx_b(w_day_b));
	debouncing_b mon_db (.clk_50MHz(clk_50MHz),.button(mon_b),.xxx_b(w_mon_b));
	debouncing_b year_db (.clk_50MHz(clk_50MHz),.button(year_b),.xxx_b(w_year_b));
	debouncing_b cen_db (.clk_50MHz(clk_50MHz),.button(cen_b),.xxx_b(w_cen_b));
	*/
	
	
	// Counter module
	
	sec_counter seconds (.sig_1Hz(w_sig_1Hz),.reset(reset),.sec_ctr(w_sec_ctr));
	
	min_counter minutes (.sig_1Hz(w_sig_1Hz),.reset(reset),
								.min_b(w_min_b),.sec_ctr(w_sec_ctr),.min_ctr(w_min_ctr));
								
	hrs_counter hours (.sig_1Hz(w_sig_1Hz),.reset(reset),.hrs_b(w_hrs_b),
								.min_ctr(w_min_ctr),.sec_ctr(w_sec_ctr),
								.hrs_crt(w_hrs_ctr), .end_day(w_end_day));
	
	
	ngay days (.sig_1Hz(w_sig_1Hz),.reset(reset),
				.day_b(w_day_b),.end_day(w_end_day),
				.month(w_month_o),.leap_year(w_leap_year),
				.end_month(w_end_month),.day_o(w_day_o));
				
				
	thang months (.sig_1Hz(w_sig_1Hz),.reset(reset),
					 .end_day(w_end_day),.end_month(w_end_month),
					 .mon_b(w_mon_b), .day( w_day_o),
					 .end_year(w_end_year),.month_o(w_month_o));
	
	nam   years (.sig_1Hz(w_sig_1Hz),.reset(reset),
					.year_b(w_year_b),.end_year(w_end_year),
					.end_century(w_end_century),
					.year_o(w_year_o));
	
	theky century (.sig_1Hz(w_sig_1Hz),.reset(reset),
						.cen_b(w_cen_b),.end_century(w_end_century),
						.cen_o(w_cen_o));
	// Leap year check 
	
	leap_check check_leap(.year(w_year_o),.leap_c(w_leap_year));
	
	// BCD
	
	BCD_7s bcd (.sec_ctr(w_sec_ctr),.min_ctr(w_min_ctr),.hrs_ctr(w_hrs_ctr),
					.month_o(w_month_o),.day_o(w_day_o),.year_o(w_year_o),.cen_o(w_cen_o),
					.sec1s(sec_1s), .sec10s(sec_10s),
					.min1s(min_1s), .min10s(min_10s),
					.hrs1s(hrs_1s), .hrs10s(hrs_10s),
					.day1s(day_1s), .day10s(day_10s),
					.mon1s(mon_1s), .mon10s(mon_10s),
					.year1s(year_1s),.year10s(year_10s),
					.cen1s(cen_1s), .cen10s(cen_10s));
	
	
	
	
	
	
endmodule