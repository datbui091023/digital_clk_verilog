module debounce_button(
	input clk_50MHz,
	input min_b, hrs_b, day_b, mon_b, year_b, cen_b,
	output w_min_b,w_hrs_b,w_day_b,w_mon_b,w_year_b,w_cen_b
);

	reg a,b,c,d,e,f,g,h,i,j,k,l,m,n,p,s,u,v;
	
	// set minutes
	always @(posedge clk_50MHz) begin
        a <= min_b;
        b <= a;
        c <= b;
    end
    assign w_min_b = c;
	 
	 
	 // set hours
	 always @(posedge clk_50MHz) begin
        d <= hrs_b;
        e <= d;
        f <= e;
    end
    assign w_hrs_b = f;
	 
	 
	 // set day
	 always @(posedge clk_50MHz) begin
        g <= day_b;
        h <= g;
        i <= h;
    end
    assign w_day_b = i;
	 
	 // set month
	  always @(posedge clk_50MHz) begin
        j <= day_b;
        k <= j;
        l <= k;
    end
    assign w_mon_b = l;
	 
	 // set year
	  always @(posedge clk_50MHz) begin
        m <= day_b;
        n <= m;
        p <= n;
    end
    assign w_year_b = p;
	 
	 
	 // Set century
	 
	  always @(posedge clk_50MHz) begin
        s <= day_b;
        u <= s;
        v <= u;
    end
    assign w_cen_b = v;

endmodule