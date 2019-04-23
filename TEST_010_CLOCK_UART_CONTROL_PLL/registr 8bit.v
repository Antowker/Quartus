module registr_8bit (
						input		wire			   clk,
						input    wire	[7:0]		data,
						output	reg	[7:0]    out
);

always @(posedge clk) begin
	out <= data;
end 

endmodule