module num_split(
                     input    wire    [3:0]    reconfig_l,
							input    wire    [3:0]    reconfig_m,
							input    wire             reconfig_en,
							input    wire             resett,
							input    wire             clk,
                     input    wire    [5:0]    data,
                     output   reg     [3:0]    l,
                     output   reg     [3:0]    m                    
);

reg [5:0] temp_data = 0;

always @(posedge clk) begin 
	temp_data <= data;
end

always @(posedge clk) begin
	if (resett) begin 
		l <= 0;
	end else if (reconfig_en) begin
		l <= reconfig_l;
	end else if(temp_data != data) begin
		if (l < 9) begin
			l <= l + 1;
		end else begin
			l <= 0;
		end
		
	end
end

always @(posedge clk) begin
	if (resett) begin 
		m <= 0;
	end else if (reconfig_en) begin
		m <= reconfig_m;
	end else if(temp_data != data) begin
		if (m < 6) begin
			if (l == 9) begin
				m <= m + 1;
			end
		end else begin
			m <= 0;
		end
	end
end

endmodule