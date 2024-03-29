module Generator_1Hz(
	input reset, 								// switch reset signal
	input clk_50MHz, 						// DE2 sys clock 50MHz
	output sig_1Hz 							// 1Hz output signal
);
    
	 reg [25:0] ctr_1Hz = 25'h0;
    reg r_1Hz = 1'b0;
    
    always @(posedge clk_50MHz or posedge reset) begin
        if(reset)
            ctr_1Hz <= 25'h0;
        else
            if(ctr_1Hz == 25_000_000 ) begin
                ctr_1Hz <= 32'h0;
                r_1Hz <= ~r_1Hz;
            end
            else begin
                ctr_1Hz <= ctr_1Hz + 1;
				end 
		end
		assign sig_1Hz = r_1Hz;

		
endmodule